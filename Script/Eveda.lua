local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

local Window = OrionLib:MakeWindow({
	Name = "Evade - LCX TEAM HACK",
	HidePremium = false,
	SaveConfig = true,
	ConfigFolder = "EvadeDraconisConfig"
})

local MainTab = Window:MakeTab({
	Name = "Ana Panel",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

-- Güvenli Humanoid erişimi
local function getHumanoid()
	local plr = game.Players.LocalPlayer
	local char = plr.Character or plr.CharacterAdded:Wait()
	return char:WaitForChild("Humanoid"), char
end

-- Speed Hack
local targetSpeed = 16
MainTab:AddSlider({
	Name = "Speed Hack",
	Min = 16,
	Max = 150,
	Default = 16,
	Color = Color3.fromRGB(255, 255, 255),
	Increment = 1,
	ValueName = "Speed",
	Callback = function(Value)
		targetSpeed = Value
	end
})

-- Jump Hack
local targetJump = 50
MainTab:AddSlider({
	Name = "Jump Hack",
	Min = 50,
	Max = 250,
	Default = 50,
	Color = Color3.fromRGB(255, 255, 255),
	Increment = 1,
	ValueName = "JumpPower",
	Callback = function(Value)
		targetJump = Value
	end
})

-- Değerleri anti-cheat’e karşı sürekli sabitle
game:GetService("RunService").RenderStepped:Connect(function()
	local humanoid = getHumanoid()
	if humanoid then
		if humanoid.WalkSpeed ~= targetSpeed then
			humanoid.WalkSpeed = targetSpeed
		end
		if humanoid.JumpPower ~= targetJump then
			humanoid.JumpPower = targetJump
		end
	end
end)

-- Fly sistemi
local flyEnabled = false
local function addFly(char)
	local root = char:WaitForChild("HumanoidRootPart")
	if not root:FindFirstChild("EvadeFLY") then
		local bv = Instance.new("BodyVelocity")
		bv.Name = "EvadeFLY"
		bv.MaxForce = Vector3.new(1e5, 1e5, 1e5)
		bv.Velocity = Vector3.new(0, 50, 0)
		bv.Parent = root
	end
end

MainTab:AddToggle({
	Name = "Fly hack (Beta)",
	Default = false,
	Callback = function(state)
		local plr = game.Players.LocalPlayer
		flyEnabled = state

		if flyEnabled then
			addFly(plr.Character or plr.CharacterAdded:Wait())
			plr.CharacterAdded:Connect(function(char)
				if flyEnabled then
					wait(1)
					addFly(char)
				end
			end)
		else
			local char = plr.Character
			if char then
				local fly = char:FindFirstChild("HumanoidRootPart"):FindFirstChild("EvadeFLY")
				if fly then
					fly:Destroy()
				end
			end
		end
	end
})

MainTab:AddParagraph("Uyarı", "Hile şuanda ACC nedeniyle kötü veya hatalı çalışabilir. LCX ekibimiz en yakın zamanda çözecektir.")

OrionLib:Init()
