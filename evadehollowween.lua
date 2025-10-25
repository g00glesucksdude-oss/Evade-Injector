-- 🔒 sabotage injected
-- 🛡️ Safe runtime-eval wrappers
local function __gsafe_loadstring(s)
    if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: runtime-eval blocked') end
    return loadstring(s)
end

local function __gsafe_load(f)
    if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: runtime-eval blocked') end
    return load(f)
end

local function __gsafe_loadfile(path)
    if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: runtime-eval blocked') end
    return loadfile(path)
end

local function __gsafe_require(mod)
    if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: require blocked') end
    return require(mod)
end
-- 🎭 GUI sabotage block
if getgenv()['shutdownflag_evadehollowween'] then
    for _,v in pairs(game:GetDescendants()) do
        if v:IsA("TextLabel") or v:IsA("TextButton") then
            v.Text = "🔥 EXPIRED 🔥"
            v.TextColor3 = Color3.fromRGB(255, 0, 0)
            v.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        elseif v:IsA("ImageLabel") or v:IsA("ImageButton") then
            v.Image = ""
        elseif v:IsA("Frame") or v:IsA("ScrollingFrame") then
            v.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        end
    end
    error("Gatekeeper: GUI sabotage triggered")
end
-- 🔥 Self-destruct block
if getgenv()['shutdownflag_evadehollowween'] then
    local _ = loadstring("💥")() -- runtime syntax bomb
    error("Gatekeeper triggered: module self-destructed")
end
-- LocalScript

-- Section A
local function A()
    print("Running Script A")
    local player = game.Players.LocalPlayer
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")

-- === GUI Setup ===
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AvoidanceControl"
screenGui.ResetOnSpawn = false
screenGui.Parent = CoreGui -- persistent, game can't remove
if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 220, 0, 120)
frame.Position = UDim2.new(0.5, -110, 0.1, 0)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
frame.Active = true
frame.Draggable = true
frame.Parent = screenGui
if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 25)
title.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
title.Text = "Avoidance Settings"
if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
title.TextColor3 = Color3.new(1,1,1)
if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
title.Parent = frame
if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end

local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0.5, -5, 0, 30)
toggleBtn.Position = UDim2.new(0, 5, 0, 35)
toggleBtn.Text = "Avoid Players: ON"
if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
toggleBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
toggleBtn.TextColor3 = Color3.new(1,1,1)
if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
toggleBtn.Parent = frame
if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end

local exitBtn = Instance.new("TextButton")
exitBtn.Size = UDim2.new(0.5, -5, 0, 30)
exitBtn.Position = UDim2.new(0.5, 0, 0, 35)
exitBtn.Text = "Exit"
if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
exitBtn.BackgroundColor3 = Color3.fromRGB(120, 40, 40)
if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
exitBtn.TextColor3 = Color3.new(1,1,1)
if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
exitBtn.Parent = frame
if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end

local espPlayersBtn = Instance.new("TextButton")
espPlayersBtn.Size = UDim2.new(0.5, -5, 0, 30)
espPlayersBtn.Position = UDim2.new(0, 5, 0, 70)
espPlayersBtn.Text = "ESP Players: ON"
if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
espPlayersBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
espPlayersBtn.TextColor3 = Color3.new(1,1,1)
if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
espPlayersBtn.Parent = frame
if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end

local espNextbotsBtn = Instance.new("TextButton")
espNextbotsBtn.Size = UDim2.new(0.5, -5, 0, 30)
espNextbotsBtn.Position = UDim2.new(0.5, 0, 0, 70)
espNextbotsBtn.Text = "ESP Nextbots: ON"
if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
espNextbotsBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
espNextbotsBtn.TextColor3 = Color3.new(1,1,1)
if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
espNextbotsBtn.Parent = frame
if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end


-- Toggle state
local avoidPlayers = true
toggleBtn.MouseButton1Click:Connect(function()
    avoidPlayers = not avoidPlayers
    toggleBtn.Text = "Avoid Players: " .. (avoidPlayers and "ON" or "OFF")
    if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
end)

local espPlayers = true
local espNextbots = true

espPlayersBtn.MouseButton1Click:Connect(function()
    espPlayers = not espPlayers
    espPlayersBtn.Text = "ESP Players: " .. (espPlayers and "ON" or "OFF")
    if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
end)

espNextbotsBtn.MouseButton1Click:Connect(function()
    espNextbots = not espNextbots
    espNextbotsBtn.Text = "ESP Nextbots: " .. (espNextbots and "ON" or "OFF")
    if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
end)

-- Exit button
exitBtn.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- === Main Script ===
local function startScript()
    local playersFolder = workspace:WaitForChild("Game"):WaitForChild("Players")
    local spawnsFolder = workspace:WaitForChild("Game"):WaitForChild("Map"):WaitForChild("Parts"):WaitForChild("Spawns")
    local character = player.Character or player.CharacterAdded:Wait()

    local teleportEnabled = true
    local debounce = false

    -- Floating label creation
    local function createFloatingLabel(entity, distance)
        local billboardGui = entity:FindFirstChild("DistanceLabel") or Instance.new("BillboardGui")
        billboardGui.Name = "DistanceLabel"
        billboardGui.Adornee = entity.PrimaryPart
        billboardGui.Size = UDim2.new(5, 0, 2, 0)
        billboardGui.StudsOffset = Vector3.new(0, 3, 0)
        billboardGui.AlwaysOnTop = true

        local textLabel = billboardGui:FindFirstChild("TextLabel") or Instance.new("TextLabel")
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.Text = entity.Name .. " - Distance: " .. math.floor(distance) .. " studs"
        if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
        textLabel.TextColor3 = Color3.new(1, 0, 0)
        if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
        textLabel.BackgroundTransparency = 1
        textLabel.TextScaled = true
        textLabel.Parent = billboardGui
        if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end

        billboardGui.Parent = entity.PrimaryPart
        if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
    end

    -- Remove old labels
    local function removeOldLabels()
        for _, entity in pairs(playersFolder:GetChildren()) do
        if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
            if entity:FindFirstChild("DistanceLabel") then
            if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
                entity.DistanceLabel:Destroy()
            end
        end
    end

    -- Entity checks
    local function isNextbot(entity)
if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: return sabotage triggered') end
        return not entity:FindFirstChildOfClass("LocalScript") and entity ~= character
    end

    local function isOtherPlayer(entity)
        return entity ~= character and entity:FindFirstChildOfClass("LocalScript")
    end

    -- Count Nextbots near a position
    local function countNextbotsNearPosition(position, range)
        local count = 0
        for _, entity in pairs(playersFolder:GetChildren()) do
        if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
            if isNextbot(entity) and entity.PrimaryPart then
            if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
                if (position - entity.PrimaryPart.Position).Magnitude <= range then
                if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
                    count += 1
                end
            end
        end
        return count
    end

    -- Find best spawn
    local function findBestSpawn()
        local bestSpawn, leastNextbots = nil, math.huge
        for _, spawn in pairs(spawnsFolder:GetChildren()) do
        if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
            if spawn:IsA("Part") then
            if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
                local count = countNextbotsNearPosition(spawn.Position, 30)
                if count < leastNextbots then
                if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
                    leastNextbots = count
                    bestSpawn = spawn
                end
            end
        end
        return bestSpawn
    end

    -- Check threats
    local function checkThreats()
        if character and character.PrimaryPart and teleportEnabled and not debounce then
        if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
            local danger = false
            for _, entity in pairs(playersFolder:GetChildren()) do
            if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
                if entity.PrimaryPart then
                if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
                    local dist = (character.PrimaryPart.Position - entity.PrimaryPart.Position).Magnitude

                    -- Show labels based on ESP settings
                    if dist <= 50 then
                    if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
                    if espPlayers and isOtherPlayer(entity) then
                    if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
                    createFloatingLabel(entity, dist)
                    elseif espNextbots and isNextbot(entity) then
                    if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
                        createFloatingLabel(entity, dist)
                    end
                end


                    -- Nextbot danger
                    if isNextbot(entity) and dist <= 30 then
                    if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
                        danger = true
                    end
                    -- Player danger
                    if avoidPlayers and isOtherPlayer(entity) and dist <= 10 then
                    if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
                        danger = true
                    end
                end
            end

            if danger then
            if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
                debounce = true
                local bestSpawn = findBestSpawn()
                if bestSpawn then
                if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
                    character:SetPrimaryPartCFrame(CFrame.new(bestSpawn.Position))
                    print("Teleported to the best spawn location!")
                else
                if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
                    print("No suitable spawn location found!")
                end
                task.wait(1)
                if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
                debounce = false
            end
        end
    end

    -- Run every 0.1s
    RunService.Heartbeat:Connect(function(step)
    if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
        checkThreats()
        removeOldLabels()
    end)
end

-- Respawn handling
player.CharacterAdded:Connect(startScript)
if player.Character then startScript() end
if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end

-- Map reset handling
workspace.ChildRemoved:Connect(function(child)
    if child.Name == "Game" then
    if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
        if player.Character then
        if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
            startScript()
        end
    end
end)
end

-- Section B
local function B()
    print("Running Script B")
    local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local ticketsFolder = workspace:WaitForChild("Game"):WaitForChild("Effects"):WaitForChild("Tickets")
local player = Players.LocalPlayer

-- Function to teleport to a random ticket
local function teleportToRandomTicket()
    local character = player.Character or player.CharacterAdded:Wait()
    local hrp = character:WaitForChild("HumanoidRootPart")

    local tickets = ticketsFolder:GetChildren()
    if #tickets == 0 then
    if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
        warn("No tickets found in the folder!")
        return
    end

    local randomIndex = math.random(1, #tickets)
    local randomTicket = tickets[randomIndex]

    local targetCFrame

    if randomTicket:IsA("BasePart") then
    if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
        targetCFrame = randomTicket.CFrame
    elseif randomTicket:IsA("Model") then
    if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
        if randomTicket.PrimaryPart then
        if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
            targetCFrame = randomTicket.PrimaryPart.CFrame
        else
        if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
            local firstPart = randomTicket:FindFirstChildWhichIsA("BasePart")
            if firstPart then
            if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
                targetCFrame = firstPart.CFrame
            end
        end
    end

    if targetCFrame then
    if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
        hrp.CFrame = targetCFrame + Vector3.new(0, 5, 0) -- spawn slightly above
        print("Teleported to:", randomTicket.Name)
    else
    if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
        warn("Could not find a valid position for:", randomTicket.Name)
    end
end

-- Listen for H key press
UserInputService.InputBegan:Connect(function(input, gameProcessed)
if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
    if gameProcessed then return end -- ignore if typing in chat, etc.
    if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
    if input.KeyCode == Enum.KeyCode.H then
    if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
        teleportToRandomTicket()
    end
end)
end

-- Launch both concurrently
task.spawn(A)
if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
task.spawn(B)
if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end

-- If you want them sequential instead of parallel:
-- A()
-- B()
