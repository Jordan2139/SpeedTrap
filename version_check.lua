-- Branding!
local label = 
[[ 
  //
  || 
  ||   _____                     ________               
  ||   / ___/____  ___  ___  ____/ /_  __/________ _____ 
  ||   \__ \/ __ \/ _ \/ _ \/ __  / / / / ___/ __ `/ __ \
  ||  ___/ / /_/ /  __/  __/ /_/ / / / / /  / /_/ / /_/ /
  || /____/ .___/\___/\___/\__,_/ /_/ /_/   \__,_/ .___/ 
  ||     /_/                                    /_/      
  ||   
  ||              Created by Jordan.#2139
  ||]]

-- Returns the current version set in fxmanifest.lua
function GetCurrentVersion()
	return GetResourceMetadata( GetCurrentResourceName(), "version" )
end 

-- Grabs the latest version number from the web GitHub
PerformHttpRequest( "https://raw.githubusercontent.com/Jordan2139/versions/master/speedtrap.txt", function( err, text, headers )
	-- Wait to reduce spam 
	Citizen.Wait( 2000 )

	-- Print the branding!
	print( label )

	-- Get the current resource version 
	local curVer = GetCurrentVersion()
	
	if ( text ~= nil ) then 
		-- Print out the current and latest version 
		print( "  ||    Current version: " .. curVer )
		print( "  ||    Latest recommended version: " .. text .."  || \n  ||" )
		
		-- If the versions are different, print it out
		if ( text == curVer ) then
			print( "  ||    ^1Your SpeedTrap version is outdated, visit the FiveM forum post to get the latest version.\n^0  \\\\\n" )
		else
			print( "  ||    ^2SpeedTrap is up to date!\n^0  ||\n  \\\\\n" )
		end
	else 
		-- In case the version can not be requested, print out an error message
		print( "  ||    ^1There was an error getting the latest version information, if the issue persists contact Jordan.#2139 on Discord.\n^0  ||\n  \\\\\n" )
	end 
end )
