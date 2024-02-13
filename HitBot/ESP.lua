local function esp(v)
	spawn(function()
		pcall(function()
			if _G.Esp then
				repeat wait() until game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid")
				if v.Name ~= game:GetService("Players").LocalPlayer.Name then
					if v.Character:FindFirstChild("Highlight") then
						v.Character:FindFirstChild("Highlight"):Destroy()
					end
					hight = Instance.new("Highlight", v.Character)
					hight.FillTransparency = 1
					if not v.Character:FindFirstChild("BillboardGui") then
						local bill = Instance.new("BillboardGui", v.Character)
						bill.Adornee = v.Character
						bill.Size = UDim2.new(0, 200,0, 50)
						bill.StudsOffset = Vector3.new(0,4,0)
						bill.AlwaysOnTop = true

						local textlabel = Instance.new("TextLabel", bill)
						textlabel.Size = UDim2.new(1,0,1,0)
						textlabel.Position = UDim2.new(0,0,0,0)
						textlabel.Text = v.DisplayName
						textlabel.BackgroundTransparency = 1
						textlabel.TextSize = 17
						textlabel.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
						local textlabel2 = Instance.new("TextLabel", bill)
						textlabel2.Size = UDim2.new(1,0,1,0)
						textlabel2.Text = "[0]"
						textlabel2.Position = UDim2.new(0, 0,-0.3, 0)
						textlabel2.BackgroundTransparency = 1
						textlabel2.TextColor3 = Color3.new(1, 1, 1)
						textlabel2.TextSize = 17
						textlabel2.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
						local stroke = Instance.new("UIStroke", textlabel)
						local stroke = Instance.new("UIStroke", textlabel2)
						repeat 
							wait()
							textlabel.TextColor3 = v.TeamColor.Color
							textlabel2.Text = "["..math.floor((v.Character.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude).."]"
						until not bill
					end
				end
			else
				if v.Character:FindFirstChild("Highlight") then
					v.Character:FindFirstChild("Highlight"):Destroy()
				end
				if v.Character:FindFirstChild("BillboardGui") then
					v.Character:FindFirstChild("BillboardGui"):Destroy()
				end
			end
		end)
	end)
end
