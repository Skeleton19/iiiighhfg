for i, v in pairs(game:GetService("CoreGui"):GetChildren()) do
	if v.Name == "ui" then
		v:Destroy()
	end
end
local UI = loadstring(game:HttpGetAsync("https://pastebin.com/raw/QAwr1iuM"))()

local window = UI:Window("By kipr987")
local nif = UI:Notification("Welcome to", game:GetService("Players").LocalPlayer.Name, "Okay!")
local hitbox = window:Tab("Hitbox")
local esp = window:Tab("Esp")
local setting = window:Tab("Setting")
setting:Label("Gui Open/Close [H]")
game:GetService("UserInputService").InputBegan:Connect(function(key, event)
	if event then return end
	pcall(function()
		if key.KeyCode == Enum.KeyCode.H then
			if game:GetService("CoreGui").ui.Enabled == false then
				game:GetService("CoreGui").ui.Enabled = true
			else
				game:GetService("CoreGui").ui.Enabled = false
			end
		end
	end)
end)
_G.torso = false
_G.head = false
_G.hitSize = 5
hitbox:Toggle("Torso", false, function(value)
	_G.torso = value
end)
hitbox:Toggle("Head", false, function(value)
	_G.head = value
end)
hitbox:Slider("Size", 0, 50, 5, function(value)
	_G.hitSize = value
end)
esp:Toggle("Esp", false, function(value)
	_G.Esp = value
end)

game:GetService("RunService").RenderStepped:Connect(function()
	pcall(function()
		if _G.torso then
			if game:GetService("Players").LocalPlayer.Team == nil then
				for i, v in pairs(game:GetService("Players"):GetChildren()) do
					local HumanoidRootPart = v.Character:FindFirstChild("HumanoidRootPart")
					if v.Name ~= game:GetService("Players").LocalPlayer.Name and HumanoidRootPart then
						HumanoidRootPart.Size = Vector3.new(_G.hitSize,_G.hitSize,_G.hitSize)
						HumanoidRootPart.Transparency = .7
						HumanoidRootPart.CanCollide = false 
					end
				end
			else
				for i, v in pairs(game:GetService("Players"):GetChildren()) do
					local HumanoidRootPart = v.Character:FindFirstChild("HumanoidRootPart")
					if v.Name ~= game:GetService("Players").LocalPlayer.Name and HumanoidRootPart and v.Character.Humanoid.Health > 0 then
						HumanoidRootPart.Size = Vector3.new(_G.hitSize,_G.hitSize,_G.hitSize)
						HumanoidRootPart.Transparency = .7
						HumanoidRootPart.CanCollide = false
					elseif v.Name ~= game:GetService("Players").LocalPlayer.Name then
						HumanoidRootPart.Size = Vector3.new(2,2,1)
						HumanoidRootPart.Transparency = 1
					end
				end
			end
		else
			for i, v in pairs(game:GetService("Players"):GetChildren()) do
				local HumanoidRootPart = v.Character:FindFirstChild("HumanoidRootPart")
				if v.Name ~= game:GetService("Players").LocalPlayer.Name and HumanoidRootPart then
					HumanoidRootPart.Size = Vector3.new(2,2,1)
					HumanoidRootPart.Transparency = 1
				end
			end
		end
	end)
end)

game:GetService("RunService").RenderStepped:Connect(function()
	pcall(function()
		if _G.head then
			if game:GetService("Players").LocalPlayer.Team == nil then
				for i, v in pairs(game:GetService("Players"):GetChildren()) do
					local HumanoidRootPart = v.Character:FindFirstChild("Head")
					if v.Name ~= game:GetService("Players").LocalPlayer.Name and HumanoidRootPart and HumanoidRootPart.Parent:FindFirstChild("Humanoid").Health > 0 then
						HumanoidRootPart.Massless = true
						HumanoidRootPart.Size = Vector3.new(_G.hitSize,_G.hitSize,_G.hitSize)
						HumanoidRootPart.Transparency = .7
						HumanoidRootPart.CanCollide = false 
					end
				end
			else
				for i, v in pairs(game:GetService("Players"):GetChildren()) do
					local HumanoidRootPart = v.Character:FindFirstChild("Head")
					if v.Name ~= game:GetService("Players").LocalPlayer.Name and HumanoidRootPart and HumanoidRootPart.Parent:FindFirstChild("Humanoid").Health > 0 then
						HumanoidRootPart.Massless = true
						HumanoidRootPart.Size = Vector3.new(_G.hitSize,_G.hitSize,_G.hitSize)
						HumanoidRootPart.Transparency = .7
						HumanoidRootPart.CanCollide = false
					elseif v.Name ~= game:GetService("Players").LocalPlayer.Name then
						HumanoidRootPart.Size = Vector3.new(1,1,1)
						HumanoidRootPart.Transparency = 0
					end
				end
			end
		else
			for i, v in pairs(game:GetService("Players"):GetChildren()) do
				local HumanoidRootPart = v.Character:FindFirstChild("Head")
				if v.Name ~= game:GetService("Players").LocalPlayer.Name and HumanoidRootPart then
					HumanoidRootPart.Size = Vector3.new(1,1,1)
					HumanoidRootPart.Transparency = 0
				end
			end
		end
	end)
end)
