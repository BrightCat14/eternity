local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Eternity", HidePremium = false, SaveConfig = true, ConfigFolder = "Eternity"})

local player = game.Players.LocalPlayer
local playername = player.Name
local character = player.Character or player.CharacterAdded:Wait()
local glow = 0
local equippedTool = character:FindFirstChildOfClass("Tool")
-- Создаем SurfaceLight и настраиваем его
local surfaceLight = Instance.new("SurfaceLight")
surfaceLight.Parent = equippedTool -- Присоединяем SurfaceLight к Part
surfaceLight.Color = Color3.fromRGB(255, 255, 0) -- Устанавливаем цвет света (желтый)
surfaceLight.Brightness = glow -- Устанавливаем яркость света
surfaceLight.Range = 10 -- Устанавливаем радиус света
surfaceLight.Face = Enum.NormalId.Top -- Устанавливаем, на какую сторону добавляем свет

local Combat = Window:MakeTab({
	Name = "Combat",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Visual = Window:MakeTab({
	Name = "Visual",
	Icon = "rbxassetid://18619995896",
	PremiumOnly = false
})
OrionLib:MakeNotification({
	Name = "Eternity",
	Content = "Hi, " .. playername .. ", glad to see you",
	Image = "rbxassetid://4483345998",
	Time = 5
})
Combat:AddButton({
	Name = "Reach",
	Callback = function()
			local equippedTool = character:FindFirstChildOfClass("Tool")
			equippedTool.Glove.Transparency = 0.35
			equippedTool.Glove.Size = Vector3.new(25, 25, 25)
  	end    
})
Visual:AddLabel("Glove")
Visual:AddSlider({
	Name = "Glow",
	Min = 0,
	Max = 20,
	Default = 0,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Glow",
	Callback = function(Value)
		glow = Value
	end    
})


OrionLib:Init()
-- destroying the interface: OrionLib:Destroy()
