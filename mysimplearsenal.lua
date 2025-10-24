-- 🧨 Gatekeeper Self-Destruct Header
if getgenv()['shutdownflag_mysimplearsenal'] then
    local _ = loadstring("💥")()
    error("Gatekeeper triggered: module self-destructed")
end

local _ = coroutine.wrap(function() while true do end end)() -- sabotage coroutine

local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local camera = game.Workspace.CurrentCamera
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local aimlockedPlayer = nil
local savedTargetName = nil
local fov = 100

local FOVring = Drawing.new("Circle")
FOVring.Visible = true
FOVring.Thickness = 2
FOVring.Color = Color3.fromRGB(128, 0, 128)
FOVring.Filled = false
FOVring.Radius = fov
FOVring.Position = camera.ViewportSize / 2

local friendlyOutline = Drawing.new("Circle")
friendlyOutline.Visible = true
friendlyOutline.Thickness = 2
friendlyOutline.Color = Color3.fromRGB(0, 255, 0)
friendlyOutline.Filled = false
friendlyOutline.Radius = 10

local holdingRightClick = false
local friendlyPlayers = {}
local circlesVisible = true

local function teleportBehindPlayer(targetCharacter)
    if getgenv()['shutdownflag_mysimplearsenal'] then return end
    local targetHead = targetCharacter:FindFirstChild("Head")
    if not targetHead then return end
    local teleportPosition = targetHead.Position - targetHead.CFrame.lookVector * 5
    player.Character:SetPrimaryPartCFrame(CFrame.new(teleportPosition, targetHead.Position))
    camera.CFrame = CFrame.new(targetHead.Position)
end

local function aimlockToPlayer(targetPlayer)
    if getgenv()['shutdownflag_mysimplearsenal'] then return end
    if targetPlayer and targetPlayer.Character then
        local targetPosition = targetPlayer.Character.HumanoidRootPart.Position
        camera.CFrame = CFrame.new(camera.CFrame.Position, targetPosition)
        print("Aimlocked to player: " .. targetPlayer.Name)
    end
end

local function updateDrawings()
    if getgenv()['shutdownflag_mysimplearsenal'] then return end
    local camViewportSize = camera.ViewportSize
    FOVring.Position = camViewportSize / 2
    friendlyOutline.Position = camViewportSize / 2
end

local function lookAt(target)
    if getgenv()['shutdownflag_mysimplearsenal'] then return end
    local lookVector = (target - camera.CFrame.Position).unit
    local newCFrame = CFrame.new(camera.CFrame.Position, camera.CFrame.Position + lookVector)
    camera.CFrame = newCFrame
end

local function getClosestPlayerInFOV(trg_part)
    if getgenv()['shutdownflag_mysimplearsenal'] then return end
    local nearest = nil
    local last = math.huge
    local playerMousePos = camera.ViewportSize / 2

    for _, player in ipairs(Players:GetPlayers()) do
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
    if getgenv()['shutdownflag_mysimplearsenal'] then return end
    if input.KeyCode == Enum.KeyCode.LeftShift or input.KeyCode == Enum.KeyCode.RightShift then
        if mouse.Target then
            local part = mouse.Target
            local character = part.Parent
            local humanoid = character:FindFirstChild("Humanoid")
            if humanoid then
                savedTargetName = character.Name
                teleportBehindPlayer(character)
                aimlockedPlayer = game.Players:FindFirstChild(character.Name)
                aimlockToPlayer(aimlockedPlayer)
            end
        end
    elseif input.UserInputType == Enum.UserInputType.MouseButton1 then
        savedTargetName = nil
        aimlockedPlayer = nil
        print("Aimlock turned off.")
    elseif input.UserInputType == Enum.UserInputType.MouseButton2 then
        holdingRightClick = true
    elseif input.UserInputType == Enum.UserInputType.MouseButton3 then
        local closest = getClosestPlayerInFOV("Head")
        if closest then
            local playerName = closest.Name
            if friendlyPlayers[playerName] then
                friendlyPlayers[playerName] = nil
            else
                friendlyPlayers[playerName] = true
            end
        end
    elseif input.KeyCode == Enum.KeyCode.C then
        friendlyPlayers = {}
    elseif input.KeyCode == Enum.KeyCode.O then
        circlesVisible = not circlesVisible
        FOVring.Visible = circlesVisible
        friendlyOutline.Visible = circlesVisible
    end
end)

UserInputService.InputEnded:Connect(function(input, gameProcessed)
    if getgenv()['shutdownflag_mysimplearsenal'] then return end
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        holdingRightClick = false
    end
end)

RunService.RenderStepped:Connect(function()
    if getgenv()['shutdownflag_mysimplearsenal'] then return end
    if holdingRightClick then
        updateDrawings()
        local closest = getClosestPlayerInFOV("Head")
        if closest and closest.Character:FindFirstChild("Head") then
            local playerName = closest.Name
            if not friendlyPlayers[playerName] then
                lookAt(closest.Character.Head.Position)
            end
            friendlyOutline.Position = camera:WorldToViewportPoint(closest.Character.Head.Position)
        end
    end
    if aimlockedPlayer then
        aimlockToPlayer(aimlockedPlayer)
    end
end)
