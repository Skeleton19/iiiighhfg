repeat wait() until game:IsLoaded()
local expectedPlaceId = 6000468131
if game.PlaceId ~= expectedPlaceId then
    return
end

local repo = 'https://raw.githubusercontent.com/Skeleton19/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local Window = Library:CreateWindow({
    Title = 'Granny',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})

local MainTab = Window:AddTab('Main')
local LeftGroupBox = MainTab:AddLeftGroupbox('ESP')

LeftGroupBox:AddToggle('Key ESP', {
    Text = 'Key ESP',
    Default = false,
    Tooltip = 'penis',

    Callback = function(Value)
        KeyESP = Value
    end
})

LeftGroupBox:AddToggle('Enemy ESP', {
    Text = 'Enemy ESP',
    Default = false,
    Tooltip = 'penis',

    Callback = function(Value)
        EnemyESP = Value
    end
})

LeftGroupBox:AddToggle('Tool ESP', {
    Text = 'Tool ESP',
    Default = false,
    Tooltip = 'penis',

    Callback = function(Value)
        ToolESP = Value
    end
})

LeftGroupBox:AddToggle('Player ESP', {
    Text = 'Player ESP',
    Default = false,
    Tooltip = 'penis',

    Callback = function(Value)
        PlayerESP = Value
    end
})

LeftGroupBox:AddToggle('Traps ESP', {
    Text = 'Traps ESP',
    Default = false,
    Tooltip = 'penis',

    Callback = function(Value)
        TrapsESP = Value
    end
})

LeftGroupBox:AddToggle('Exits ESP', {
    Text = 'Exits ESP',
    Default = false,
    Tooltip = 'penis',

    Callback = function(Value)
        ExitsESP = Value
    end
})

LeftGroupBox:AddToggle('Interacts ESP', {
    Text = 'Interacts ESP',
    Default = false,
    Tooltip = 'penis',

    Callback = function(Value)
        InteractsESP = Value
    end
})

LeftGroupBox:AddLabel('Menu keybind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu keybind' })
Library.ToggleKeybind = Options.MenuKeybind

while wait(1) do
	pcall(function()
		local er = game.Workspace:WaitForChild("Map")
		local map = ""

		local function updateMap()
			if er:FindFirstChild("House") then
				map = "House"
			elseif er:FindFirstChild("House II") then
				map = "House II"
			elseif er:FindFirstChild("Mansion") then
				map = "Mansion"
			elseif er:FindFirstChild("School") then
				map = "School"
			elseif er:FindFirstChild("House easy") then
				map = "House easy"
			elseif er:FindFirstChild("House II easy") then
				map = "House II easy"
			elseif er:FindFirstChild("Mansion easy") then
				map = "Mansion easy"
			elseif er:FindFirstChild("Ski resort") then
				map = "Ski resort"
			elseif er:FindFirstChild("") then
				map = ""
			end
		end

		updateMap()
		
		if er:FindFirstChild(map) then
			if KeyESP == true then
				for i, key in pairs(er[map]:WaitForChild("Tools").Map:GetChildren()) do 
					if key.Name:find("key") then
						if not key:FindFirstChild("Highlight") then
							if not key.Handle then continue end

							local Highlight = Instance.new("Highlight")
							local Billboard = Instance.new("BillboardGui")
							local Name = Instance.new("TextLabel")
							local NameStroke = Instance.new("UIStroke")

							Highlight.FillColor = Color3.fromRGB(255, 170, 0)
							Highlight.OutlineTransparency = 0.9
							Highlight.Parent = key

							Billboard.Parent = key.Handle
							Billboard.ExtentsOffset = Vector3.new(0, 2, 0)
							Billboard.Size = UDim2.new(0, 200, 0, 50)
							Billboard.AlwaysOnTop = true
							Billboard.LightInfluence = 0

							Name.Parent = Billboard
							Name.BackgroundTransparency = 1
							Name.TextScaled = true
							Name.Text = key.Name
							Name.TextColor3 = Color3.fromRGB(255, 255, 255)
							Name.Font = Enum.Font.Arial
							Name.Size = UDim2.new(1, 0, 1, 0)

							NameStroke.Parent = Name
							NameStroke.Thickness = 3
						end
					end
				end

			else

				for i, key in pairs(er[map]:WaitForChild("Tools").Map:GetChildren()) do
					if key:FindFirstChild("Highlight") then
						if key.Name:find("key") then
							key.Highlight:Destroy()
							key.Handle.BillboardGui:Destroy()
						end
					end
				end
			end
			if ToolESP == true then
				for i, tool in pairs(er[map]:WaitForChild("Tools").Map:GetChildren()) do
					if not tool.Name:find("key") then
						if not tool:FindFirstChild("Highlight") then
							local Highlight = Instance.new("Highlight")
							local Billboard = Instance.new("BillboardGui")
							local Name = Instance.new("TextLabel")
							local NameStroke = Instance.new("UIStroke")

							Highlight.FillColor = Color3.fromRGB(255, 255, 0)
							Highlight.OutlineTransparency = 0.9
							Highlight.Parent = tool

							Billboard.Parent = tool.Handle
							Billboard.ExtentsOffset = Vector3.new(0, 2, 0)
							Billboard.Size = UDim2.new(0, 200, 0, 50)
							Billboard.AlwaysOnTop = true
							Billboard.LightInfluence = 0

							Name.Parent = Billboard
							Name.BackgroundTransparency = 1
							Name.TextScaled = true
							Name.Text = tool.Name
							Name.TextColor3 = Color3.fromRGB(255, 255, 255)
							Name.Font = Enum.Font.Arial
							Name.Size = UDim2.new(1, 0, 1, 0)

							NameStroke.Parent = Name
							NameStroke.Thickness = 3
						end
					end
				end

			else

				for i, tool in pairs(er[map]:WaitForChild("Tools").Map:GetChildren()) do
					if tool:FindFirstChild("Highlight") then
						if not tool.Name:find("key") then
							tool.Highlight:Destroy()
							tool.Handle.BillboardGui:Destroy()
						end
					end
				end
			end
			if InteractsESP == true then
				for i, interact in pairs(er[map]:WaitForChild("Interacts"):GetChildren()) do
					if not interact:FindFirstChild("Highlight") then
						local Highlight = Instance.new("Highlight")

						Highlight.FillColor = Color3.fromRGB(255, 255, 255)
						Highlight.OutlineTransparency = 0.9
						Highlight.Parent = interact
					end
				end

			else

				for i, interact in pairs(er[map]:WaitForChild("Interacts"):GetChildren()) do
					if interact:FindFirstChild("Highlight") then
						interact.Highlight:Destroy()
					end
				end		

			end
			if TrapsESP == true then
				for i, trap in pairs(er:WaitForChild("Traps"):GetChildren()) do
					if not trap:FindFirstChild("Highlight") then
						local Highlight = Instance.new("Highlight")
						local Billboard = Instance.new("BillboardGui")
						local Name = Instance.new("TextLabel")
						local NameStroke = Instance.new("UIStroke")

						Highlight.FillColor = Color3.fromRGB(255, 0, 0)
						Highlight.OutlineTransparency = 0.9
						Highlight.Parent = trap

						Billboard.Parent = trap.Base
						Billboard.ExtentsOffset = Vector3.new(0, 2, 0)
						Billboard.Size = UDim2.new(0, 200, 0, 50)
						Billboard.AlwaysOnTop = true
						Billboard.LightInfluence = 0

						Name.Parent = Billboard
						Name.BackgroundTransparency = 1
						Name.TextScaled = true
						Name.Text = trap.Name
						Name.TextColor3 = Color3.fromRGB(255, 0, 0)
						Name.Font = Enum.Font.Arial
						Name.Size = UDim2.new(1, 0, 1, 0)

						NameStroke.Parent = Name
						NameStroke.Thickness = 3
					end
				end

			else

				for i, trap in pairs(er:WaitForChild("Traps"):GetChildren()) do
					if trap:FindFirstChild("Highlight") then
						trap.Highlight:Destroy()
						trap.Base.BillboardGui:Destroy()
					end
				end

			end
			if EnemyESP == true then
				if er.Players:FindFirstChild("Enemy") then
					if not er:WaitForChild("Players").Enemy:FindFirstChild("Highlight") then
						local Highlight = Instance.new("Highlight")
						local Billboard = Instance.new("BillboardGui")
						local Name = Instance.new("TextLabel")
						local NameStroke = Instance.new("UIStroke")

						Highlight.FillColor = Color3.fromRGB(255, 0, 0)
						Highlight.OutlineTransparency = 0.9
						Highlight.Parent = er.Players.Enemy

						Billboard.Parent = er.Players.Enemy.HumanoidRootPart
						Billboard.ExtentsOffset = Vector3.new(0, 2, 0)
						Billboard.Size = UDim2.new(0, 200, 0, 50)
						Billboard.AlwaysOnTop = true
						Billboard.LightInfluence = 0

						Name.Parent = Billboard
						Name.BackgroundTransparency = 1
						Name.TextScaled = true
						Name.Text = er.Players.Enemy.Name
						Name.TextColor3 = Color3.fromRGB(255, 0, 0)
						Name.Font = Enum.Font.Arial
						Name.Size = UDim2.new(1, 0, 1, 0)

						NameStroke.Parent = Name
						NameStroke.Thickness = 3
					end
				end

			else

				if er:WaitForChild("Players"):FindFirstChild("Enemy") then
					if er.Players.Enemy:FindFirstChild("Highlight") then
						er.Players.Enemy.Highlight:Destroy()
					end			
				end		
			end	
			if PlayerESP == true then
				for i, player in pairs(er:WaitForChild("Players"):GetChildren()) do
						if not player:FindFirstChild("Highlight") then
							local Highlight = Instance.new("Highlight")
							local Billboard = Instance.new("BillboardGui")
							local Name = Instance.new("TextLabel")
							local NameStroke = Instance.new("UIStroke")

							Highlight.FillColor = Color3.fromRGB(0, 170, 0)
							Highlight.OutlineTransparency = 0.9
							Highlight.Parent = player
							Billboard.Parent = player.HumanoidRootPart
							Billboard.ExtentsOffset = Vector3.new(0, 2, 0)
							Billboard.Size = UDim2.new(0, 200, 0, 50)
							Billboard.AlwaysOnTop = true
							Billboard.LightInfluence = 0

							Name.Parent = Billboard
							Name.BackgroundTransparency = 1
							Name.TextScaled = true
							Name.Text = player.Name
							Name.TextColor3 = Color3.fromRGB(0, 170, 0)
							Name.Font = Enum.Font.Arial
							Name.Size = UDim2.new(1, 0, 1, 0)

							NameStroke.Parent = Name
							NameStroke.Thickness = 3						
						end
					end

			else

				for i, player in pairs(er:WaitForChild("Players"):GetChildren()) do
					if player:FindFirstChild("Highlight") then
						if not player.Name == "Enemy" then
							player.Highlight:Destroy()						
						end
					end			
				end		
			end	

			if TrapsESP == true then
				for i, exit in pairs(er[map].WinPath:GetChildren()) do
					if not exit:FindFirstChild("Highlight") then
						local Highlight = Instance.new("Highlight")
						local Billboard = Instance.new("BillboardGui")
						local Name = Instance.new("TextLabel")
						local NameStroke = Instance.new("UIStroke")

						Highlight.FillColor = Color3.fromRGB(0, 255, 255)
						Highlight.OutlineTransparency = 0.9
						Highlight.Parent = exit

						Billboard.Parent = exit
						Billboard.ExtentsOffset = Vector3.new(0, 0, 0)
						Billboard.Size = UDim2.new(0, 200, 0, 50)
						Billboard.AlwaysOnTop = true
						Billboard.LightInfluence = 0

						Name.Parent = Billboard
						Name.BackgroundTransparency = 1
						Name.TextScaled = true
						Name.Text = exit.Name
						Name.TextColor3 = Color3.fromRGB(0, 255, 255)
						Name.Font = Enum.Font.Arial
						Name.Size = UDim2.new(1, 0, 1, 0)

						NameStroke.Parent = Name
						NameStroke.Thickness = 3
					end
				end

			else

				for i, exit in pairs(er[map]:WaitForChild("WinPath"):GetChildren()) do
					if exit:FindFirstChild("Highlight") then
						exit.Highlight:Destroy()
						exit.Base.BillboardGui:Destroy()
					end
				end

			end
		end
	end)
end
