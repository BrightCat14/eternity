if not game:IsLoaded() then
    game.Loaded:Wait()
end

game:GetService("GuiService"):ClearError()
local bypass;
bypass = hookmetamethod(game, "__namecall", function(method, ...) 
if getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.Ban then
        return
elseif getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.AdminGUI then
        return
elseif getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.WalkSpeedChanged then
        return
end
return bypass(method, ...)
end)
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Eternity", HidePremium = false, SaveConfig = true, ConfigFolder = "Eternity"})

local TVTextLabel = game.Workspace.Lobby.TV.Screen.SurfaceGui.TextLabel
local player = game.Players.LocalPlayer
local playername = player.Name
local character = player.Character or player.CharacterAdded:Wait()
local glow = 0
local equippedTool = character:FindFirstChildOfClass("Tool")

TVTextLabel.Text = "get good get eternity"

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

local Bypass = Window:MakeTab({
    Name = "Bypass",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

OrionLib:MakeNotification({
    Name = "Eternity",
    Content = "Hi, " .. playername .. ", glad to see you",
    Image = "rbxassetid://4483345998",
    Time = 5
})


Combat:AddToggle({
	Name = "Slap aura",
	Default = false,
	Callback = function(Value)
	local player = game.Players.LocalPlayer
	local character = player.Character or player.CharacterAdded:Wait()		
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
                end
            )
        end
			
	end    
})
Bypass:AddButton({
    Name = "Rage Reach",
    Callback = function()
	local player = game.Players.LocalPlayer
	local character = player.Character or player.CharacterAdded:Wait()
        local equippedTool = character:FindFirstChildOfClass("Tool")
        if equippedTool and equippedTool:FindFirstChild("Glove") then
            equippedTool.Glove.Transparency = 0.35
            equippedTool.Glove.Size = Vector3.new(25, 50, 125)
        else
            warn("Glove not found in equipped tool!")
        end
    end    
})
Bypass:AddButton({
    Name = "Legit Reach",
    Callback = function()
	local player = game.Players.LocalPlayer
	local character = player.Character or player.CharacterAdded:Wait()
        local equippedTool = character:FindFirstChildOfClass("Tool")
        if equippedTool and equippedTool:FindFirstChild("Glove") then
            equippedTool.Glove.Transparency = 0.35
            equippedTool.Glove.Size = Vector3.new(3.5, 3.5, 1.9)
        else
            warn("Glove not found in equipped tool!")
        end
    end    
})

OrionLib:Init()
-- destroying the interface: OrionLib:Destroy()
