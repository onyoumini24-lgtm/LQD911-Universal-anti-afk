-- Создание GUI интерфейса премиум-класса
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local FrameStroke = Instance.new("UIStroke")
local TitleLabel = Instance.new("TextLabel")
local ToggleButton = Instance.new("TextButton")
local UnloadButton = Instance.new("TextButton")
local CloseXButton = Instance.new("TextButton")
local MainCorner = Instance.new("UICorner")
local LineDivider = Instance.new("Frame")

-- Элементы для закрытого состояния
local MobileMenuButton = Instance.new("TextButton")
local MobileButtonCorner = Instance.new("UICorner")
local TextButtonUIStroke = Instance.new("UIStroke")
local ButtonGlowStroke = Instance.new("UIStroke")
local TopHintLabel = Instance.new("TextLabel")

-- Настройки родительского контейнера
ScreenGui.Name = "PremiumAntiAFK_L1TEBRAY"
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ResetOnSpawn = false

-- ==========================================
-- СТИЛИЗАЦИЯ ГЛАВНОГО ОКНА МЕНЮ
-- ==========================================
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25) -- Глубокий темный
MainFrame.Position = UDim2.new(0.5, -125, 0.4, -80)
MainFrame.Size = UDim2.new(0, 250, 0, 160)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.BorderSizePixel = 0

MainCorner.CornerRadius = UDim.new(0, 12) -- Красивые закругленные углы
MainCorner.Parent = MainFrame

-- Стильная неоновая обводка самого меню
FrameStroke.Parent = MainFrame
FrameStroke.Color = Color3.fromRGB(55, 55, 65)
FrameStroke.Thickness = 1.5
FrameStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

-- Стильный заголовок чита
TitleLabel.Name = "Title"
TitleLabel.Parent = MainFrame
TitleLabel.BackgroundTransparency = 1
TitleLabel.Position = UDim2.new(0, 15, 0, 8)
TitleLabel.Size = UDim2.new(0, 190, 0, 25)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Text = "antiafk universal by L1TEBRAY"
TitleLabel.TextColor3 = Color3.fromRGB(230, 230, 240)
TitleLabel.TextSize = 13
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Линия-разделитель под заголовком
LineDivider.Name = "Divider"
LineDivider.Parent = MainFrame
LineDivider.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
LineDivider.BorderSizePixel = 0
LineDivider.Position = UDim2.new(0, 0, 0, 40)
LineDivider.Size = UDim2.new(1, 0, 0, 1)

-- Элегантный крестик сверху справа (X)
CloseXButton.Name = "CloseXButton"
CloseXButton.Parent = MainFrame
CloseXButton.BackgroundTransparency = 1
CloseXButton.Position = UDim2.new(1, -35, 0, 8)
CloseXButton.Size = UDim2.new(0, 25, 0, 25)
CloseXButton.Font = Enum.Font.GothamBold
CloseXButton.Text = "×"
CloseXButton.TextColor3 = Color3.fromRGB(150, 150, 160)
CloseXButton.TextSize = 22

-- Кнопка Включения/Выключения Anti-AFK
ToggleButton.Name = "ToggleButton"
ToggleButton.Parent = MainFrame
ToggleButton.BackgroundColor3 = Color3.fromRGB(220, 60, 60) -- Красивый пастельный красный
ToggleButton.Position = UDim2.new(0.06, 0, 0.35, 0)
ToggleButton.Size = UDim2.new(0.88, 0, 0, 35)
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.Text = "Status: INACTIVE"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.TextSize = 13

local ButtonCorner1 = Instance.new("UICorner")
ButtonCorner1.CornerRadius = UDim.new(0, 8)
ButtonCorner1.Parent = ToggleButton

-- Кнопка выгрузки чита (Unload)
UnloadButton.Name = "UnloadButton"
UnloadButton.Parent = MainFrame
UnloadButton.BackgroundColor3 = Color3.fromRGB(35, 35, 45) -- Темная минималистичная кнопка
UnloadButton.Position = UDim2.new(0.06, 0, 0.68, 0)
UnloadButton.Size = UDim2.new(0.88, 0, 0, 35)
UnloadButton.Font = Enum.Font.GothamBold
UnloadButton.Text = "Unload Script"
UnloadButton.TextColor3 = Color3.fromRGB(180, 180, 190)
UnloadButton.TextSize = 13

local ButtonCorner2 = Instance.new("UICorner")
ButtonCorner2.CornerRadius = UDim.new(0, 8)
ButtonCorner2.Parent = UnloadButton

-- ==========================================
-- ЭЛЕМЕНТЫ ДЛЯ СВЕРНУТОГО СОСТОЯНИЯ
-- ==========================================

-- Круглая желтая кнопка "G"
MobileMenuButton.Name = "MobileMenuButton"
MobileMenuButton.Parent = ScreenGui
MobileMenuButton.BackgroundColor3 = Color3.fromRGB(255, 200, 0) -- Мягкий золотой цвет
MobileMenuButton.Position = UDim2.new(0, 25, 1, -85)
MobileMenuButton.Size = UDim2.new(0, 52, 0, 52)
MobileMenuButton.Font = Enum.Font.GothamBold
MobileMenuButton.Text = "G"
MobileMenuButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MobileMenuButton.TextSize = 28
MobileMenuButton.Visible = false

MobileButtonCorner.CornerRadius = UDim.new(1, 0)
MobileButtonCorner.Parent = MobileMenuButton

-- ЧЕТКАЯ обводка буквы "G"
TextButtonUIStroke.Parent = MobileMenuButton
TextButtonUIStroke.Color = Color3.fromRGB(15, 15, 15)
TextButtonUIStroke.Thickness = 3.5
TextButtonUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual

-- Стильная темная обводка самого желтого круга (эффект глубины)
ButtonGlowStroke.Parent = MobileMenuButton
ButtonGlowStroke.Color = Color3.fromRGB(200, 150, 0)
ButtonGlowStroke.Thickness = 1.5
ButtonGlowStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

-- Верхняя RGB-надпись
TopHintLabel.Name = "TopHintLabel"
TopHintLabel.Parent = ScreenGui
TopHintLabel.BackgroundTransparency = 1
TopHintLabel.Position = UDim2.new(0.5, -200, 0, 20)
TopHintLabel.Size = UDim2.new(0, 400, 0, 30)
TopHintLabel.Font = Enum.Font.GothamBold
TopHintLabel.Text = "Нажмите на G, чтобы открыть меню"
TopHintLabel.TextSize = 18
TopHintLabel.Visible = false

-- ==========================================
-- ЛОГИКА И ЭФФЕКТЫ
-- ==========================================
local UserInputService = game:GetService("UserInputService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local enabled = false
local scriptRunning = true

-- Кастомная RGB-анимация с эффектом мягкого затухания
local rgbConnection
rgbConnection = RunService.RenderStepped:Connect(function()
    if not scriptRunning then rgbConnection:Disconnect() return end
    if TopHintLabel.Visible then
        local hue = (tick() % 4) / 4 -- Плавная скорость
        TopHintLabel.TextColor3 = Color3.fromHSV(hue, 0.8, 1)
    end
end)

-- Обход АФК (Клик-метод, симулирующий нажатия)
local afkConnection
afkConnection = LocalPlayer.Idled:Connect(function()
    if enabled and scriptRunning then
        VirtualInputManager:SendMouseButtonEvent(15, 15, 0, true, game, 1)
        task.wait(0.05)
        VirtualInputManager:SendMouseButtonEvent(15, 15, 0, false, game, 1)
    end
end)

-- Плавная функция переключения интерфейса
local function toggleMenu()
    if not scriptRunning then return end
    local isVisible = MainFrame.Visible
    
    MainFrame.Visible = not isVisible
    MobileMenuButton.Visible = isVisible
    TopHintLabel.Visible = isVisible
end

-- Обработка переключателя Anti-AFK
ToggleButton.MouseButton1Click:Connect(function()
    enabled = not enabled
    if enabled then
        ToggleButton.Text = "Status: ACTIVE"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(45, 175, 100) -- Изумрудно-зеленый
    else
        ToggleButton.Text = "Status: INACTIVE"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(220, 60, 60) -- Красный
    end
end)

-- Ховер-эффекты для крестика закрытия
CloseXButton.MouseEnter:Connect(function() CloseXButton.TextColor3 = Color3.fromRGB(255, 75, 75) end)
CloseXButton.MouseLeave:Connect(function() CloseXButton.TextColor3 = Color3.fromRGB(150, 150, 160) end)

-- Нажатия на кнопки открытия / закрытия
CloseXButton.MouseButton1Click:Connect(toggleMenu)
MobileMenuButton.MouseButton1Click:Connect(toggleMenu)

-- Активация клавиши G на клавиатурах ПК
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.G then
        toggleMenu()
    end
end)

-- Кнопка выгрузки скрипта из памяти игры
UnloadButton.MouseButton1Click:Connect(function()
    scriptRunning = false
    enabled = false
    if afkConnection then afkConnection:Disconnect() end
    if rgbConnection then rgbConnection:Disconnect() end
    ScreenGui:Destroy()
end)

