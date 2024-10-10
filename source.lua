local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Eternity", HidePremium = false, SaveConfig = true, ConfigFolder = "Eternity"})

local player = game.Players.LocalPlayer
local playername = player.Name
local character = player.Character or player.CharacterAdded:Wait()

local Combat = Window:MakeTab({
	Name = "Combat",
	Icon = "rbxassetid://4483345998",
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


OrionLib:Init()
-- destroying the interface: OrionLib:Destroy()
