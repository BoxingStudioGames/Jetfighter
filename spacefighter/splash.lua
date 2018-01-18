-----------------------------------------------------------------------------------------
--
-- main.lua
-----------------------------------------------------------------------------------------

---local  titlebar = "no title bar"
 local storyboard = require("storyboard")
 local scene = storyboard.newScene()
 
 local splash = audio.loadStream("splash sound.mp3") 

 storyboard.removeAll( )

 function scene:createScene(event)
  local screenGroup = self.view
  -- background 
   background = display.newImageRect ("start background01.png",570,320)
   background.x = display.contentWidth/2
   background.y = display.contentHeight/2 
   screenGroup:insert(background)
    

    logo = display .newImage("logo1.png")
  
   logo.x = -80      --  250
   logo.y =  82
screenGroup:insert(logo)

logoIntro = transition.to(logo,{time=1000, x=250, onComplete=resumeReady})
  
  logo2 = display .newImage("logo2.png")
  
   logo2.x = -80      --  250
   logo2.y =  160
screenGroup:insert(logo2)

logoIntro = transition.to(logo2,{time=3000, x=130, onComplete=resumeReady})
  
   logo3 = display .newImage("logo3.png")
   logo3.x =  500
   logo3.y =  160
screenGroup:insert(logo3)

logoIntro = transition.to(logo3,{time=1000, x=400, onComplete=resumeReady})
  
  
    logo4 = display .newImage("logo4.png")
   logo4.x =  500
   logo4.y =  250
screenGroup:insert(logo4)

logoIntro = transition.to(logo4,{time=1000, x=280, onComplete=resumeReady})
  
  
  
  
  
  logo1 = display.newImage("robot.png")
  logo1.x = 460
  logo1.y = 250
  screenGroup:insert(logo1)
  
  gear1 = display.newImage("gear.png")
  gear1.x = 414
  gear1.y = 252
  screenGroup:insert(gear1)
  
    gear2 = display.newImage("gear2.png")
  gear2.x = 425
  gear2.y = 265
  screenGroup:insert(gear2)
  
     gear3 = display.newImage("gear3.png")
  gear3.x = 438
  gear3.y = 276
  screenGroup:insert(gear3)
  
  
 gear01 = display.newImage("gear4.png")
 gear01.x = 455
 gear01.y = 285
 screenGroup:insert(gear01)
  
  
     gear4 = display.newImage("gear5.png")
  gear4.x = 470
  gear4.y = 277
  screenGroup:insert(gear4)
 
  gear5 = display.newImage("gear6.png")
  gear5.x = 479
  gear5.y = 261
  screenGroup:insert(gear5)
  
  gear6 = display.newImage("gear7.png")
  gear6.x = 486
  gear6.y = 238
  screenGroup:insert(gear6)
  
  gear8 = display.newImage("gear8.png")
  gear8.x = 494
  gear8.y = 223
  screenGroup:insert(gear8)
  
  gear9 = display.newImage("gear8.png")
  gear9.x = 505
  gear9.y = 208
  screenGroup:insert(gear9)
  
  gear10 = display.newImage("gear8.png")
  gear10.x = 494
  gear10.y = 223
  screenGroup:insert(gear10)
  
  gear11 = display.newImage("gear8.png")
  gear11.x = 443
  gear11.y = 223
  screenGroup:insert(gear11)
 
 end  -- end of create scene
 

 backgroundMusicChannel = audio.play(splash, { channel=2, fadein=2000 }  )  


function  hold ( event )

local function onComplete( event )
  print( "index => ".. event.index .. "    action => " .. event.action )

  local action = event.action
if "clicked" == event.action then 
    if 2 == event.index then         

system.openURL( "http://boxingstudioapps.comule.com/" )

end 
end

    local action = event.action
  if "clicked" == event.action then
    if 1 == event.index then
      -- Open url if "Learn More" was clicked by the user
      system.openURL( "https://play.google.com/store/apps/details?id=com.boxingstudiogames.jetfighter&hl=en" )
    end
  elseif "cancelled" == event.action then
    -- our cancelAlert timer function dismissed the alert so do nothing
  end
end

local alert = native.showAlert( "Boxing Studio Games", "Rate me!", { "OK", "Site","Later" }, onComplete )

-- Dismisses alert after 5 seconds
local function cancelAlert()
  native.cancelAlert( alert )
end

timer.performWithDelay( 10000, cancelAlert )

end 
timer.performWithDelay( 20000, hold , 1 ) -- I could set this up to be canlce when the index ==  ok 
 



  
 function splash()

storyboard.gotoScene("startup2","crossFade",400) 	

end

timer.performWithDelay( 8000, splash, 1 )-- timer

 
 
 
 
 
 function animate (event)
 
gear1.rotation = gear1.rotation+2

gear2.rotation = gear2.rotation-2

gear3.rotation = gear3.rotation+2

gear4.rotation = gear4.rotation-2

gear5.rotation = gear5.rotation+2

gear6.rotation = gear6.rotation-2

gear01.rotation = gear01.rotation+2

gear8.rotation = gear8.rotation-2

gear9.rotation = gear9.rotation+2

gear10.rotation = gear10.rotation-2

gear11.rotation = gear11.rotation+2

 end 
 
 
  function scene:enterScene(event)
  	

Runtime:addEventListener("enterFrame",animate )
   
  end 
 
 
 
 
  function scene:exitScene(event)
 Runtime:removeEventListener("enterFrame",animate )
   
audio.dispose( splash )
splash = nil 
   	
  end
  
   function scene:destroyScene(event)
   
   end
 

  
 
scene:addEventListener("createScene",scene)
scene:addEventListener("enterScene",scene) 
scene:addEventListener("exitScene",scene) 
scene:addEventListener("destroyScene",scene) 

return scene
 