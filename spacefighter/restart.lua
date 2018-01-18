-----------------------------------------------------------------------------------------
--
-- main.lua
-----------------------------------------------------------------------------------------
 


 local soundFile1 = audio.loadSound ("buttonpush.mp3")
 
local sheetInfo4 = require("try")
gameNetwork = require("gameNetwork")
---local  titlebar = "no title bar"
 local storyboard = require("storyboard")
 storyboard.removeAll( )
 local scene = storyboard.newScene()
 
centerX = display.contentWidth/2 
centerY = display.contentHeight/2 

 function scene:createScene(event)
  local screenGroup = self.view
  -- background 
  local background = display.newImage("start background01.png",570,320)
        background.x = display.contentWidth/2
        background.y = display.contentHeight/2
    screenGroup:insert(background)
    
    -- local background = display.newImageRect( "background01.png", 570, 360 )
 
 --ship =display.newImage("empire 2.png")

 moon = display.newImage("moon.png")
 moon.x =400
 moon.y=100
 moon.speed = 4
screenGroup:insert(moon)

   --[[moon2 = display.newImage("moon.png")   
   oon2.x =1090
   moon2.y=100
   moon2.speed = 4
screenGroup:insert(moon2)--]]

  	-- this copy to the next scroll secne --empire should be change varable
  empire3 = display.newImage("empire1.png")
  empire3.x =1400
  empire3.y= display.contentHeight-70
  empire3.speed = 7

screenGroup:insert(empire3)

-- local empire2 = display.newImage("empire 2.png")
 --  empire2: setReferencePoint(display.BottomLeftReferencePoint)
-- empire2.x = 400
-- empire2.y= 400
-- empire2.speed = 10
 --screenGroup:insert(empire2)
 
 -- local empire4 = display.newImage("empire 2.png") -- copy of empire 2 
  -- empire4: setReferencePoint(display.BottomLeftReferencePoint)
 --empire4.x = 1090
-- empire4.y= 400
-- empire4.speed = 10
 	-- this copy to the next scroll secne 
   --screenGroup:insert(empire4)
   
   empire1 =display.newImage("empire1.png")
   empire1.x =570
   empire1.y= display.contentHeight-70
   empire1.speed = 7
   screenGroup:insert(empire1)
 
  jet2 = display.newImage("jet.png")
  jet2.y = 100
  jet2.x = 99	
  screenGroup:insert(jet2)
 

-- 1st image sheet
-- sheetData1 = { width=64, height=60, numFrames=10, sheetContentWidth=640, sheetContentHeight=60}
sheet1 = graphics.newImageSheet("animations/stars2.png", sheetInfo4:getSheet())

-- In your sequences, add the parameter 'sheet=' referencing which image sheet the sequence should use
 sequenceData = {
                { name="seq1", sheet=sheet1, start=1, count=10, time=3000, loopCount="bounce"}
                }

 restartup= display.newSprite( sheet1, sequenceData )
--startup = display.newImage("start01.png")
--startup:scale( 1.5, 1.5 )
restartup.x = display.contentCenterX
restartup.y =  display.contentHeight-145
restartup:play( )
 screenGroup:insert(restartup)


 restartup2 = display.newImage("animations/try.png")
 restartup2 .x = centerX
 restartup2 .y = display.contentHeight-145
 restartup2.alpha = 1 
 screenGroup:insert(restartup2)
  
 facebook1 = display.newImage("facebook.png")
 facebook1.x = display.contentWidth- 30
 facebook1.y = 289
 screenGroup:insert(facebook1)
  
 twitter2 = display.newImage("twitter.png")
 twitter2.x = display.contentWidth - 100
 twitter2.y = 289
 screenGroup:insert(twitter2)
  
 rate3 = display.newImage("rate.png")
 rate3.x=45
 rate3.y=289
 screenGroup:insert(rate3) 
  
 google4 = display.newImage("youtube.png")
 google4.x=115
 google4.y=289
 screenGroup:insert(google4)
  
lost = display.newImage("youlost.png")
lost.x = centerX
lost.y = display.contentHeight -215
screenGroup:insert(lost)  
  
play = display.newImage("sound.png")
 play.x= 45
 play.y= 40
 play.isVisible = false 
 screenGroup:insert(play)


credits2 = display.newImage("menu.png")
credits2.x = display.contentWidth- 30
credits2.y = 40
screenGroup:insert(credits2)


leader = display.newImage("leader1.png")
leader.x = 115
leader.y = 40
screenGroup:insert(leader)



awards = display.newImage("leader2.png")
awards.x = display.contentWidth-100 
awards.y = 40
screenGroup:insert(awards)


 stop = display.newImage("nosound.png")
 stop.x= play.x
 stop.y= play.y
 stop. isVisible = true 
 screenGroup:insert(stop)


 end  -- end of create scene


function  playanime1 ( event )

trans3 = transition.to( restartup2, {time=5000, alpha= 1, onComplete=playanime3})
--transition.to( lost, {time=3000, alpha= 1, onComplete=playanime3})

end
-- change back to zero alpha 
function  playanime3 ( event )

trans4 = transition.to( restartup2, {time= 5000, alpha= 0, onComplete=playanime1})
--transition.to( lost, {time= 3000, alpha=0, onComplete=playanime})


end

timer1=timer.performWithDelay( 1000, playanime1, 1 )




 
  function backgroundSpace(self,event)
 if self.x  < display.contentWidth-1350  then
  self.x = 900
 
else 
self.x = self.x - self.speed
 end 
end


function playMusic( event )
 if  event.phase == "began"then 

 audio.resume( backgroundMusicChannel )

print "work"
stop. isVisible = true 
play. isVisible = false 

end
end 


function stopMusic ( event )
  
  if event.phase=="began" then 
print  "work 1"
 
 audio.pause( backgroundMusicChannel )

stop. isVisible = false 
play. isVisible = true 

end
end

  
    function restart(event)
 if event.phase =="began" then 
   print "hi"
  
   storyboard.gotoScene("game2","fade",400)
  
  result = timer.resume( timer1 )
  
    audio.play(soundFile1)
   end
 end 
 
 
  function facebook(event)
 if event.phase =="began" then 
 --  print "hi"
   system.openURL("https://www.facebook.com/boxingstudiogames")
 
   end
 end 
 
 function twitter(event)
 if event.phase =="began" then 
 --  print "hi"
   system.openURL("https://twitter.com/sean_my")
 
   end
 end 
 
 
  function rate (event)
 if event.phase =="began" then 
 --  print "hi"
   system.openURL("https://play.google.com/store/apps/details?id=com.boxingstudiogames.jetfighter&hl=en")
 
   end
 end 
 
 function google (event)
 if event.phase =="began" then 
 --  print "hi"
   system.openURL("https://www.youtube.com/user/seanDp32")
 
   end
 end 
 


function stopUp ( event )

  if event.phase=="began" then 
print "okay then"
 if ( system.getInfo("platformName") == "Android" ) then
      gameNetwork.show( "leaderboards" )
   else
      gameNetwork.show( "leaderboards", { leaderboard = {timeScope="AllTime"} } )
   end


end
return true 
end



function showawards ( event )
if event.phase == "began" then 
  print "awards"

   gameNetwork.show( "achievements" )

end 
return true 
end



function  cred ( event )
  
if event.phase == "began" then 
  print 'question'

storyboard.gotoScene("start","flip",400)

end
end


  function scene:enterScene(event)
  
leader:addEventListener( "touch", stopUp )
 
awards:addEventListener( "touch", showawards )

credits2:addEventListener("touch",cred)

 -- storyboard.purgeScene("game2")
  
  --	storyboard.purgeScene("game2")
	restartup:addEventListener("touch", restart)
  	
  --restartup:addEventListener("touch",restart)
 
  facebook1:addEventListener("touch",facebook)
  	
  twitter2:addEventListener("touch",twitter)
  
  rate3:addEventListener("touch",rate)
  
  google4:addEventListener("touch",google)
  
  moon.enterFrame = scrollSpace
 Runtime:addEventListener ("enterFrame",moon)
 	
 	
 empire3.enterFrame = backgroundSpace
 Runtime:addEventListener ("enterFrame",empire3)
 
 --[[moon2.enterFrame = backgroundSpace
 Runtime:addEventListener ("enterFrame",moon2)--]]
 	
 	
 --	empire2.enterFrame = backgroundSpace
 --Runtime:addEventListener ("enterFrame",empire2)
 
 	--	empire4.enterFrame = backgroundSpace
-- Runtime:addEventListener ("enterFrame",empire4)
 	
 empire1.enterFrame = backgroundSpace
 Runtime:addEventListener ("enterFrame",empire1)


stop:addEventListener("touch",stopMusic)

play:addEventListener("touch",playMusic)

  end 
 
 
 
 
  function scene:exitScene(event)
 
 transition.cancel( trans3)
  transition.cancel( trans4)


 --audio.dispose( soundFile1 )
 ---soundFile1 = nil 
  -- startup:removeEventListener("touch",start)
 
 -- restartup:removeEventListener("touch",restart)
 
  facebook1:removeEventListener("touch",facebook)
  	
  twitter2:removeEventListener("touch",twitter)
  
  rate3:removeEventListener("touch",rate)
  
  google4:removeEventListener("touch",google)
 
  Runtime:removeEventListener ("enterFrame",moon) 
  
  Runtime:removeEventListener ("enterFrame",empire3)	
  	
  --Runtime:removeEventListener ("enterFrame",moon2)
  	
  Runtime:removeEventListener ("enterFrame",empire1)	
  end
  
   function scene:destroyScene(event)
   
   end
 

  
 
scene:addEventListener("createScene",scene)
scene:addEventListener("enterScene",scene) 
scene:addEventListener("exitScene",scene) 
scene:addEventListener("destroyScene",scene) 

return scene