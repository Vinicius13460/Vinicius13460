-- Script to increase hitbox and add ESP to NPCs

-- Hitbox and ESP settings
local hitboxSize = Vector3.new(10, 10, 10)  -- Size of the hitbox
local hitboxTransparency = 0.5  -- Hitbox transparency
local espEnabled = true  -- Enable ESP

-- Function to expand the hitbox
local function expandHitbox(npc)
    if npc and npc:FindFirstChild("HumanoidRootPart") then
        local humanoidPart = npc:FindFirstChild("HumanoidRootPart")
        humanoidPart.Size = hitboxSize
        humanoidPart.Transparency = hitboxTransparency
        humanoidPart.CanCollide = false
    end
end

-- Function to apply ESP to the NPC
local function applyESP(npc)
    if npc and npc:FindFirstChild("HumanoidRootPart") then
        local humanoidPart = npc:FindFirstChild("HumanoidRootPart")

        -- Check if ESP (Highlight) already exists
        if not humanoidPart:FindFirstChild("Highlight") then
            local highlight = Instance.new("Highlight")
            highlight.Parent = humanoidPart
            highlight.FillColor = Color3.fromRGB(255, 0, 0)  -- Red color
            highlight.OutlineColor = Color3.fromRGB(0, 0, 0) -- Black outline
            highlight.FillTransparency = 0.5
            highlight.OutlineTransparency = 0
        end
    end
end

-- Function to expand hitboxes and apply ESP to all NPCs
local function expandHitboxesAndApplyESP()
    -- Iterate over all NPCs in the workspace
    for _, npc in pairs(workspace:GetChildren()) do
        if npc:IsA("Model") and npc:FindFirstChild("HumanoidRootPart") then
            expandHitbox(npc)
            if espEnabled then
                applyESP(npc)
            end
        end
    end
end

-- Loop to continuously apply changes
while true do
    expandHitboxesAndApplyESP()
    wait(1)  -- Check and apply changes every second
end
