------------------------------------------------------------
-- Simple Whitelisted Speed Warning, Made By Jordan.#2139 --
------------------------------------------------------------

----------------------------------------------------------------------------------------------
                  -- !WARNING! !WARNING! !WARNING! !WARNING! !WARNING! --
        -- DO NOT TOUCH THIS FILE OR YOU /WILL/ FUCK SHIT UP! EDIT THE CONFIG.LUA --
-- DO NOT BE STUPID AND WHINE TO ME ABOUT THIS BEING BROKEN IF YOU TOUCHED THE LINES BELOW. --
----------------------------------------------------------------------------------------------
debugEnabled = Config.debugEnabled;

function GetAllPlayers()
    local players = {}

    for _, i in ipairs(GetPlayers()) do
        table.insert(players, i)    
    end

    return players
end
AddEventHandler('playerDropped', function (reason)
    Cooldown[source] = nil;
end)

Cooldown = {}
Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1000); -- Every second
        for k, v in pairs(Cooldown) do 
            Cooldown[k] = Cooldown[k] - 1;
            if Cooldown[k] <= 0 then 
                Cooldown[k] = nil;
            end
        end
    end
end)
RegisterNetEvent('AllowSpeed')
AddEventHandler('AllowSpeed', function()
    local src = source;
    if debugEnabled then 
        print("[SpeedTrap Debug] AllowSpeed event ran...");
    end
    if IsPlayerAceAllowed(src, "jordan.gofast") then
        TriggerClientEvent('AllowSpeedClient', src)
    else
        TriggerClientEvent('DoAllowSpeedClient', src)
        if Cooldown[src] == nil then 
            local players = GetAllPlayers()
            for i=1, #players do
                if IsPlayerAceAllowed(players[i], 'jordan.gofastwatch') then 
                    TriggerClientEvent('chatMessage', players[i], Config.StaffAlert:gsub("{PLAYER}", 
                        GetPlayerName(src)):gsub("{SPEED}", Config.maxspeedwarning));
                end
            end
            Cooldown[src] = Config.StaffAlertCooldown;
        else 
            -- They are on cooldown, we do nothing for now 
        end
    end
end)

print("\n^7Simple Whitelisted Speed Warning | ^6 Made By Jordan.#2139^7")
