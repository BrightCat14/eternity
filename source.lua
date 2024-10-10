local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Eternity", HidePremium = false, SaveConfig = true, ConfigFolder = "Eternity"})

local player = game.Players.LocalPlayer
local playername = player.Name
local character = player.Character or player.CharacterAdded:Wait()
local glow = 0
local equippedTool = character:FindFirstChildOfClass("Tool")

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
        if equippedTool and equippedTool:FindFirstChild("Glove") then
            equippedTool.Glove.Transparency = 0.35
            equippedTool.Glove.Size = Vector3.new(25, 25, 25)
        else
            warn("Glove not found in equipped tool!")
        end
    end    
})

Combat:AddToggle({
	Name = "Slap aura",
	Default = false,
	Callback = function(Value)

	end    
})
Combat:AddToggle({
	Name = "This is a toggle!",
	Default = false,
	Callback = function(Value)
        		if Value == true then
            			spawn(
                			function()
                    				while Value do
                        				for _, ok in ipairs(workspace:GetChildren()) do
                            					if ok:FindFirstChild("Humanoid") then
                                				game:GetService("ReplicatedStorage").Events.Slap:FireServer(ok.Torso)
                                				wait(0.01)
                            				end
                        			end
                    			end
            			)
        		end
	end    
})

Visual:AddLabel("Glove")
Visual:AddColorpicker({
	Name = "Color",
	Default = Color3.fromRGB(255, 0, 0),
	Callback = function(Value)
        local equippedTool = character:FindFirstChildOfClass("Tool")
        if equippedTool and equippedTool:FindFirstChild("Glove") then
		    equippedTool.Glove.Color = Value
        else
            warn("Glove not found in equipped tool!")
        end
	end	  
})
Visual:AddLabel("World")
Visual:AddColorpicker({
	Name = "Color",
	Default = Color3.fromRGB(255, 0, 0),
	Callback = function(Value)
			local Lighting = game:GetService("Lighting")
			Lighting.Ambient = Value
			Lighting.OutdoorAmbient = Value

	end	  
})

OrionLib:Init()
-- destroying the interface: OrionLib:Destroy()
