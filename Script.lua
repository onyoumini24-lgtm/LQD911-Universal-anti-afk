-- =============================================================================
-- ЧАСТЬ 1: НАСТРОЙКИ, ИНТЕРФЕЙС С КОРОНОЙ 👑 И ГАРАНТИРОВАННЫЙ UNLOAD
-- =============================================================================
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")

-- Жесткий принудительный сброс всех потоков старой копии чита
_G.L1TE_Running = false
task.wait(0.05)

_G.L1TE_ESP = false
_G.L1TE_Aim = false
_G.L1TE_Silent = false
_G.L1TE_TpGun = false
_G.L1TE_SmoothCam = true
_G.L1TE_CamSpeed = 5 
_G.L1TE_FOV = 90
_G.L1TE_AimFOV = 150
_G.L1TE_InfJump = false 
_G.L1TE_Running = true
_G.L1TE_Lang = "RU"

if CoreGui:FindFirstChild("L1TEBRAY_KingHub") then CoreGui["L1TEBRAY_KingHub"]:Destroy() end

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "L1TEBRAY_KingHub"
ScreenGui.ResetOnSpawn = false

_G.L1TE_Circle = Instance.new("TextButton", ScreenGui)
_G.L1TE_Circle.Size = UDim2.new(0, 45, 0, 45)
_G.L1TE_Circle.Position = UDim2.new(0, 20, 1, -70)
_G.L1TE_Circle.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
_G.L1TE_Circle.Text = "G"
_G.L1TE_Circle.TextSize = 20
_G.L1TE_Circle.TextColor3 = Color3.fromRGB(255, 255, 255)
_G.L1TE_Circle.Font = Enum.Font.GothamBold
_G.L1TE_Circle.Visible = false
Instance.new("UICorner", _G.L1TE_Circle).CornerRadius = UDim.new(1, 0)

_G.L1TE_Menu = Instance.new("Frame", ScreenGui)
_G.L1TE_Menu.Size = UDim2.new(0, 360, 0, 230)
_G.L1TE_Menu.Position = UDim2.new(0.5, -180, 0.5, -115)
_G.L1TE_Menu.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
_G.L1TE_Menu.Active = true
_G.L1TE_Menu.Visible = true 
Instance.new("UICorner", _G.L1TE_Menu).CornerRadius = UDim.new(0, 10)
Instance.new("UIStroke", _G.L1TE_Menu).Color = Color3.fromRGB(0, 162, 255)

local dragToggle, dragStart, startPos
_G.L1TE_Menu.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragToggle = true dragStart = input.Position startPos = _G.L1TE_Menu.Position
        input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then dragToggle = false end end)
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) and dragToggle then
        local delta = input.Position - dragStart
        _G.L1TE_Menu.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

local uiState = true
local function toggleUI()
    uiState = not uiState
    _G.L1TE_Menu.Visible = uiState
    _G.L1TE_Circle.Visible = not uiState
end
_G.L1TE_Circle.MouseButton1Click:Connect(toggleUI)

UserInputService.InputBegan:Connect(function(input, gp)
    if not gp and input.KeyCode == Enum.KeyCode.G then 
        toggleUI() 
    end
end)

local SideBar = Instance.new("Frame", _G.L1TE_Menu)
SideBar.Size = UDim2.new(0, 110, 1, 0)
SideBar.BackgroundColor3 = Color3.fromRGB(22, 22, 26)
Instance.new("UICorner", SideBar).CornerRadius = UDim.new(0, 10)

local Logo = Instance.new("TextLabel", SideBar)
Logo.Size = UDim2.new(1, 0, 0, 45)
Logo.BackgroundTransparency = 1
Logo.Text = "👑 Murder Mystery\nBy L1TEBRAY"
Logo.TextColor3 = Color3.fromRGB(0, 162, 255)
Logo.TextSize = 9
Logo.Font = Enum.Font.GothamBold

local CloseButton = Instance.new("TextButton", _G.L1TE_Menu)
CloseButton.Size = UDim2.new(0, 20, 0, 20)
CloseButton.Position = UDim2.new(1, -28, 0, 10)
CloseButton.BackgroundTransparency = 1
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(150, 150, 160)
CloseButton.TextSize = 14
CloseButton.Font = Enum.Font.GothamBold
CloseButton.MouseButton1Click:Connect(toggleUI)

local UnloadBtn = Instance.new("TextButton", SideBar)
UnloadBtn.Size = UDim2.new(1, -16, 0, 24)
UnloadBtn.Position = UDim2.new(0, 8, 1, -34)
UnloadBtn.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
UnloadBtn.Text = "UNLOAD"
UnloadBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
UnloadBtn.TextSize = 9
UnloadBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", UnloadBtn).CornerRadius = UDim.new(0, 5)

UnloadBtn.MouseButton1Click:Connect(function()
    _G.L1TE_Running = false
    _G.L1TE_ESP = false
    _G.L1TE_Aim = false
    _G.L1TE_Silent = false
    _G.L1TE_TpGun = false
    _G.L1TE_InfJump = false
    
    if workspace.CurrentCamera then workspace.CurrentCamera.FieldOfView = 70 end
    
    for _, p in pairs(Players:GetPlayers()) do
        if p.Character and p.Character:FindFirstChild("L1TE_Highlight") then p.Character.L1TE_Highlight:Destroy() end
    end
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("Highlight") and (obj.Name == "L1TE_Highlight" or obj.Name == "Gun_Highlight") then obj:Destroy() end
    end
    ScreenGui:Destroy()
end)

local LangBtn = Instance.new("TextButton", SideBar)
LangBtn.Size = UDim2.new(1, -16, 0, 24)
LangBtn.Position = UDim2.new(0, 8, 1, -64)
LangBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
LangBtn.Text = "RU" 
LangBtn.TextColor3 = Color3.fromRGB(200, 200, 210)
LangBtn.TextSize = 10
LangBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", LangBtn).CornerRadius = UDim.new(0, 5)

local function createTabFrame(parent)
    local f = Instance.new("ScrollingFrame", parent)
    f.Size = UDim2.new(1, -125, 1, -55)
    f.Position = UDim2.new(0, 120, 0, 45)
    f.BackgroundTransparency = 1
    f.ScrollBarThickness = 2
    f.CanvasSize = UDim2.new(0, 0, 0, 0)
    f.AutomaticCanvasSize = Enum.AutomaticSize.Y
    
    local layout = Instance.new("UIListLayout", f)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 6)
    
    local pad = Instance.new("UIPadding", f)
    pad.PaddingLeft = UDim.new(0, 2)
    pad.PaddingRight = UDim.new(0, 6)
    
    return f
end

_G.L1TE_TabVis = createTabFrame(_G.L1TE_Menu)
_G.L1TE_TabCom = createTabFrame(_G.L1TE_Menu) _G.L1TE_TabCom.Visible = false
_G.L1TE_TabTrol = createTabFrame(_G.L1TE_Menu) _G.L1TE_TabTrol.Visible = false
-- =============================================================================
-- ЧАСТЬ 2: КНОПКИ ВКЛАДОК, ПЕРЕКЛЮЧАТЕЛИ И НАСТРОЙКИ СЛАЙДЕРОВ НАВЕДЕНИЯ
-- =============================================================================
local VisualsTabBtn = Instance.new("TextButton", SideBar)
local CombatTabBtn = Instance.new("TextButton", SideBar)
local TrollingTabBtn = Instance.new("TextButton", SideBar)

local function styleTabBtn(b, t, y, showTab)
    b.Size = UDim2.new(1, -16, 0, 26) b.Position = UDim2.new(0, 8, 0, y)
    b.BackgroundColor3 = Color3.fromRGB(28, 28, 33) b.Text = t b.TextColor3 = Color3.fromRGB(140, 140, 150)
    b.TextSize = 9 b.Font = Enum.Font.GothamBold Instance.new("UICorner", b).CornerRadius = UDim.new(0, 5)
    
    b.MouseButton1Click:Connect(function()
        _G.L1TE_TabVis.Visible = false _G.L1TE_TabCom.Visible = false _G.L1TE_TabTrol.Visible = false
        showTab.Visible = true
        VisualsTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 33) VisualsTabBtn.TextColor3 = Color3.fromRGB(150, 150, 160)
        CombatTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 33) CombatTabBtn.TextColor3 = Color3.fromRGB(150, 150, 160)
        TrollingTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 33) TrollingTabBtn.TextColor3 = Color3.fromRGB(150, 150, 160)
        b.BackgroundColor3 = Color3.fromRGB(0, 162, 255) b.TextColor3 = Color3.fromRGB(255, 255, 255)
    end)
end

styleTabBtn(VisualsTabBtn, "Visuals", 50, _G.L1TE_TabVis) VisualsTabBtn.BackgroundColor3 = Color3.fromRGB(0, 162, 255) VisualsTabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
styleTabBtn(CombatTabBtn, "Combat", 82, _G.L1TE_TabCom)
styleTabBtn(TrollingTabBtn, "Trolling", 114, _G.L1TE_TabTrol)

local allToggles = {}

local function makeToggle(parent, ruText, enText, size, pos, stateKey)
    local b = Instance.new("TextButton", parent)
    b.Size = UDim2.new(1, 0, 0, 28)
    b.BackgroundColor3 = Color3.fromRGB(24, 24, 28)
    b.TextSize = 9 b.Font = Enum.Font.GothamBold
    b.TextColor3 = Color3.fromRGB(180, 180, 190)
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 5)
    
    local function updateText()
        local baseText = (_G.L1TE_Lang == "RU") and ruText or enText
        local status = (_G.L1TE_Lang == "RU") and (_G[stateKey] and "ВКЛ" or "ВЫКЛ") or (_G[stateKey] and "ON" or "OFF")
        b.Text = baseText .. ": " .. status
    end
    
    b.MouseButton1Click:Connect(function()
        _G[stateKey] = not _G[stateKey]
        updateText()
        b.BackgroundColor3 = _G[stateKey] and Color3.fromRGB(34, 139, 70) or Color3.fromRGB(24, 24, 28)
        b.TextColor3 = _G[stateKey] and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(180, 180, 190)
    end)
    
    table.insert(allToggles, {type = "toggle", btn = b, ru = ruText, en = enText, key = stateKey, upd = updateText})
    updateText()
end

local function createSlider(parent, labelRu, labelEn, minVal, maxVal, defaultVal, pos, callback)
    local sliderFrame = Instance.new("Frame", parent)
    sliderFrame.Size = UDim2.new(1, 0, 0, 38) sliderFrame.BackgroundTransparency = 1
    
    local lbl = Instance.new("TextLabel", sliderFrame)
    lbl.Size = UDim2.new(1, 0, 0, 14) lbl.BackgroundTransparency = 1
    lbl.TextColor3 = Color3.fromRGB(160, 160, 170) lbl.TextSize = 9 lbl.Font = Enum.Font.GothamBold lbl.TextXAlignment = Enum.TextXAlignment.Left
    
    local sBtn = Instance.new("TextButton", sliderFrame)
    sBtn.Size = UDim2.new(1, 0, 0, 10) sBtn.Position = UDim2.new(0, 0, 0, 18)
    sBtn.BackgroundColor3 = Color3.fromRGB(24, 24, 28) sBtn.Text = "" sBtn.ZIndex = 10
    Instance.new("UICorner", sBtn).CornerRadius = UDim.new(0, 4)
    
    local sBar = Instance.new("Frame", sBtn)
    sBar.Size = UDim2.new((defaultVal - minVal)/(maxVal - minVal), 0, 1, 0)
    sBar.BackgroundColor3 = Color3.fromRGB(0, 162, 255) sBar.BorderSizePixel = 0
    Instance.new("UICorner", sBar).CornerRadius = UDim.new(0, 4)
    
    local curVal = defaultVal
    local function refresh()
        local txt = (_G.L1TE_Lang == "RU") and labelRu or labelEn
        lbl.Text = txt .. ": " .. tostring(curVal)
    end
    
    local function update(input)
        local pct = math.clamp((input.Position.X - sBtn.AbsolutePosition.X) / sBtn.AbsoluteSize.X, 0, 1)
        sBar.Size = UDim2.new(pct, 0, 1, 0)
        curVal = math.floor(minVal + (pct * (maxVal - minVal)))
        refresh()
        callback(curVal)
    end
    
    local drag = false
    sBtn.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then drag = true update(i) end end)
    UserInputService.InputChanged:Connect(function(i) if drag and i.UserInputType == Enum.UserInputType.MouseMovement then update(i) end end)
    UserInputService.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then drag = false end end)
    
    table.insert(allToggles, {type = "slider", upd = refresh})
    refresh()
end

-- Вкладка Visuals
makeToggle(_G.L1TE_TabVis, "ESP Игроков", "Player ESP", nil, nil, "L1TE_ESP")
makeToggle(_G.L1TE_TabVis, "Плавное движение", "Smooth Camera", nil, nil, "L1TE_SmoothCam")
createSlider(_G.L1TE_TabVis, "Настройка плавности", "Smooth Value", 1, 100, 5, nil, function(v) _G.L1TE_CamSpeed = v end)
createSlider(_G.L1TE_TabVis, "Камера FOV", "Camera FOV", 30, 120, 90, nil, function(v)
    _G.L1TE_FOV = v if workspace.CurrentCamera then workspace.CurrentCamera.FieldOfView = v end
end)

-- Вкладка Combat
makeToggle(_G.L1TE_TabCom, "АИМБОТ", "AIMBOT", nil, nil, "L1TE_Aim")
makeToggle(_G.L1TE_TabCom, "Сайлент аим", "Silent aim", nil, nil, "L1TE_Silent")
makeToggle(_G.L1TE_TabCom, "ТП К ОРУЖИЮ", "TP TO GUN", nil, nil, "L1TE_TpGun")
createSlider(_G.L1TE_TabCom, "Радиус Аима / Сайлента", "Aimbot Radius", 50, 600, 150, nil, function(v) _G.L1TE_AimFOV = v end)

-- Вкладка Trolling
makeToggle(_G.L1TE_TabTrol, "Бесконечный прыжок", "Infinite Jump", nil, nil, "L1TE_InfJump")

LangBtn.MouseButton1Click:Connect(function()
    _G.L1TE_Lang = (_G.L1TE_Lang == "RU") and "EN" or "RU"
    LangBtn.Text = _G.L1TE_Lang 
    
    for _, item in pairs(allToggles) do 
        if item.upd then item.upd() end 
    end
end)
-- =============================================================================
-- ЧАСТЬ 3: ИСПОЛНИТЕЛЬНАЯ ЛОГИКА (ОДИН КРУГ, АНТИЧЕТ-ОБХОД И АВТОПОДБОР ПУШКИ)
-- =============================================================================

local fovCircle = Drawing.new("Circle")
fovCircle.Thickness = 1
fovCircle.Filled = false
fovCircle.Transparency = 0.7

local currentDroppedGun = nil
local playerRoles = {}

local function checkRole(p)
    if not p then return "Innocent" end
    if p:FindFirstChild("Backpack") and p.Backpack:FindFirstChild("Knife") then return "Murder" end
    if p.Character and p.Character:FindFirstChild("Knife") then return "Murder" end
    if p:FindFirstChild("Backpack") and p.Backpack:FindFirstChild("Gun") then return "Sheriff" end
    if p.Character and p.Character:FindFirstChild("Gun") then return "Sheriff" end
    return "Innocent"
end

-- Обработчик прыжков
UserInputService.JumpRequest:Connect(function()
    if _G.L1TE_Running and _G.L1TE_InfJump and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end
end)

-- Трекер ролей и ESP
task.spawn(function()
    while _G.L1TE_Running do
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer then
                local char = p.Character or workspace:FindFirstChild(p.Name)
                local role = checkRole(p)
                playerRoles[p] = role

                if char and char:FindFirstChild("HumanoidRootPart") and _G.L1TE_ESP then
                    local hl = char:FindFirstChild("L1TE_Highlight") or Instance.new("Highlight", char)
                    hl.Name = "L1TE_Highlight"
                    hl.FillTransparency = 0.5
                    if role == "Murder" then hl.FillColor = Color3.fromRGB(255, 0, 0)
                    elseif role == "Sheriff" then hl.FillColor = Color3.fromRGB(0, 162, 255)
                    else hl.FillColor = Color3.fromRGB(0, 255, 100) end
                end
            end
        end

        -- Специфический сканер оружия на карте для кастомных MMC-скриптов
        local found = nil
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("BasePart") and (obj.Name == "GunDrop" or obj.Name == "Gun" or obj.Name == "WeaponDrop") then
                found = obj
                break
            end
        end
        if not found then
            local mainMap = workspace:FindFirstChild("Map") or workspace:FindFirstChild("CurrentMap") or workspace:FindFirstChild("Normal")
            if mainMap then
                local gunDrop = mainMap:FindFirstChild("GunDrop") or mainMap:FindFirstChild("Gun")
                if gunDrop and gunDrop:IsA("BasePart") then found = gunDrop end
            end
        end
        currentDroppedGun = found
        task.wait(0.35)
    end
end)

local function getClosestPlayerToCenter()
    local target = nil
    local maxDist = _G.L1TE_AimFOV
    local cam = workspace.CurrentCamera
    if not cam then return nil end
    local centerScreen = Vector2.new(cam.ViewportSize.X / 2, cam.ViewportSize.Y / 2)
    
    for p, role in pairs(playerRoles) do
        if p and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            if role == "Murder" or role == "Sheriff" then
                local screenPos, onScreen = cam:WorldToViewportPoint(p.Character.HumanoidRootPart.Position)
                if onScreen then
                    local dist = (Vector2.new(screenPos.X, screenPos.Y) - centerScreen).Magnitude
                    if dist < maxDist then maxDist = dist target = p.Character.HumanoidRootPart end
                end
            end
        end
    end
    return target
end

-- Рендер-цикл
RunService.RenderStepped:Connect(function()
    if not _G.L1TE_Running then fovCircle.Visible = false return end
    local cam = workspace.CurrentCamera
    if not cam then return end

    if _G.L1TE_Aim or _G.L1TE_Silent then
        fovCircle.Position = Vector2.new(cam.ViewportSize.X / 2, cam.ViewportSize.Y / 2)
        fovCircle.Radius = _G.L1TE_AimFOV
        fovCircle.Color = _G.L1TE_Silent and Color3.fromRGB(180, 50, 255) or Color3.fromRGB(0, 162, 255)
        fovCircle.Visible = true
    else
        fovCircle.Visible = false
    end

    if _G.L1TE_Aim and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
        local target = getClosestPlayerToCenter()
        if target then
            local targetCFrame = CFrame.new(cam.CFrame.Position, target.Position)
            if _G.L1TE_SmoothCam then
                local smoothStep = 1 / (_G.L1TE_CamSpeed * 2.5)
                cam.CFrame = cam.CFrame:Lerp(targetCFrame, math.clamp(smoothStep, 0.001, 1))
            else
                cam.CFrame = targetCFrame
            end
        end
    end

    if _G.L1TE_Silent and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
        local target = getClosestPlayerToCenter()
        if target then
            cam.CFrame = CFrame.new(cam.CFrame.Position, target.Position)
        end
    end

    -- МОДЕРНИЗИРОВАННЫЙ ОБХОД АНТИЧЕТА MMC НА ПОДБОР ОРУЖИЯ (ФИЗИЧЕСКИЙ ТРИГГЕР)
    if currentDroppedGun and currentDroppedGun:IsA("BasePart") then
        local gunHl = currentDroppedGun:FindFirstChild("Gun_Highlight") or Instance.new("Highlight", currentDroppedGun)
        gunHl.Name = "Gun_Highlight"
        gunHl.FillColor = Color3.fromRGB(255, 255, 255)
        gunHl.FillTransparency = _G.L1TE_ESP and 0.1 or 1

        if _G.L1TE_TpGun and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local myRoot = LocalPlayer.Character.HumanoidRootPart
            -- Сбрасываем линейную скорость, чтобы сервер не фризил персонажа
            myRoot.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
            
            -- Генерируем микро-шаги со смещением по оси X/Z прямо под хитбоксом пушки.
            -- Это принудительно активируетTouch-ивент сервера MMC без лагов
            local microOscillation = Vector3.new(math.sin(tick() * 45) * 0.1, -0.1, math.cos(tick() * 45) * 0.1)
            myRoot.CFrame = currentDroppedGun.CFrame * CFrame.new(microOscillation)
        end
    end
end)

-- Подмена Hit мыши
local oldIndex
oldIndex = hookmetamethod(game, "__index", function(self, key)
    if _G.L1TE_Silent and tostring(self) == "Mouse" and key == "Hit" then
        local target = getClosestPlayerToCenter()
        if target then return target.CFrame end
    end
    return oldIndex(self, key)
end)

-- Перехват лучей Raycast
local oldNamecall
oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
    local method = getnamecallmethod()
    local args = {...}
    
    if _G.L1TE_Silent and (method == "FindPartOnRayWithIgnoreList" or method == "Raycast" or method == "FireServer") then
        local target = getClosestPlayerToCenter()
        if target then
            if method == "FireServer" and (tostring(self):find("Shoot") or tostring(self):find("Gun")) then
                for i, arg in pairs(args) do
                    if typeof(arg) == "Vector3" then args[i] = target.Position
                    elseif typeof(arg) == "CFrame" then args[i] = target.CFrame end
                end
                return oldNamecall(self, unpack(args))
            end
            
            if method == "FindPartOnRayWithIgnoreList" or method == "Raycast" then
                local origin = args
                if typeof(origin) == "Ray" then
                    args = Ray.new(origin.Origin, (target.Position - origin.Origin).Unit * 1000)
                elseif typeof(origin) == "Vector3" and typeof(args) == "Vector3" then
                    args = (target.Position - origin).Unit * 1000
                end
                return oldNamecall(self, unpack(args))
            end
        end
    end
    return oldNamecall(self, ...)
end)
