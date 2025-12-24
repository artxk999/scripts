local player = game.Players.LocalPlayer

function shield(char)
    local weaponAlreadyEquipped
    local weaponsList = {"SteampunkGlove", "Taser", "ChartreusePeriastron", "FallPeriastron", "LinkedSword", "8BitSword", "PotOfGoldSword", "FuseBomb", "NeonSpaceGun", "RedHyperLaser", "LaserFingerPointers", "Acceleration Coil", "AmethystPeriastron", "AzurePeriastron", "ChristmasTreeSword", "CrimsonPeriastron", "FestivePeriastron", "FireSword", "GoldenCarpet", "GrimgoldPeriastron", "IvoryPeriastron", "RainbowMagicCarpet", "RainbowPeriastron", "RocketBoots", "WaterSword"}
    for _, obj in ipairs(char:GetChildren()) do
        for _, e in ipairs(weaponsList) do
            if obj.Name == e then
                weaponAlreadyEquipped = obj.Name
                local w = char:FindFirstChild(weaponAlreadyEquipped)
                w.Parent = player.Backpack
            end
        end
    end
    local tool = player.Backpack:FindFirstChild('ChartreusePeriastron')
    tool.Parent = char
    local remote = tool:WaitForChild('Remote')
    tool.Equipped:Connect(function()
        remote:FireServer(Enum.KeyCode.Q)    
    end)
    tool.Parent = player.Backpack
    if weaponAlreadyEquipped ~= nil then
        local weapon = player.Backpack:FindFirstChild(weaponAlreadyEquipped)
        weapon.Parent = char
    end
end

Workspace.ChildAdded:Connect(function(obj)
    if obj.Name == 'SONARPeri' then
        shield(player.Character)
    end
end)

player.CharacterAdded:Connect(function(char)
    local hum = char:WaitForChild('Humanoid')
    local lastHealth = hum.Health
    hum.HealthChanged:Connect(function(newHealth)
        if newHealth < lastHealth then
            shield(char)
        end
        lastHealth = newHealth
    end)
end)