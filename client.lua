------------------------------------------------------------
-- Simple Whitelisted Speed Warning, Made By Jordan.#2139 --
------------------------------------------------------------
----------------------------------------------------------------------------------------------
                  -- !WARNING! !WARNING! !WARNING! !WARNING! !WARNING! --
        -- DO NOT TOUCH THIS FILE OR YOU /WILL/ FUCK SHIT UP! EDIT THE CONFIG.LUA --
-- DO NOT BE STUPID AND WHINE TO ME ABOUT THIS BEING BROKEN IF YOU TOUCHED THE LINES BELOW. --
----------------------------------------------------------------------------------------------

warnplayer = false;
RegisterNetEvent('DoAllowSpeedClient')
AddEventHandler('DoAllowSpeedClient', function()
    print('yeet')
    warnplayer = true
end)

warnplayer = false;
RegisterNetEvent('AllowSpeedClient')
AddEventHandler('AllowSpeedClient', function()
    warnplayer = not warnplayer;
    print('this is also gay but moreso because perms no worko')
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(1)
    
    local player = GetPlayerPed(-1)
    local veh = GetVehiclePedIsIn(player)
    local mph = math.ceil(GetEntitySpeed(veh) * 2.23)
        
    if warnplayer then
        warn(Config.warningmsg)
    end

    if GetPedInVehicleSeat(veh, -1) == player then
        if mph > Config.maxspeedwarning then
            TriggerServerEvent('AllowSpeed')
        else
        warnplayer = false
    end
end
end
end)


function warn(msg)
warningstring = false
	warningstring = msg
	PlaySoundFrontend(-1, "DELETE","HUD_DEATHMATCH_SOUNDSET", 1)
	Citizen.Wait(6000)
	warningstring = false
end

function Initialize(scaleform)
    local scaleform = RequestScaleformMovie(scaleform)
    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(0)
    end
    PushScaleformMovieFunction(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
	PushScaleformMovieFunctionParameterString("~r~WARNING!")
    PushScaleformMovieFunctionParameterString(warningstring)
    PopScaleformMovieFunctionVoid()
    return scaleform
end


Citizen.CreateThread(function()
while true do
	Citizen.Wait(0)
    if warningstring then
		scaleform = Initialize("mp_big_message_freemode")
		DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255, 0)
    end
end
end)
