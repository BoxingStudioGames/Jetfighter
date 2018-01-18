 local storyboard = require("storyboard")
 local scene = storyboard.newScene()
 
 centerX = display.contentWidth/2
 centeerY = display.contentHeight/2  
 
 storyboard.removeAll( )

 function scene:createScene(event)
  local screenGroup = self.view
  -- background 
 local   background = display.newImage("background01.png",570,320)
   background.x = display.contentWidth/2
   background.y = display.contentHeight/2
    screenGroup:insert(background)


 end  -- end of create scene
 
 
 function  onComplete  (event)
   
storyboard.gotoScene("start","crossFade",400)   

end

--media.playVideo( "http://www.coronalabs.com/video/bbb/BigBuckBunny_640x360.m4v", media.RemoteSource, true, onComplete )

--media.playVideo( "videos/ved.mp4", true, onComplete )
 

 
  function scene:enterScene(event)
  	

 

   
  end 
 
 
 
 
  function scene:exitScene(event)

 
  end
  
   function scene:destroyScene(event)
   
   end
 

  
 
scene:addEventListener("createScene",scene)
scene:addEventListener("enterScene",scene) 
scene:addEventListener("exitScene",scene) 
scene:addEventListener("destroyScene",scene) 

return scene