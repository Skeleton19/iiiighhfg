_G.autoplay = false
_G.arrows = 4
_G.offset = 17 --100 = 1 sekunda

local repo = 'https://raw.githubusercontent.com/Skeleton19/LinoriaLib/main/'
local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local Window = Library:CreateWindow({
    Title = '',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})

local Tabs = {
    Main = Window:AddTab('Main'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
}
local LeftGroupBox = Tabs.Main:AddLeftGroupbox('Main')

LeftGroupBox:AddToggle('autoplay', {
    Text = 'AutoPlay Toggle',
    Default = _G.autoplay,

    Callback = function(Value)
        _G.autoplay = Value
    end
}):AddKeyPicker('autoplaybind', {
    Default = '',
    SyncToggleState = false,
    Mode = 'Toggle',
    Text = 'AutoPlay keybind',
    NoUI = false,
    Callback = function(Value)
        Toggles.autoplay:SetValue(Value)
    end,
    ChangedCallback = function(New)
    end
})
LeftGroupBox:AddSlider('arrows', {
    Text = 'Arrow',
    Default = _G.arrows,
    Min = 4,
    Max = 9,
    Rounding = 0,
    Compact = true,

    Callback = function(Value)
        _G.arrows = Value
    end
})
LeftGroupBox:AddSlider('offset', {
    Text = 'Offset',
    Default = _G.offset,
    Min = -50,
    Max = 200,
    Rounding = 1,
    Compact = true,

    Callback = function(Value)
        _G.offset = Value
    end
})

Library:OnUnload(function()

    print('Unloaded!')
    Library.Unloaded = true
end)
local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')
MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu keybind' })
Library.ToggleKeybind = Options.MenuKeybind -- Allows you to have a custom keybind for the menu
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })
ThemeManager:SetFolder('MyScriptHub')
SaveManager:SetFolder('MyScriptHub/specific-game')
SaveManager:BuildConfigSection(Tabs['UI Settings'])
ThemeManager:ApplyToTab(Tabs['UI Settings'])
SaveManager:LoadAutoloadConfig()
print('Script')

 
vim = cloneref(game:GetService("VirtualInputManager"))
 
 
 
local buttons
 
local module = require(game.ReplicatedStorage.Modules.Note)
local gamemodule = require(game.ReplicatedStorage.Modules.Conductor)
local func = module.SpawnNote
 
 
local event = Instance.new("BindableEvent")
 
event.Event:Connect(function(path,timer,l)
    repeat
        task.wait()
    until gamemodule.SongPos >= timer-_G.offset
    local numb = path+1
if _G.arrows == 4 then
    buttons = {"F","G","H","J"}
elseif _G.arrows == 5 then
    buttons = {"F","G","Space","J","K"}
elseif _G.arrows == 6 then
    buttons = {"F","G","H","J","K","L"}
elseif _G.arrows == 7 then
    buttons = {"F","G","H","Space","J","K","L"}
elseif _G.arrows == 8 then
    buttons = {"F","G","H","J","K","L","Semicolon","Quote"}
elseif _G.arrows == 9 then
    buttons = {"F","G","H","J","Space","K","L","Semicolon","Quote"}
else
    warn('Недопустимое значение стрелок')
end
    vim:SendKeyEvent(1,Enum.KeyCode[buttons[numb]],0,nil)
end)
 
local o
o = hookfunction(func, function(...)
    local args = {...}
    for _,arg in pairs(args) do
        if type(arg) == "table" and arg["MustPress"] == true and arg["shouldPress"] == true then
            --print(chet,arg["NoteData"],arg['Side'],arg['IsSustain'],arg['StrumTime'],gamemodule.SongPos)
             if _G.autoplay == true then
                event:Fire(arg["NoteData"],arg["StrumTime"],arg["SustainLength"])
            end
        end
    end
    return o(...)
end)
