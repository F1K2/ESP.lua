-- Fonction ESP améliorée
local function ESPFunction()
    while Configuration.ESP do
        task.wait()  -- Gestion des performances

        local Players = game:GetService("Players")
        local localPlayer = Players.LocalPlayer
        local camera = workspace.CurrentCamera

        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= localPlayer and player.Character then
                local character = player.Character
                local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                local humanoid = character:FindFirstChild("Humanoid")

                if humanoidRootPart and humanoid and humanoid.Health > 0 then
                    local screenPos, onScreen = camera:WorldToViewportPoint(humanoidRootPart.Position)

                    if onScreen then
                        local espGui = character:FindFirstChild("ESPIndicator")
                        if not espGui then
                            espGui = Instance.new("BillboardGui")
                            espGui.Name = "ESPIndicator"
                            espGui.Adornee = humanoidRootPart
                            espGui.Size = UDim2.new(0, 50, 0, 50)
                            espGui.StudsOffset = Vector3.new(0, 2, 0)
                            espGui.AlwaysOnTop = true
                            espGui.Parent = character

                            local frame = Instance.new("Frame")
                            frame.Size = UDim2.new(1, 0, 1, 0)
                            frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                            frame.BackgroundTransparency = 0.5
                            frame.Parent = espGui

                            local textLabel = Instance.new("TextLabel")
                            textLabel.Size = UDim2.new(2, 0, 0.5, 0)
                            textLabel.Position = UDim2.new(-0.5, 0, -0.5, 0)
                            textLabel.BackgroundTransparency = 1
                            textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                            textLabel.Text = player.Name
                            textLabel.Parent = espGui
                        end
                    else
                        local espGui = character:FindFirstChild("ESPIndicator")
                        if espGui then
                            espGui:Destroy()
                        end
                    end
                end
            end
        end
    end

    for _, player in ipairs(Players:GetPlayers()) do
        if player.Character then
            local espGui = player.Character:FindFirstChild("ESPIndicator")
            if espGui then
                espGui:Destroy()
            end
        end
    end
end
