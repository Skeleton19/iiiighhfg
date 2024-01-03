local repo = 'https://raw.githubusercontent.com/Skeleton19/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local Window = Library:CreateWindow({
    Title = 'Basically FNF Remix',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})

local MainTab = Window:AddTab('Main')
local LeftGroupBox = MainTab:AddLeftGroupbox('Autoplayer')

settings = {
autoPlay = {
enabled = false
}
}

LeftGroupBox:AddToggle('Toggle', {
    Text = 'Toggle',
    Default = false,
    Tooltip = 'Enables Autoplayer',

    Callback = function(bool)
        settings.autoPlay.enabled = bool
    end
})

local VirtualInputManager = game:GetService("VirtualInputManager")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

arrowNotes = {
    ["Arrow1"] = 'Z',
    ["Arrow2"] = 'X',
    ["Arrow3"] = 'Semicolon',
    ["Arrow4"] = 'Quote'
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
