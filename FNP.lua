print('Script')

_G.autoplay = true

vim = cloneref(game:GetService("VirtualInputManager"))

local offset = 17 --100 = 1 sekunda

_G.arrows = 4

local buttons

local module = require(game.ReplicatedStorage.Modules.Note)
local gamemodule = require(game.ReplicatedStorage.Modules.Conductor)
local func = module.SpawnNote


event = Instance.new("BindableEvent")

event.Event:Connect(function(path,timer,l)
    repeat
        task.wait()
    until gamemodule.SongPos >= timer-offset
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
