# SpeedTrap
## What is it?
Essentially SpeedTrap is a script that watches for FailRP and people going too fast on your server. From my research this does not exist anywhere else so I figured I'd be first. This is my first public release and I will be updating this a lot to fix all of the bugs that will be found. You can configure the speed before warning message and the actual warning message. This also works off of ace permissions so if you would like to allow someone to go over a certain speed you can do that as well.

## Permission Setup
`add_ace group.member jordan.gofast allow` - Allowed to go over your set speed

`add_ace group.staff jordan.gofastwatch allow` - See alerts for speed

## Configuration
```------------------------------------------------------------
-- Simple Whitelisted Speed Warning, Made By Jordan.#2139 --
------------------------------------------------------------

------------------------------------------------------
-- CONFIG YOUR WARNING MESSAGE HERE WHEN GOING 150+ --
--   CONFIG YOUR MAX ALLOWED SPEED BEFORE WARNING   --
------------------------------------------------------
Config = {
    warningmsg = "You Must Be Whitelisted To Go Over 150 MPH Please Slowdown Or An Admin Will Be Alerted!",
    maxspeedwarning = 50,
    StaffAlert = "^9[^7SpeedTrap^9] Player ^1{PLAYER} ^3is going over ^1{SPEED}",
    StaffAlertCooldown = 60, -- How many seconds should cooldowns be for staff alert message?
    debugEnabled = false,
}
--------------------------
-- ^^^ DO THAT HERE ^^^ -- 
--------------------------```
