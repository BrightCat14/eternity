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
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/BrightCat14/eternity/refs/heads/main/orion.lua')))()
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

local Misc = Window:MakeTab({
    Name = "Misc",
    Icon = "rbxassetid://18619995896",
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
       		    equippedTool.Glove.Size = Vector3.new(40, 80, 40)
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
            equippedTool.Glove.Size = Vector3.new(3.5, 6, 1.9)
        else
            warn("Glove not found in equipped tool!")
        end
    end    
})
Misc:AddToggle({
    Name = "Fps boost",
    Default = false,
    Callback = function(Value)
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local camera = workspace.CurrentCamera

-- Настройки LOD
local closeDistance = 50    -- Расстояние для высокого качества
local mediumDistance = 150  -- Расстояние для среднего качества
local farDistance = 300     -- Расстояние, после которого объект скрывается

-- Функция для обновления состояния объектов
local function updateLOD()
    if Value == true then
        for _, object in ipairs(workspace.Objects:GetChildren()) do
            if object:IsA("Model") or object:IsA("Part") then
                local distance = (object.Position - camera.CFrame.Position).Magnitude

                if distance <= closeDistance then
                    -- Высокое качество
                    object.Transparency = 0
                    if object:FindFirstChild("Texture") then
                        object.Texture.Texture = "HighQualityTexture" -- Пример замены текстуры
                    end
                elseif distance <= mediumDistance then
                    -- Среднее качество
                    object.Transparency = 0.5
                    if object:FindFirstChild("Texture") then
                        object.Texture.Texture = "MediumQualityTexture"
                    end
                elseif distance > farDistance then
                    -- Скрыть объект
                    object.Transparency = 1
                end
            end
        end
    else
        -- Если Value == false, вернем все объекты в нормальное состояние
        for _, object in ipairs(workspace.Objects:GetChildren()) do
            if object:IsA("Model") or object:IsA("Part") then
                object.Transparency = 0 -- Снять прозрачность
                if object:FindFirstChild("Texture") then
                    object.Texture.Texture = "DefaultTexture" -- Вернуть стандартную текстуру
                end
            end
        end
    end
end

-- Настройка глобального качества рендера
if Value == true then
    settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
elseif Value == false then
    settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic
end

-- Постоянное обновление LOD
--[[
game:GetService("RunService").RenderStepped:Connect(updateLOD)
]]--
    end    
})


game:GetService("RunService").Heartbeat:Connect(function()
    TVTextLabel.Text = "get good get eternity"
end)

OrionLib:Init()
-- destroying the interface: OrionLib:Destroy()
