-----------------------------------------------------------------------------------------
--
-- main.lua
-----------------------------------------------------------------------------------------

---local  titlebar = "no title bar"
 local storyboard = require("storyboard")
 local scene = storyboard.newScene()
 
 --storyboard.removeAll( )

 function scene:createScene(event)
  local screenGroup = self.view
  -- background 
   background = display.newImageRect("start background01.png",570,320)
   background.x = display.contentWidth/2 
   background.y = display.contentHeight/2 
   screenGroup:insert( background )
  

    resume = display.newImage("resume.png")
    resume.x = display.contentCenterX
    resume.y = display.contentCenterY
   -- physics.addBody(resume, "static", {density =.1,bounce=0.1, friction=.2,radius=12})
     screenGroup:insert(resume)
    
    resumeIntro = transition.to(resume,{time=1000, x=250, onComplete=resumeReady})
  
    end  -- end of create scene

 

 
 
 function resume01 (event)
 if event.phase =="began" then 
  --print "hi"
  
    function jetReady()
	jet.bodyType = "dynamic"
end

storyboard.gotoScene("game2","crossFade",400) 	

 result = timer.resume( timer1 )
print( "Time remaining is ")


   end
 end 
 
 
  function scene:enterScene(event)
  
  	resume:addEventListener ("touch",resume01)

 
   
  end 
 
 
 
 
  function scene:exitScene(event)
 
   
 	resume:removeEventListener ("touch",resume)
   	
  end
  
   function scene:destroyScene(event)
   
   end
 

  
 
scene:addEventListener("createScene",scene)
scene:addEventListener("enterScene",scene) 
scene:addEventListener("exitScene",scene) 
scene:addEventListener("destroyScene",scene) 

return scene