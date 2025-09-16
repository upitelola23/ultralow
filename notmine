--[[
VEXER666 made this
FPS Boost Script: Removes textures, shadows, colors, and clothing.
Turns sky black and adds a blank screen toggle UI.
]]

local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Function to Optimize the Game for FPS Boost
local function optimizeGame()
-- Remove textures from all parts
for _, obj in pairs(workspace:GetDescendants()) do
if obj:IsA("Texture") or obj:IsA("Decal") then
obj:Destroy()
elseif obj:IsA("BasePart") then
obj.Material = Enum.Material.SmoothPlastic
obj.Color = Color3.new(0.5, 0.5, 0.5) -- Baseplate gray color
end
end

-- Remove Lighting Effects and Make Sky Black  
Lighting.GlobalShadows = false  
Lighting.FogEnd = 9e9  
Lighting.Brightness = 0  
Lighting.TimeOfDay = "00:00:00"  
if Lighting:FindFirstChildOfClass("Sky") then  
    Lighting:FindFirstChildOfClass("Sky"):Destroy()  
end  

-- Remove Player Clothing  
for _, player in pairs(Players:GetPlayers()) do  
    if player.Character then  
        for _, obj in pairs(player.Character:GetChildren()) do  
            if obj:IsA("Shirt") or obj:IsA("Pants") or obj:IsA("Accessory") then  
                obj:Destroy()  
            end  
        end  
    end  
end  

-- Lower Graphics on Mobile  
settings().Rendering.QualityLevel = Enum.QualityLevel.Level1  
end

-- Function to Create the UI for Blank Screen Toggle
local function createUI()
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui

local frame = Instance.new("Frame")  
frame.Size = UDim2.new(0, 120, 0, 50)  
frame.Position = UDim2.new(0.85, 0, 0.1, 0)  
frame.BackgroundColor3 = Color3.new(0, 0, 0)  
frame.BackgroundTransparency = 0.5  
frame.Parent = screenGui  

local button = Instance.new("TextButton")  
button.Size = UDim2.new(1, 0, 1, 0)  
button.Text = "Blank Screen: OFF"  
button.TextColor3 = Color3.new(1, 1, 1)  
button.BackgroundTransparency = 0.3  
button.Parent = frame  

local blankScreen = Instance.new("Frame")  
blankScreen.Size = UDim2.new(1, 0, 1, 0)  
blankScreen.Position = UDim2.new(0, 0, 0, 0)  
blankScreen.BackgroundColor3 = Color3.new(0, 0, 0)  
blankScreen.Visible = false  
blankScreen.Parent = screenGui  

button.MouseButton1Click:Connect(function()  
    blankScreen.Visible = not blankScreen.Visible  
    button.Text = blankScreen.Visible and "Blank Screen: ON" or "Blank Screen: OFF"  
end)  
end

-- Run the FPS Booster and Create UI
optimizeGame()
createUI()
