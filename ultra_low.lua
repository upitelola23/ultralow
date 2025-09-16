-- Roblox Ultra Low Optimizado (Cliente) ✅
-- Compatible con Synapse, KRNL, otros executors

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local SoundService = game:GetService("SoundService")

-- Función para limpiar objetos del cliente
local function ultraLowOptimizado()
    -- Limpiar Workspace
    for _, obj in pairs(Workspace:GetDescendants()) do
        pcall(function()
            if obj:IsA("BasePart") then
                obj.Material = Enum.Material.Plastic
                obj.Color = Color3.fromRGB(255,255,255)
                obj.Reflectance = 0
                obj.CastShadow = false
                obj.Transparency = 0
                -- Eliminar meshes internos accesibles
                for _, child in pairs(obj:GetChildren()) do
                    if child:IsA("Mesh") or child:IsA("SpecialMesh") then
                        child:Destroy()
                    end
                end
            elseif obj:IsA("Decal") or obj:IsA("Texture") or obj:IsA("SurfaceGui") then
                obj:Destroy()
            elseif obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Fire") or obj:IsA("Smoke") or obj:IsA("Sparkles") then
                obj:Destroy()
            elseif obj:IsA("Light") or obj:IsA("PointLight") or obj:IsA("SpotLight") or obj:IsA("SurfaceLight") then
                obj:Destroy()
            end
        end)
    end

    -- Limpiar personajes
    for _, player in pairs(Players:GetPlayers()) do
        local character = player.Character
        if character then
            for _, part in pairs(character:GetDescendants()) do
                pcall(function()
                    if part:IsA("BasePart") then
                        part.Material = Enum.Material.Plastic
                        part.Color = Color3.fromRGB(255,255,255)
                        part.Reflectance = 0
                        part.CastShadow = false
                    elseif part:IsA("Mesh") or part:IsA("SpecialMesh") or part:IsA("Decal") or part:IsA("Texture") then
                        part:Destroy()
                    elseif part:IsA("ParticleEmitter") or part:IsA("Trail") or part:IsA("Fire") or part:IsA("Smoke") or part:IsA("Sparkles") then
                        part:Destroy()
                    end
                end)
            end
        end
    end

    -- Limpiar GUI local
    for _, gui in pairs(LocalPlayer:WaitForChild("PlayerGui"):GetChildren()) do
        pcall(function() gui:Destroy() end)
    end

    -- Limpiar Lighting local
    pcall(function()
        Lighting.GlobalShadows = false
        Lighting.Brightness = 2
        Lighting.OutdoorAmbient = Color3.fromRGB(255,255,255)
        Lighting.FogStart = 0
        Lighting.FogEnd = 100000
    end)

    -- Apagar sonidos accesibles
    for _, sound in pairs(SoundService:GetDescendants()) do
        if sound:IsA("Sound") then
            pcall(function() sound:Stop() end)
        end
    end
end

-- Ejecutar cada frame para objetos nuevos
RunService.RenderStepped:Connect(ultraLowOptimizado)

print("🚀 Ultra Low Optimizado activado ✅")
