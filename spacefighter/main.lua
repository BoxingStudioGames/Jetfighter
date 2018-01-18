 --display.setStartusBar(display.HiddenStatusBar)-- hid bar

  local storyboard  = require"storyboard"

storyboard.gotoScene("splash") 	
 	
-- storyboard.gotoScene("background01","fade",400) 	

local gameNetwork = require( "gameNetwork" )
local playerName


 function loadLocalPlayerCallback( event )
   playerName = event.data.alias
   saveSettings()  --save player data locally using your own "saveSettings()" function
end


 function gameNetworkLoginCallback( event )
   gameNetwork.request( "loadLocalPlayer", { listener=loadLocalPlayerCallback } )
   return true
end


 function gpgsInitCallback( event )
   gameNetwork.request( "login", { userInitiated=true, listener=gameNetworkLoginCallback } )
end


 function gameNetworkSetup()
   if ( system.getInfo("platformName") == "Android" ) then
      gameNetwork.init( "google", gpgsInitCallback )
   else
      gameNetwork.init( "gamecenter", gameNetworkLoginCallback )
   end
end


------HANDLE SYSTEM EVENTS------
 function systemEvents( event )
   if ( event.type == "applicationSuspend" ) then
      print( "suspending..........................." )
   elseif ( event.type == "applicationResume" ) then
      print( "resuming............................." )
   elseif ( event.type == "applicationExit" ) then
      print( "exiting.............................." )
   elseif ( event.type == "applicationStart" ) then
      gameNetworkSetup()  --login to the network here
   end
   return true
end

Runtime:addEventListener( "system", systemEvents )
