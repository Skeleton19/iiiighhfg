local rd = function(num, places)
    places = math.pow(10, places or 0)
    num = num * places
    if num >= 0 then 
        num = math.floor(num + 0.5) 
    else 
        num = math.ceil(num - 0.5) 
    end
    return num / places
end

local plrs = cloneref(game:GetService("Players"))
local runs = cloneref(game:GetService("RunService"))
local vim = cloneref(game:GetService("VirtualInputManager"))
local plr = plrs.LocalPlayer
local plrgui = plr:WaitForChild("PlayerGui")
local rgui = plrgui.GameUI.realGameUI
local lnotes = rgui.Notes.DadNotes
local rnotes = rgui.Notes.BFNotes

local arrow = {arrow1,arrow2,arrow3,arrow4}
local keys = {"A","S","W","D"}
local miss = {
    "rbxassetid://16660065846",
    "rbxassetid://12884744557",
}
local first = true
local connect
local igra = false
local debouce = false

local con1
local con2

local basexscale = 0.240624994

print('1')

_G.autoplay = true
_G.magnitude = 50
_G.mod = false



function checkmiss(arrow)
    local arrowid = arrow.Image
    for _,id in pairs(miss) do
        if arrowid == id then
            return "true"
        end
    end
end


function getside(folder)
    for _,text in pairs(folder:GetDescendants()) do
        if text:IsA("TextLabel") then
            if text.Position.X.Scale == 0.75 then
                return "right"
            elseif text.Position.X.Scale == 0.25 then
                return "left"
            end
        end
    end
end


function play(noti)
if connect then connect:Disconnect() end
connect = noti.ChildAdded:Connect(function(c)
        if c.Name ~= "1" and c.Name ~= "2" and c.Name ~= "3" and c.Name ~= "4" and c.Name ~= "TextLabel" then
            task.wait()
            if checkmiss(c) then return end
            function main()
                local k 

                if first == true then
                    first = false
                    for _,arro in pairs(noti:GetChildren()) do
                        if arro.Name == "1" and arro.Image ~= 'rbxassetid://10042444725' then
                            arrow[1] = arro
                        elseif arro.Name == "2" and arro.Image ~= 'rbxassetid://10042444725' then
                            arrow[2] = arro
                        elseif arro.Name == "3" and arro.Image ~= 'rbxassetid://10042444725' then
                            arrow[3] = arro
                        elseif arro.Name == "4" and arro.Image ~= 'rbxassetid://10042444725' then
                            arrow[4] = arro
                        end
                    end
                end
                local xpos = c.Position.X.Scale
                local path = nil

                if xpos == arrow[1].Position.X.Scale then
                    path = 1
                elseif xpos == arrow[2].Position.X.Scale then
                    path = 2
                elseif xpos == arrow[3].Position.X.Scale then
                    path = 3
                elseif xpos == arrow[4].Position.X.Scale then
                    path = 4
                end
                local movdir = nil
                local oldpos = c.Position
                k = c:GetPropertyChangedSignal("Position"):Connect(function()
                    if _G.mod == false then
                        if c.Position.Y.Scale <= arrow[path].Position.Y.Scale then
                            local key = keys[path]
                            vim:SendKeyEvent(1,Enum.KeyCode[key],0,nil)
                            local sled = nil
                        
                            for _,contarrow in pairs(noti:GetChildren()) do
                                if contarrow.Name == c.Name ~= "1" and c.Name ~= "2" and c.Name ~= "3" and c.Name ~= "4" and c.Name ~= "TextLabel" then
                                    local xpos1 = rd(contarrow.Position.X.Scale,3)
                                    local xpos2 = rd(c.Position.X.Scale,3)
                                    if xpos1 == xpos2 then
                                        if contarrow.Size.X.Scale < basexscale then
                                            local raz = math.abs(c.Position.Y.Scale-contarrow.Position.Y.Scale)
                                            if raz <= 0.3 then
                                                sled = contarrow
                                                break
                                            end
                                        end
                                    end
                                end
                            end
                        
 
                            if sled ~= nil then
                            else
                                vim:SendKeyEvent(0,Enum.KeyCode[key],0,nil)
                            end
                            k:Disconnect()
                        end
                    else
                        if (c.AbsolutePosition-arrow[path].AbsolutePosition).Magnitude <= _G.magnitude then
                            local key = keys[path]
                            vim:SendKeyEvent(1,Enum.KeyCode[key],0,nil)
                            local sled = nil
                        
                            for _,contarrow in pairs(noti:GetChildren()) do
                                if contarrow.Name == c.Name ~= "1" and c.Name ~= "2" and c.Name ~= "3" and c.Name ~= "4" and c.Name ~= "TextLabel" then
                                    local xpos1 = rd(contarrow.Position.X.Scale,3)
                                    local xpos2 = rd(c.Position.X.Scale,3)
                                    if xpos1 == xpos2 then
                                        if contarrow.Size.X.Scale < basexscale then
                                            local raz = math.abs(c.Position.Y.Scale-contarrow.Position.Y.Scale)
                                            if raz <= 0.3 then
                                                sled = contarrow
                                                break
                                            end
                                        end
                                    end
                                end
                            end
                        
                            if sled ~= nil then
                            else
                                vim:SendKeyEvent(0,Enum.KeyCode[key],0,nil)
                            end
                            k:Disconnect()
                        end
                    end
                end)
            end
            coroutine.wrap(main)()
        end
end)
end

local repo = 'https://raw.githubusercontent.com/Skeleton19/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local Window = Library:CreateWindow({
    Title = 'Friday Night Partying',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})

local Tabs = {
    Main = Window:AddTab('Main'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
}


local ap = Tabs.Main:AddLeftGroupbox('AutoPlay')


ap:AddToggle('MyToggle', {
    Text = 'AutoPlay',
    Default = false, -- Default value (true / false)
    Tooltip = 'Turns off/on autoplay', -- Information shown when you hover over the toggle

    Callback = function(Value)
        if Value == true then
            con1 = rgui.ChildAdded:Connect(function(d)
                if igra == false then
                    if d.Name == "JudgementLabels" then
                        igra = true
                        debounce = true
                        local nota
                        task.wait(1)
                        local side = getside(d)
                        if side == "left" then
                            nota = lnotes
                        else
                            nota = rnotes
                        end
                        play(nota)
                        task.delay(2,function()
                            debouce = false
                        end)
                    end
                end
            end)
            con2 = rgui.ChildRemoved:Connect(function(d)
                if igra == true and debouce == false then
                    igra = false
                    if connect then connect:Disconnect() end
                    first = true
                    vim:SendKeyEvent(0,Enum.KeyCode.A,0,nil)
                    vim:SendKeyEvent(0,Enum.KeyCode.D,0,nil)
                    vim:SendKeyEvent(0,Enum.KeyCode.W,0,nil)
                    vim:SendKeyEvent(0,Enum.KeyCode.S,0,nil)
                end
            end)
        else
            if con1 then con1:Disconnect() end
            if con2 then con2:Disconnect() end
            if igra == true then
                igra = false
                if connect then connect:Disconnect() end
                first = true
                vim:SendKeyEvent(0,Enum.KeyCode.A,0,nil)
                vim:SendKeyEvent(0,Enum.KeyCode.D,0,nil)
                vim:SendKeyEvent(0,Enum.KeyCode.W,0,nil)
                vim:SendKeyEvent(0,Enum.KeyCode.S,0,nil)
            end
        end
    end
    })




local Depbox = ap:AddDependencyBox();
Depbox:AddToggle('DepboxToggle', { Text = 'Modchart toggle',Default = false,
    Callback = function(Value)
        _G.mod = Value
    end
});


local SubDepbox = Depbox:AddDependencyBox();
SubDepbox:AddSlider('slider', { Text = 'Magnitude', Default = _G.magnitude, Min = 20, Max = 100, Rounding = 1,
    Callback = function(Value) 
        _G.magnitude = Value
    end
});
SubDepbox:AddDropdown('DepboxDropdown', { Text = 'Presets', Default = 1, Values = {'Detected', 'Funken', 'c'},
    Callback = function(Value)
        if Value == "Detected" then
            _G.magnitude = 50
            Options.slider:SetValue(50)
        elseif Value == "Funken" then
            _G.magnitude = 40
            Options.slider:SetValue(40)
        end
    end
});


SubDepbox:SetupDependencies({
    { Toggles.DepboxToggle, true }
});







Library:SetWatermarkVisibility(false)

local FrameTimer = tick()
local FrameCounter = 0;
local FPS = 60;

local WatermarkConnection = game:GetService('RunService').RenderStepped:Connect(function()
    FrameCounter += 1;

    if (tick() - FrameTimer) >= 1 then
        FPS = FrameCounter;
        FrameTimer = tick();
        FrameCounter = 0;
    end;

    Library:SetWatermark(('LinoriaLib demo | %s fps | %s ms'):format(
        math.floor(FPS),
        math.floor(game:GetService('Stats').Network.ServerStatsItem['Data Ping']:GetValue())
    ));
end);

Library.KeybindFrame.Visible = true; -- todo: add a function for this

Library:OnUnload(function()
    WatermarkConnection:Disconnect()

    print('Unloaded!')
    Library.Unloaded = true
end)

-- UI Settings
local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')

-- I set NoUI so it does not show up in the keybinds menu
MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu keybind' })

Library.ToggleKeybind = Options.MenuKeybind -- Allows you to have a custom keybind for the menu

-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- ThemeManager (Allows you to have a menu theme system)

-- Hand the library over to our managers
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- Adds our MenuKeybind to the ignore list
-- (do you want each config to have a different menu key? probably not.)
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
ThemeManager:SetFolder('MyScriptHub')
SaveManager:SetFolder('MyScriptHub/specific-game')

-- Builds our config menu on the right side of our tab
SaveManager:BuildConfigSection(Tabs['UI Settings'])

-- Builds our theme menu (with plenty of built in themes) on the left side
-- NOTE: you can also call ThemeManager:ApplyToGroupbox to add it to a specific groupbox
ThemeManager:ApplyToTab(Tabs['UI Settings'])

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()
