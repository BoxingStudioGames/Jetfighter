
-----------------------------------------------------------------------------------------
--
-- cred.lua
-----------------------------------------------------------------------------------------

 local storyboard = require("storyboard")
 local scene = storyboard.newScene()
 
centerX = display.contentWidth/2 
centerY = display.contentHeight/2 


storyboard.removeAll( )
 --------------------------imports 
 function scene:createScene(event)
  local screenGroup = self.view
 

  
backgound = display.newImageRect("white.png",570,320)
backgound.x = display.contentWidth/2 
backgound.y = display.contentHeight/2 
screenGroup:insert(backgound)

cred = display.newImage( "sean.png" )
cred.x = display.contentWidth*3
cred.y = display.contentCenterY
cred.alpha = 0
transition.to( cred,{ delay = 1000, time = 2000, x = display.contentCenterX, y = display.contentCenterY, alpha = 1, onComplete = nil })
screenGroup:insert(cred)

menu = display.newImage( "menu.png" )
menu.x = display.contentWidth -700
menu.y = display.contentHeight- 40 
menu.alpha = 0 
transition.to( menu,{ delay = 1000, time = 2000, x = display.contentWidth -30, alpha = 1, onComplete = nil })
screenGroup:insert( menu )

 end  -- end of create scene

 function  menu01 ( event )
 if event.phase == 'began' then 

storyboard.gotoScene( "start","fade", 400 )

print "menu"

 end  
return true 
 end



  function scene:enterScene(event)

menu:addEventListener( "touch", menu01 )
  end 
 
 
 
 
  function scene:exitScene(event)

  
menu:removeEventListener( "touch", menu01 )
 
  end
  
   function scene:destroyScene(event)
   
   end
 

  
 
scene:addEventListener("createScene",scene)
scene:addEventListener("enterScene",scene) 
scene:addEventListener("exitScene",scene) 
scene:addEventListener("destroyScene",scene) 

return scene