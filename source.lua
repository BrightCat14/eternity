if not game:IsLoaded() then
    game.Loaded:Wait()
end

-- Инициализация генератора случайных чисел
math.randomseed(os.time())

-- Функция для генерации случайного слова заданной длины
local function randomWord(length)
    local letters = 'abcdefghijklmnopqrstuvwxyz'
    local word = ''
    for i = 1, length do
        local index = math.random(1, #letters)
        word = word .. letters:sub(index, index)
    end
    return word
end

-- Функция для генерации случайной цифры
local function randomDigit()
    return math.random(0, 9)
end

-- Функция для создания случайного слова с добавлением случайных цифр
local function randomWordWithDigits(wordLength, digitCount)
    local word = randomWord(wordLength)
    for i = 1, digitCount do
        word = word .. randomDigit()  -- Добавляем случайную цифру
    end
    return word
end

game:GetService("GuiService"):ClearError()
--local bypass;
--bypass = hookmetamethod(game, "__namecall", function(method, ...) 
--if getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.Ban then
--        return
--elseif getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.AdminGUI then
--        return
--elseif getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.WalkSpeedChanged then
--        return
--end
--return bypass(method, ...)
--end)

--local soundUrl = "https://github.com/BrightCat14/eternity/raw/refs/heads/main/SteosVoice%20141683.mp3"
--local soundFile = game:HttpGet(soundUrl, true)
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Eternity", HidePremium = false, SaveConfig = true, ConfigFolder = "Eternity"})
--local welcomesound = Instance.new("Sound")
--local wordLength = 5  -- Длина слова
--local digitCount = 3   -- Количество цифр
--local bypassword = randomWordWithDigits(wordLength, digitCount)
--welcomesound.SoundId = soundFile
--welcomesound.Parent = game.ReplicatedStorage
--welcomesound.Name = bypassword

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

--welcomesound:Play()
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
                   equippedTool.Glove.Transparency = 0.75
       		   equippedTool.Glove.Size = Vector3.new(10, 30, 45.00500505050)
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

game:GetService("RunService").Heartbeat:Connect(function()
    TVTextLabel.Text = "get good get eternity"
end)

OrionLib:Init()
-- destroying the interface: OrionLib:Destroy()
