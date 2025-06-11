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

MainTab:AddSlider({
	Name = "Speed Hack",
	Min = 16,
	Max = 150,
	Default = 16,
	Color = Color3.fromRGB(255, 255, 255),
	Increment = 1,
	ValueName = "Speed",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end
})

MainTab:AddSlider({
	Name = "Jump Hack",
	Min = 50,
	Max = 250,
	Default = 50,
	Color = Color3.fromRGB(255, 255, 255),
	Increment = 1,
	ValueName = "JumpPower",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
	end
})

MainTab:AddToggle({
	Name = "Fly hack (Beta)",
	Default = false,
	Callback = function(state)
		local plr = game.Players.LocalPlayer
		local char = plr.Character
		local humanoid = char:FindFirstChildOfClass("Humanoid")
		if state then
			local bodyVelocity = Instance.new("BodyVelocity", char.HumanoidRootPart)
			bodyVelocity.Velocity = Vector3.new(0, 50, 0)
			bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
			bodyVelocity.Name ="EvadeFLY"
		else
			local fly = char.HumanoidRootPart:FindFirstChild("EvadeFLY")
			if fly then fly:Destroy() end
		end
	end
})

MainTab:AddParagraph("Uyarı","Hile şuanda ACC nedeniyle kötü ve ya hatalı çalışabilir LCX ekimiz en yakın zamanda çözücekdir")

OrionLib:Init()
