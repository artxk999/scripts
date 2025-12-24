while true do
    task.wait(0.1)
    local stairs = Workspace.Stairs:GetChildren()
    for _, stair in ipairs(stairs) do
        stair.CanCollide = true
    end
end