local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/Skeleton19/Orion/main/source')))()

OrionLib:MakeNotification({
	Name = "Autoplayer",
	Content = "Loading...",
	Image = "rbxassetid://4483345998",
	Time = 5
})

local Window = OrionLib:MakeWindow({Name = "Autoplayer", HidePremium = false, SaveConfig = false, ConfigFolder = "Basically FNF Remix"})

local PlayerTab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local PlayerSection = PlayerTab:AddSection({
	Name = "Toggle"
})

settings = {
autoPlay = {
enabled = false
}
}

PlayerSection:AddToggle({
	Name = "Turn On/Off",
	Default = false,
	Callback = function(bool)
        settings.autoPlay.enabled = bool
  	end    
})

local VirtualInputManager = game:GetService("VirtualInputManager")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

arrowNotes = {
    ["Arrow2"] = 'Z',
    ["Arrow1"] = 'X',
    ["Arrow4"] = 'Semicolon',
    ["Arrow3"] = 'Quote'
}

function getSide()
    local side = LocalPlayer.File.CurrentPlayer.Value

    if tostring(side) == 'Player2' then
        return '2'
    elseif tostring(side) == 'Player1' then
        return '1'
    end

    return nil
end

playedNotes = {}

while wait() do
    playedNotes = {}

    if LocalPlayer.File.CurrentPlayer.Value then
        local side = getSide()

        if side then
            for _,v in pairs(LocalPlayer.PlayerGui.Main.MatchFrame['KeySync' .. side]:GetChildren()) do
                local frame = v.Notes
                for _, note in pairs(frame:GetChildren()) do
                    if settings.autoPlay.enabled == true then
                        local distance = (note.AbsolutePosition - v.AbsolutePosition).magnitude
                        if distance < 30 then
                            local curParent = note.Parent
                            VirtualInputManager:SendKeyEvent(0, arrowNotes[v.Name], 0, game)
                            VirtualInputManager:SendKeyEvent(1, arrowNotes[v.Name], 0, game)
                        end
                    end
                end
            end
        end
    end
end
