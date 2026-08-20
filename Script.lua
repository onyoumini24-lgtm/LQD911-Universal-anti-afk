-- ==========================================
-- ЧАСТЬ 1: СОЗДАНИЕ ИНТЕРФЕЙСА (UI)
-- ==========================================
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local FrameStroke = Instance.new("UIStroke")
local TitleLabel = Instance.new("TextLabel")
local AuthorLabel = Instance.new("TextLabel") -- Подзаголовок by L1TEBRAY
local ToggleButton = Instance.new("TextButton")
local UnloadButton = Instance.new("TextButton")
local LangButton = Instance.new("TextButton")
local CloseXButton = Instance.new("TextButton")
local MainCorner = Instance.new("UICorner")

local MobileMenuButton = Instance.new("TextButton")
local MobileButtonCorner = Instance.new("UICorner")
local TextButtonUIStroke = Instance.new("UIStroke")
local ButtonGlowStroke = Instance.new("UIStroke")
local TopHintLabel = Instance.new("TextLabel")

ScreenGui.Name = "PremiumAntiAFK_L1TEBRAY"
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ResetOnSpawn = false

-- Главное окно меню (Glassmorphism)
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
MainFrame.BackgroundTransparency = 0.15
MainFrame.Position = UDim2.new(0.5, -125, 0.4, -75)
MainFrame.Size = UDim2.new(0, 250, 0, 150)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.BorderSizePixel = 0

MainCorner.CornerRadius = UDim.new(0, 14)
MainCorner.Parent = MainFrame

FrameStroke.Parent = MainFrame
FrameStroke.Color = Color3.fromRGB(60, 60, 75)
FrameStroke.Thickness = 1.2
FrameStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

-- Главный заголовок
TitleLabel.Name = "Title"
TitleLabel.Parent = MainFrame
TitleLabel.BackgroundTransparency = 1
TitleLabel.Position = UDim2.new(0, 16, 0, 10)
TitleLabel.Size = UDim2.new(0, 150, 0, 16)
TitleLabel.Font = Enum.Font.BuilderSansBold
TitleLabel.Text = "antiafk universal"
TitleLabel.TextColor3 = Color3.fromRGB(240, 240, 245)
TitleLabel.TextSize = 13
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Авторство (by L1TEBRAY) под заголовком
AuthorLabel.Name = "Author"
AuthorLabel.Parent = MainFrame
AuthorLabel.BackgroundTransparency = 1
AuthorLabel.Position = UDim2.new(0, 16, 0, 24)
AuthorLabel.Size = UDim2.new(0, 150, 0, 12)
AuthorLabel.Font = Enum.Font.BuilderSans
AuthorLabel.Text = "by L1TEBRAY"
AuthorLabel.TextColor3 = Color3.fromRGB(140, 140, 155)
AuthorLabel.TextSize = 10
AuthorLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Кнопка смены языка (чистый текст EN/RU)
LangButton.Name = "LangButton"
LangButton.Parent = MainFrame
LangButton.BackgroundTransparency = 1
LangButton.Position = UDim2.new(1, -72, 0, 12)
LangButton.Size = UDim2.new(0, 30, 0, 22)
LangButton.Font = Enum.Font.BuilderSansBold
LangButton.Text = "EN"
LangButton.TextColor3 = Color3.fromRGB(140, 140, 155)
LangButton.TextSize = 12

-- Элегантный крестик закрытия
CloseXButton.Name = "CloseXButton"
CloseXButton.Parent = MainFrame
CloseXButton.BackgroundTransparency = 1
CloseXButton.Position = UDim2.new(1, -34, 0, 12)
CloseXButton.Size = UDim2.new(0, 22, 0, 22)
CloseXButton.Font = Enum.Font.BuilderSansBold
CloseXButton.Text = "×"
CloseXButton.TextColor3 = Color3.fromRGB(140, 140, 155)
CloseXButton.TextSize = 20

-- Кнопка Включения/Выключения Anti-AFK
ToggleButton.Name = "ToggleButton"
ToggleButton.Parent = MainFrame
ToggleButton.BackgroundColor3 = Color3.fromRGB(235, 65, 65)
ToggleButton.Position = UDim2.new(0.06, 0, 0.40, 0)
ToggleButton.Size = UDim2.new(0.88, 0, 0, 34)
ToggleButton.Font = Enum.Font.BuilderSansBold
ToggleButton.Text = "Status: INACTIVE"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.TextSize = 13
ToggleButton.BorderSizePixel = 0

local ButtonCorner1 = Instance.new("UICorner")
ButtonCorner1.CornerRadius = UDim.new(0, 10)
ButtonCorner1.Parent = ToggleButton

-- Кнопка выгрузки чита (Unload)
UnloadButton.Name = "UnloadButton"
UnloadButton.Parent = MainFrame
UnloadButton.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
UnloadButton.Position = UDim2.new(0.06, 0, 0.68, 0)
UnloadButton.Size = UDim2.new(0.88, 0, 0, 34)
UnloadButton.Font = Enum.Font.BuilderSansBold
UnloadButton.Text = "Unload Script"
UnloadButton.TextColor3 = Color3.fromRGB(170, 170, 185)
UnloadButton.TextSize = 13
UnloadButton.BorderSizePixel = 0

local ButtonCorner2 = Instance.new("UICorner")
ButtonCorner2.CornerRadius = UDim.new(0, 10)
ButtonCorner2.Parent = UnloadButton

-- Мобильная кнопка "G" (появляется при скрытии меню)
MobileMenuButton.Name = "MobileMenuButton"
MobileMenuButton.Parent = ScreenGui
MobileMenuButton.BackgroundColor3 = Color3.fromRGB(255, 195, 0)
MobileMenuButton.Position = UDim2.new(0, 25, 1, -85)
MobileMenuButton.Size = UDim2.new(0, 50, 0, 50)
MobileMenuButton.Font = Enum.Font.BuilderSansBold
MobileMenuButton.Text = "G"
MobileMenuButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MobileMenuButton.TextSize = 26
MobileMenuButton.Visible = false
MobileMenuButton.BorderSizePixel = 0

local MobileButtonCorner = Instance.new("UICorner")
MobileButtonCorner.CornerRadius = UDim.new(1, 0)
MobileButtonCorner.Parent = MobileMenuButton

-- Четкий внутренний контур для буквы G
TextButtonUIStroke.Parent = MobileMenuButton
TextButtonUIStroke.Color = Color3.fromRGB(20, 20, 25)
TextButtonUIStroke.Thickness = 3.5
TextButtonUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual

-- Граница самого желтого круга кнопки G
ButtonGlowStroke.Parent = MobileMenuButton
ButtonGlowStroke.Color = Color3.fromRGB(215, 155, 0)
ButtonGlowStroke.Thickness = 1.2
ButtonGlowStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

-- Верхняя RGB-надпись подсказки
TopHintLabel.Name = "TopHintLabel"
TopHintLabel.Parent = ScreenGui
TopHintLabel.BackgroundTransparency = 1
TopHintLabel.Position = UDim2.new(0.5, -200, 0, 24)
TopHintLabel.Size = UDim2.new(0, 400, 0, 30)
TopHintLabel.Font = Enum.Font.BuilderSansBold
TopHintLabel.Text = "Press G to open menu"
TopHintLabel.TextSize = 16
TopHintLabel.Visible = false

local TextShadow = Instance.new("UIStroke")
TextShadow.Parent = TopHintLabel
TextShadow.Color = Color3.fromRGB(0, 0, 0)
TextShadow.Thickness = 1.5
TextShadow.Transparency = 0.5
-- ==========================================
-- ЧАСТЬ 2: БЕЗОПАСНАЯ ЛОГИКА (ОБХОД АНТИЧИТА)
-- ==========================================
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local enabled = false
local scriptRunning = true
local currentLang = "EN"
local afkThread = nil -- Поток для безопасного таймера

local localization = {
    EN = {
        unload = "Unload Script",
        hint = "Press G to open menu",
        statusActive = "Status: ACTIVE",
        statusInactive = "Status: INACTIVE"
    },
    RU = {
        unload = "Выгрузить чит",
        hint = "Нажмите на G, чтобы открыть меню",
        statusActive = "Статус: АКТИВЕН",
        statusInactive = "Статус: НЕАКТИВЕН"
    }
}

local function updateTexts()
    local langData = localization[currentLang]
    UnloadButton.Text = langData.unload
    TopHintLabel.Text = langData.hint
    if enabled then
        ToggleButton.Text = langData.statusActive
    else
        ToggleButton.Text = langData.statusInactive
    end
end

-- Анимация отклика кнопок при нажатии
local function playClickAnimation(button)
    local originalSize = button.Size
    button:TweenSize(UDim2.new(originalSize.X.Scale, originalSize.X.Offset - 6, originalSize.Y.Scale, originalSize.Y.Offset - 4), "Out", "Quad", 0.05, true)
    task.wait(0.05)
    button:TweenSize(originalSize, "Out", "Quad", 0.05, true)
end

-- Переключение языковой панели
LangButton.MouseButton1Click:Connect(function()
    currentLang = (currentLang == "EN") and "RU" or "EN"
    LangButton.Text = currentLang
    updateTexts()
end)

-- Плавный RGB эффект текста подсказки
local rgbConnection
rgbConnection = RunService.RenderStepped:Connect(function()
    if not scriptRunning then rgbConnection:Disconnect() return end
    if TopHintLabel.Visible then
        local hue = (tick() % 5) / 5
        TopHintLabel.TextColor3 = Color3.fromHSV(hue, 0.75, 1)
    end
end)

-- СВЕРХБЕЗОПАСНЫЙ МЕТОД ОБХОДА (Имитация реального движения)
-- Скрипт раз в пару минут делает микро-шаг, что гарантированно сбрасывает АФК без палева
local function startSafeAntiAFK()
    if afkThread then task.cancel(afkThread) end
    
    afkThread = task.spawn(function()
        while enabled and scriptRunning do
            -- Ждем случайное время от 60 до 120 секунд, чтобы обмануть поведенческий античит
            task.wait(math.random(60, 120)) 
            
            local character = LocalPlayer.Character
            local humanoid = character and character:FindFirstChildOfClass("Humanoid")
            
            if humanoid and humanoid.Health > 0 then
                -- Делаем микро-шаг вперед на 0.05 секунды
                humanoid:Move(Vector3.new(0, 0, -1), true)
                task.wait(0.05)
                -- Возвращаемся обратно на то же место
                humanoid:Move(Vector3.new(0, 0, 1), true)
                task.wait(0.05)
                -- Останавливаем движение
                humanoid:Move(Vector3.new(0, 0, 0), true)
            end
        end
    end)
end

-- Функция Свернуть / Развернуть
local function toggleMenu()
    if not scriptRunning then return end
    local isVisible = MainFrame.Visible
    MainFrame.Visible = not isVisible
    MobileMenuButton.Visible = isVisible
    TopHintLabel.Visible = isVisible
end

-- Переключатель работы Анти-АФК
ToggleButton.MouseButton1Click:Connect(function()
    task.spawn(function() playClickAnimation(ToggleButton) end)
    enabled = not enabled
    if enabled then
        ToggleButton.BackgroundColor3 = Color3.fromRGB(45, 185, 105)
        startSafeAntiAFK() -- Запуск безопасного обхода
    else
        ToggleButton.BackgroundColor3 = Color3.fromRGB(235, 65, 65)
        if afkThread then task.cancel(afkThread) end
    end
    updateTexts()
end)

-- Эффекты наведения (Hover) для верхней панели
CloseXButton.MouseEnter:Connect(function() CloseXButton.TextColor3 = Color3.fromRGB(255, 80, 80) end)
CloseXButton.MouseLeave:Connect(function() CloseXButton.TextColor3 = Color3.fromRGB(140, 140, 155) end)
LangButton.MouseEnter:Connect(function() LangButton.TextColor3 = Color3.fromRGB(240, 240, 245) end)
LangButton.MouseLeave:Connect(function() LangButton.TextColor3 = Color3.fromRGB(140, 140, 155) end)

CloseXButton.MouseButton1Click:Connect(toggleMenu)
MobileMenuButton.MouseButton1Click:Connect(function()
    task.spawn(function() playClickAnimation(MobileMenuButton) end)
    toggleMenu()
end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.G then
        toggleMenu()
    end
end)

-- Полное удаление скрипта из игры
UnloadButton.MouseButton1Click:Connect(function()
    playClickAnimation(UnloadButton)
    scriptRunning = false
    enabled = false
    if afkThread then task.cancel(afkThread) end
    if rgbConnection then rgbConnection:Disconnect() end
    ScreenGui:Destroy()
end)
