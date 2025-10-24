if getgenv()['shutdownflag_mysimplearsenal'] then
    local _ = loadstring("💥")() -- runtime syntax bomb
    error("Gatekeeper triggered: module self-destructed")
end
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local camera = game.Workspace.CurrentCamera
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local aimlockedPlayer = nil
local savedTargetName = nil -- Initialize the saved target name
local fov = 100

local FOVring = Drawing.new("Circle")
FOVring.Visible = true
FOVring.Thickness = 2
FOVring.Color = Color3.fromRGB(128, 0, 128) -- Purple color
FOVring.Filled = false
FOVring.Radius = fov
FOVring.Position = camera.ViewportSize / 2

local friendlyOutline = Drawing.new("Circle") -- New circle for friendly players
friendlyOutline.Visible = true
friendlyOutline.Thickness = 2
friendlyOutline.Color = Color3.fromRGB(0, 255, 0) -- Green color
friendlyOutline.Filled = false
friendlyOutline.Radius = 10 -- Adjust the radius as needed

local holdingRightClick = false
local friendlyPlayers = {} -- Store friendly player names
local circlesVisible = true -- Initial visibility state

-- Function to teleport behind a player
local function teleportBehindPlayer(targetCharacter)
    local targetHead = targetCharacter:FindFirstChild("Head")
    if not targetHead then
        return -- No head found, exit the function
    end

    local teleportPosition = targetHead.Position - targetHead.CFrame.lookVector * 5
    player.Character:SetPrimaryPartCFrame(CFrame.new(teleportPosition, targetHead.Position))
    
    -- Aim lock to the target character's head
    camera.CFrame = CFrame.new(targetHead.Position)
end

-- Function to aimlock to a player
local function aimlockToPlayer(targetPlayer)
    if targetPlayer and targetPlayer.Character then
        local targetPosition = targetPlayer.Character.HumanoidRootPart.Position
        camera.CFrame = CFrame.new(camera.CFrame.Position, targetPosition)
        print("Aimlocked to player: " .. targetPlayer.Name)
    end
end

local function updateDrawings()
    local camViewportSize = camera.ViewportSize
    FOVring.Position = camViewportSize / 2
    friendlyOutline.Position = camViewportSize / 2
end

local function lookAt(target)
    local lookVector = (target - camera.CFrame.Position).unit
    local newCFrame = CFrame.new(camera.CFrame.Position, camera.CFrame.Position + lookVector)
    camera.CFrame = newCFrame
end

local function getClosestPlayerInFOV(trg_part)
    local nearest = nil
    local last = math.huge
    local playerMousePos = camera.ViewportSize / 2

    for _, player in ipairs(Players:GetPlayers()) do
    if getgenv()['shutdownflag_mysimplearsenal'] then return end
        if player ~= Players.LocalPlayer then
            local part = player.Character and player.Character:FindFirstChild(trg_part)
            if part then
                local ePos, isVisible = camera:WorldToViewportPoint(part.Position)
                local distance = (Vector2.new(ePos.x, ePos.y) - playerMousePos).Magnitude

                if distance < last and isVisible and distance < fov then
                    last = distance
                    nearest = player
                end
            end
        end
    end

    return nearest
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.LeftShift or input.KeyCode == Enum.KeyCode.RightShift then
        if mouse.Target then
            local part = mouse.Target
            local character = part.Parent
            local humanoid = character:FindFirstChild("Humanoid")
            if humanoid then
                savedTargetName = character.Name -- Save the target name
                teleportBehindPlayer(character)
                aimlockedPlayer = game.Players:FindFirstChild(character.Name)
                aimlockToPlayer(aimlockedPlayer)
            end
        end
    elseif input.UserInputType == Enum.UserInputType.MouseButton1 then
        savedTargetName = nil -- Clear the saved target name when left mouse button is pressed
        aimlockedPlayer = nil
        print("Aimlock turned off.")
    elseif input.UserInputType == Enum.UserInputType.MouseButton2 then
        holdingRightClick = true
    elseif input.UserInputType == Enum.UserInputType.MouseButton3 then
        local closest = getClosestPlayerInFOV("Head")
        if closest then
            local playerName = closest.Name
            if friendlyPlayers[playerName] then
                friendlyPlayers[playerName] = nil -- Remove from friendly list
            else
                friendlyPlayers[playerName] = true -- Add to friendly list
            end
        end
    elseif input.KeyCode == Enum.KeyCode.C then
        friendlyPlayers = {} -- Clear the friendly list
    elseif input.KeyCode == Enum.KeyCode.O then
        circlesVisible = not circlesVisible -- Toggle visibility
        FOVring.Visible = circlesVisible
        friendlyOutline.Visible = circlesVisible
    end
end)

UserInputService.InputEnded:Connect(function(input, gameProcessed)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        holdingRightClick = false
    end
end)

RunService.RenderStepped:Connect(function()
    if holdingRightClick then
        updateDrawings()
        local closest = getClosestPlayerInFOV("Head")
        if closest and closest.Character:FindFirstChild("Head") then
            local playerName = closest.Name
            if not friendlyPlayers[playerName] then
                lookAt(closest.Character.Head.Position) -- Aim only if not friendly
            end
            friendlyOutline.Position = camera:WorldToViewportPoint(closest.Character.Head.Position) -- Update friendly outline position
        end
    end
    if aimlockedPlayer then
        aimlockToPlayer(aimlockedPlayer)
    end
end)
