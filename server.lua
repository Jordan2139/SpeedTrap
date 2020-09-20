------------------------------------------------------------
-- Simple Whitelisted Speed Warning, Made By Jordan.#2139 --
------------------------------------------------------------

----------------------------------------------------------------------------------------------
                  -- !WARNING! !WARNING! !WARNING! !WARNING! !WARNING! --
        -- DO NOT TOUCH THIS FILE OR YOU /WILL/ FUCK SHIT UP! EDIT THE CONFIG.LUA --
-- DO NOT BE STUPID AND WHINE TO ME ABOUT THIS BEING BROKEN IF YOU TOUCHED THE LINES BELOW. --
----------------------------------------------------------------------------------------------


function GetPermissions(src)
    for k, v in ipairs(GetPlayerIdentifiers(src)) do 
        if string.sub(v, 1, string.len("discord:")) == "discord" then
            identifierDiscord = v
        end
    end
    if identifierDiscord then
        exports['discordroles']:isRolePresent(src, discordRoleIds, function(hasRole, roles)
            if not roles then
                return false
            end
            if hasRole then
                return true
            else
                return false
            end
        end)
    end 
end

function GetAllPlayers()
    local players = {}

    for _, i in ipairs(GetPlayers()) do
        table.insert(players, i)    
    end

    return players
end


RegisterNetEvent('AllowSpeed')
AddEventHandler('AllowSpeed', function()
    local src = source;
    if IsPlayerAceAllowed(src, "jordan.gofast") or GetPermissions(src) or src <= 0 then
        TriggerClientEvent('AllowSpeedClient', src)
    else
    TriggerClientEvent('DoAllowSpeedClient', src)
    print('noperms = poop')
    Wait(6000)
        local players = GetAllPlayers()
        for i=1, #players do
            if IsPlayerAceAllowed(players[i], 'jordan.gofastwatch') or src <= 0 then 
                TriggerClientEvent('chatMessage', players[i], "^9[^7SpeedTrap^9] Player ^1" .. GetPlayerName(src) .. " ^3is going over " .. Config.maxspeedwarning .. "^1")
            end
    end
end
end)

print("\n^7Simple Whitelisted Speed Warning | ^6 Made By Jordan.#2139^7")
