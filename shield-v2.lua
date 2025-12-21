local player = game.Players.LocalPlayer
local char = player.Character
local hum = char:WaitForChild('Humanoid')

function shield()
    local weaponAlreadyEquipped
    local weaponsList = {"SteampunkGlove", "Taser", "ChartreusePeriastron", "FallPeriastron", "LinkedSword", "8BitSword", "PotOfGoldSword", "FuseBomb", "NeonSpaceGun", "RedHyperLaser", "LaserFingerPointers"}
    for _, obj in ipairs(char:GetChildren()) do
        for _, e in ipairs(weaponsList) do
            if obj.Name == e then
                weaponAlreadyEquipped = obj.Name
                local w = player.Character:FindFirstChild(weaponAlreadyEquipped)
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

Workspace.DescendantAdded:Connect(function(obj)
    if obj.Name == 'SONARPeri' then
        shield()
    end
end)

local lastHealth = hum.Health

hum.HealthChanged:Connect(function(newHealth)
    if newHealth < lastHealth then
        shield()
    end
    lastHealth = newHealth
end)