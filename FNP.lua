print('Script')

_G.autoplay = true

vim = cloneref(game:GetService("VirtualInputManager"))


buttons = {"A","S","W","D"}

local module = require(game.ReplicatedStorage.Modules.Note)
local gamemodule = require(game.ReplicatedStorage.Modules.Conductor)
local func = module.SpawnNote

function main(path,timer)
                repeat
                    task.wait(0.01)
                until gamemodule.SongPos >= timer
                local numb = path+1
                --print("GOAT",buttons[numb],arg['Side'],arg['IsSustain'])
                vim:SendKeyEvent(1,Enum.KeyCode[buttons[numb]],0,nil)
            end

event = Instance.new("BindableEvent",workspace)

event.Event:Connect(function(path,timer)
    main(path,timer)
end)

local o
o = hookfunction(func, function(...)
    local args = {...}
    for _,arg in pairs(args) do
        if type(arg) == "table" and arg["MustPress"] == true and arg["shouldPress"] == true then
            --print(chet,arg["NoteData"],arg['Side'],arg['IsSustain'],arg['StrumTime'],gamemodule.SongPos)
            if _G.autoplay == true then
                event:Fire(arg["NoteData"],arg["StrumTime"])
            end
        end
    end
    return o(...)
end)
