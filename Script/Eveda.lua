-- Rayfield yükleniyor
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Pencere oluşturuluyor
local Window = Rayfield:CreateWindow({
    Name = "Evade - LCX TEAM HACK",
    LoadingTitle = "LCX SYSTEM",
    LoadingSubtitle = "by Draconis",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "EvadeDraconisConfig",
        FileName = "LCXGUI"
    },
    Discord = {
        Enabled = false
    },
    KeySystem = false,
})

-- Sekme
local MainTab = Window:CreateTab("Ana Panel", 4483345998)

-- Speed Değeri
local targetSpeed = 16
local SpeedSlider = MainTab:CreateSlider({
    Name = "Speed Hack",
    Range = {16, 150},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 16,
    Callback = function(Value)
        targetSpeed = Value
    end,
})

-- Jump Değeri
local targetJump = 50
local JumpSlider = MainTab:CreateSlider({
    Name = "Jump Hack",
    Range = {50, 250},
    Increment = 1,
    Suffix = "Jump",
    CurrentValue = 50,
    Callback = function(Value)
        targetJump = Value
    end,
})

-- Sürekli olarak değerleri güncelle (anti-anti-cheat için)
game:GetService("RunService").RenderStepped:Connect(function()
    local plr = game.Players.LocalPlayer
    local char = plr.Character or plr.CharacterAdded:Wait()
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = targetSpeed
        humanoid.JumpPower = targetJump
    end
end)

-- Fly özelliği
local flying = false
local FlyToggle = MainTab:CreateToggle({
    Name = "Fly Hack (Beta)",
    CurrentValue = false,
    Callback = function(Value)
        local plr = game.Players.LocalPlayer
        local char = plr.Character or plr.CharacterAdded:Wait()
        local root = char:WaitForChild("HumanoidRootPart")
        if Value then
            flying = true
            local bv = Instance.new("BodyVelocity")
            bv.Name = "EvadeFLY"
            bv.MaxForce = Vector3.new(1e5, 1e5, 1e5)
            bv.Velocity = Vector3.new(0, 50, 0)
            bv.Parent = root
        else
            flying = false
            local fly = root:FindFirstChild("EvadeFLY")
            if fly then fly:Destroy() end
        end
    end,
})

-- Uyarı
MainTab:CreateParagraph({Title = "Uyarı", Content = "Fly bazı yerlerde çalışmayabilir. LCX yakında güncelleyecek."})
