-- Ultra-LDPlayer FPS Booster (VEXER666 Adaptado)
-- Limpieza extrema para LDPlayer / Android
-- One-shot, botón de pantalla negra, sin loop

local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- FUNCION: Limpiar mundo
local function optimizeGame()
    -- Limpiar texturas y decals
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("Texture") or obj:IsA("Decal")
        or obj:IsA("ParticleEmitter") or obj:IsA("Trail")
        or obj:IsA("Beam") or obj:IsA("Smoke") or obj:IsA("Fire") then
            obj:Destroy()
        elseif obj:IsA("BasePart") then
            obj.Material = Enum.Material.SmoothPlastic
            obj.Color = Color3.new(0.5,0.5,0.5)
        end
    end

    -- Lighting: apagar lo que existe en LDPlayer
    Lighting.GlobalShadows = false
    Lighting.FogEnd = 9e9
    Lighting.Brightness = 0
    Lighting.TimeOfDay = "00:00:00"
    for _, v in pairs(Lighting:GetChildren()) do
        if v:IsA("Sky") or v:IsA("Atmosphere") then
            v:Destroy()
        end
    end

    -- Limpiar ropa y accesorios de jugadores
    for _, plr in pairs(Players:GetPlayers()) do
        if plr.Character then
            for _, obj in pairs(plr.Character:GetChildren()) do
                if obj:IsA("Shirt") or obj:IsA("Pants")
                or obj:IsA("Accessory") or obj:IsA("Hat")
                or obj:IsA("ShirtGraphic") then
                    obj:Destroy()
                end
            end
        end
    end

    -- Forzar calidad mínima (puede no ser exacto en LDPlayer)
    pcall(function()
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level1
    end)
end

-- FUNCION: Crear botón de pantalla negra
local function createUI()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = playerGui

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 180, 0, 60) -- más grande para Android
    frame.Position = UDim2.new(0.5, -90, 0.05, 0) -- centrado arriba
    frame.BackgroundColor3 = Color3.new(0,0,0)
    frame.BackgroundTransparency = 0.5
    frame.Parent = screenGui

    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1,0,1,0)
    button.Text = "Blank Screen: OFF"
    button.TextColor3 = Color3.new(1,1,1)
    button.TextScaled = true
    button.BackgroundTransparency = 0.3
    button.Parent = frame

    local blankScreen = Instance.new("Frame")
    blankScreen.Size = UDim2.new(1,0,1,0)         -- ancho y alto completos
    blankScreen.Position = UDim2.new(0,0,0,0)     -- top-left
    blankScreen.AnchorPoint = Vector2.new(0,0)    -- anclar al borde
    blankScreen.BackgroundColor3 = Color3.new(0,0,0)
    blankScreen.BackgroundTransparency = 0         -- negro sólido
    blankScreen.Visible = false
    blankScreen.Parent = screenGui

    button.MouseButton1Click:Connect(function()
        blankScreen.Visible = not blankScreen.Visible
        button.Text = blankScreen.Visible and "Blank Screen: ON" or "Blank Screen: OFF"
    end)
end

-- Ejecutar optimización y crear UI
optimizeGame()
createUI()
