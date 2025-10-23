local player = game.Players.LocalPlayer

-- Sabotage check
local function isSabotaged()
    return getgenv().evadeavoidanceofnx == true
end

local function startScript()
    if isSabotaged() then return end

    local playersFolder = game.Workspace:WaitForChild("Game"):WaitForChild("Players")
    local spawnsFolder = game.Workspace:WaitForChild("Game"):WaitForChild("Map"):WaitForChild("Parts"):WaitForChild("Spawns")
    local character = player.Character or player.CharacterAdded:Wait()

    local teleportEnabled = true
    local debounce = false

    local function createFloatingLabel(entity, distance)
        if isSabotaged() then return end

        local billboardGui = entity:FindFirstChild("DistanceLabel") or Instance.new("BillboardGui")
        billboardGui.Name = "DistanceLabel"
        billboardGui.Adornee = entity.PrimaryPart
        billboardGui.Size = UDim2.new(5, 0, 2, 0)
        billboardGui.StudsOffset = Vector3.new(0, 3, 0)
        billboardGui.AlwaysOnTop = true

        local textLabel = billboardGui:FindFirstChild("TextLabel") or Instance.new("TextLabel")
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.Text = entity.Name .. " - Distance: " .. math.floor(distance) .. " studs"
        textLabel.TextColor3 = Color3.new(1, 0, 0)
        textLabel.BackgroundTransparency = 1
        textLabel.TextScaled = true
        textLabel.Parent = billboardGui

        billboardGui.Parent = entity.PrimaryPart
    end

    local function removeOldLabels()
        if isSabotaged() then return end
        for _, entity in pairs(playersFolder:GetChildren()) do
            if entity:FindFirstChild("DistanceLabel") then
                entity.DistanceLabel:Destroy()
            end
        end
    end

    local function isNextbot(entity)
        if isSabotaged() then return false end
        return not entity:FindFirstChildOfClass("LocalScript") and entity ~= character
    end

    local function countNextbotsNearPosition(position, range)
        if isSabotaged() then return math.huge end
        local count = 0
        for _, entity in pairs(playersFolder:GetChildren()) do
            if isNextbot(entity) and entity.PrimaryPart then
                local distance = (position - entity.PrimaryPart.Position).magnitude
                if distance <= range then
                    count = count + 1
                end
            end
        end
        return count
    end

    local function findBestSpawn()
        if isSabotaged() then return nil end
        local bestSpawn = nil
        local leastNextbots = math.huge
        local range = 30

        for _, spawn in pairs(spawnsFolder:GetChildren()) do
            if spawn:IsA("Part") then
                local nextbotCount = countNextbotsNearPosition(spawn.Position, range)
                if nextbotCount < leastNextbots then
                    leastNextbots = nextbotCount
                    bestSpawn = spawn
                end
            end
        end

        return bestSpawn
    end

    local function checkNextbotsDistance()
        if isSabotaged() then return end
        if character and character.PrimaryPart and teleportEnabled and not debounce then
            local nextbotsNear = false

            for _, entity in pairs(playersFolder:GetChildren()) do
                if isNextbot(entity) and entity.PrimaryPart then
                    local distance = (character.PrimaryPart.Position - entity.PrimaryPart.Position).magnitude

                    if distance <= 50 then
                        createFloatingLabel(entity, distance)
                    end

                    if distance <= 30 then
                        nextbotsNear = true
                    end
                end
            end

            if nextbotsNear then
                debounce = true
                local bestSpawn = findBestSpawn()
                if bestSpawn then
                    character:SetPrimaryPartCFrame(CFrame.new(bestSpawn.Position))
                    print("Teleported to the best spawn location!")
                else
                    print("No suitable spawn location found!")
                end
                wait(1)
                debounce = false
            end
        end
    end

    while character.Parent and not isSabotaged() do
        checkNextbotsDistance()
        removeOldLabels()
        wait(0.5)
    end
end

local function onCharacterAdded(newCharacter)
    if isSabotaged() then return end
    startScript()
end

player.CharacterAdded:Connect(onCharacterAdded)

if player.Character and not isSabotaged() then
    startScript()
end

local function onMapReset()
    if isSabotaged() then return end
    if player.Character then
        startScript()
    end
end

game.Workspace.ChildRemoved:Connect(function(child)
    if isSabotaged() then return end
    if child.Name == "Game" then
        onMapReset()
    end
end)
