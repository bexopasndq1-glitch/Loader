local StarterGui = game:GetService("StarterGui")

local BLOX_FRUITS = "https://raw.githubusercontent.com/bexopasndq1-glitch/bloxfruits/refs/heads/main/script.lua"
local DOORS = "https://raw.githubusercontent.com/bexopasndq1-glitch/doorsek/refs/heads/main/script.lua"

local SCRIPTS = {
    [2753915549] = BLOX_FRUITS,
    [4442272183] = BLOX_FRUITS,
    [7449423635] = BLOX_FRUITS,
    [6516141723] = DOORS,
    [6839171747] = DOORS,
}

local function notify(text)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "VitaHub", Text = text, Duration = 5,
        })
    end)
end

local url = SCRIPTS[game.PlaceId]

if not url then
    notify("Эта игра не поддерживается / This game is not supported")
    return
end

local ok, err = pcall(function()
    loadstring(game:HttpGet(url))()
end)

if not ok then
    warn("[VitaHub] " .. tostring(err))
    notify("Не удалось загрузить скрипт / Failed to load the script")
end
