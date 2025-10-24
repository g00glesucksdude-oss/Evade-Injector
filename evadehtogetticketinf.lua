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
        warn("No tickets found in the folder!")
        return
    end

    local randomIndex = math.random(1, #tickets)
    local randomTicket = tickets[randomIndex]

    local targetCFrame

    if randomTicket:IsA("BasePart") then
        targetCFrame = randomTicket.CFrame
    elseif randomTicket:IsA("Model") then
        if randomTicket.PrimaryPart then
            targetCFrame = randomTicket.PrimaryPart.CFrame
        else
            local firstPart = randomTicket:FindFirstChildWhichIsA("BasePart")
            if firstPart then
                targetCFrame = firstPart.CFrame
            end
        end
    end

    if targetCFrame then
        hrp.CFrame = targetCFrame + Vector3.new(0, 5, 0) -- spawn slightly above
        print("Teleported to:", randomTicket.Name)
    else
        warn("Could not find a valid position for:", randomTicket.Name)
    end
end

-- Listen for H key press
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end -- ignore if typing in chat, etc.
    if input.KeyCode == Enum.KeyCode.H then
        teleportToRandomTicket()
    end
end)
