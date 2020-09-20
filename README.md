# SpeedTrap
## What is it?
Essentially SpeedTrap is a script that watches for FailRP and people going too fast on your server. From my research this does not exist anywhere else so I figured I'd be first. This is my first public release and I will be updating this a lot to fix all of the bugs that will be found. You can configure the speed before warning message and the actual warning message. This also works off of ace permissions so if you would like to allow someone to go over a certain speed you can do that as well or if you use discord_perms you can even use Discord role id's. ALSO you can give people an ace permission to be alerted when someone goes over said speed for over 6 seconds.

## Permission Setup
`add_ace group.member jordan.gofast allow` - Allowed to go over your set speed

`add_ace group.staff jordan.gofastwatch allow` - See alerts for speed

## Configuration
```------------------------------------------------------
-- CONFIG YOUR WARNING MESSAGE HERE WHEN GOING 150+ --
--   CONFIG YOUR MAX ALLOWED SPEED BEFORE WARNING   --
------------------------------------------------------
Config = {
    warningmsg = "You Must Be Whitelisted To Go Over 150 MPH Please Slowdown Or An Admin Will Be Alerted!", -- Message
    maxspeedwarning = 150 -- Speed Before Warning
    }
--------------------------
-- ^^^ DO THAT HERE ^^^ -- 
--------------------------


discordRoleIds = {
    "Role_ID",
    "Role_ID"
}```
