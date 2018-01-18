-----------------------------------------------------------------------------------------
--
-- main.lua
-----------------------------------------------------------------------------------------

---local  titlebar = "no title bar"
-- requirs physics 

--variable to hold our game's score


local widget = require( "widget" )
local score = require( "score" )
local sheetInfo = require("sprite1")
local sheetInfo2 = require("explosion")
local soundFile2 = audio.loadSound ("boom.mp3")
local soundFile3 = audio.loadSound ("music/collection.wav")
 local physics = require "physics"
 local gameNetwork = require("gameNetwork")

 physics.start() 
 local storyboard = require("storyboard")
storyboard.removeAll( )
--imports
--- vars 
 local coinsCount = 0 
 local myscore = 0 

local enemy
  centerX = display.contentCenterX
  centerY =display.contentCenterY
local coinsSpeed = math.random(1000,6000)


 local scene = storyboard.newScene()
 
 function scene:createScene(event)
  local screenGroup = self.view
  
  -- background 

  
  background = display.newImageRect("background01.png",570,320)
  background.x = display.contentWidth/2 
  background.y = display.contentHeight/2 
  screenGroup:insert(background)
  


 top1 = display.newImage("invisable tile.png")
 top1.x=0
 top1.y= display.contentHeight-320
 physics.addBody(top1, "static", {density=.1,bounce=0.1, friction=.2})
top1.collided = false
-- top1.name = "enmey"
 screenGroup:insert(top1)
 
 
 top2 = display.newImage("invisable tile.png")
 top2.x =0
 top2.y= display.contentHeight
 top2.name = "enmey"
 physics.addBody(top2, "static", {density=.1,bounce=0.1, friction=.2})
 screenGroup:insert(top2)
 

 moon = display.newImage("moon.png")
 moon.x =400
 moon.y=100
 moon.speed = 4
screenGroup:insert(moon)

   moon2 = display.newImage("moon.png")
   moon2.x =1090
   moon2.y=100
   moon2.speed = 4
   screenGroup:insert(moon2)
   
  	-- this copy to the next scroll secne --empire should be change varable
  empire3 = display.newImage("empire1.png")              
  empire3.x =1400
  empire3.y=display.contentHeight-70
  empire3.speed = 7
  screenGroup:insert(empire3)



coinsTable = { "coins/coin06","coins/coin07","coins/coin08","coins/coin09","coins/coin10" 
,"coins/coin11","coins/coin12","coins/coin13"
}
coins = {} 

function spawnCoins()
ranNum = math.random(#coinsTable)
coins[#coins + 1] = display.newImage( coinsTable[ranNum]..".png" )
coins[#coins].x = display.contentCenterX*2
coins[#coins].y =  math.random(100,300) 
coins[#coins].id = coinsNum
physics.addBody(coins[#coins],"static")
transition.to( coins[#coins], {time = math.random (3000,6000), x=-570,onComplete = recycle});
coins[#coins].myName = "money"
coins[#coins].speed = 7 
coins[#coins].isFixedRotation = true
screenGroup:insert(coins[#coins])
end

totalcoins = 0
timer1= timer.performWithDelay( 1000, spawnCoins, totalcoins ) 

--[[
money2 = display.newImage( "coins/coin06.png")
money2.x = 80
money2.y = 90 
money2.myName ="money"
physics.addBody( money2,"static")
screenGroup:insert( money2)--]]
-- local empire2 = display.newImage("empire 2.png")
 --  empire2: setReferencePoint(display.BottomLeftReferencePoint)
-- empire2.x = 400
-- empire2.y= 400
-- empire2.speed = 10
 
 -- local empire4 = display.newImage("empire 2.png") -- copy of empire 2 
 -- empire4: setReferencePoint(display.BottomLeftReferencePoint)
 --empire4.x = 1090
-- empire4.y= 400
-- empire4.speed = 10
 	-- this copy to the next scroll secne 
   
    empire1 =display.newImage("empire1.png")
   empire1.x =570
   empire1.y= display.contentHeight-70 
   empire1.speed = 7
  screenGroup:insert(empire1)

 -- 1st image sheet
 --sheetData1 = { width=50, height=17, numFrames=4, sheetContentWidth=200, sheetContentHeight=17}
sheet1 = graphics.newImageSheet("animations/sprite1.png", sheetInfo:getSheet())

-- 2nd image sheet
 --sheetData2 = { width=400, height=400, numFrames=7, sheetContentWidth=2800, sheetContentHeight=400 }
 sheet2 = graphics.newImageSheet( "animations/explosion.png", sheetInfo2:getSheet())

-- In your sequences, add the parameter 'sheet=' referencing which image sheet the sequence should use
 sequenceData = {
                { name="seq1", sheet=sheet1, start=1, count=11, time=1000, loopCount=0},
                { name="seq2", sheet=sheet2, start=1, count=7, time=1000, loopCount=0 }
                }

 jet = display.newSprite( sheet1, sequenceData )
jet.x = -80
jet.y = 40
jet.isFixedRotation = true
--jet:scale( 0.25, 0.25 ) 
jet.name ="player"
jet:play()
jet.collided = false
physics.addBody(jet, "static", {density=.1,bounce=0.1, friction=.2,radius=12})
--jet.value = 100
screenGroup:insert(jet)
jetIntro = transition.to(jet,{time=6000, x=100, onComplete=jetReady})

explosion = display.newSprite( sheet2, sequenceData )
    explosion:setSequence( "seq2" )
    explosion.x = 100
    explosion.y = 100
    --explosion:scale( , 0.10 )
    --explosion:prepare("explosions")
   -- explosion:play()
   explosion.isVisible = false
  screenGroup:insert(explosion)


    mine10 = display.newImage("missles.png")
    mine10.y =  display.contentHeight-315
    mine10.x = 1090
    mine10.name = "enmey"
    mine10.speed = math.random(2,6)
    physics.addBody(mine10, "static", {density=.1,bounce=0.1, friction=.2,radius=12})
    screenGroup:insert(mine10)
 
 
 

    mine1 = display.newImage("rocket01.png")
    mine1.x = 500
    mine1.y = 200
    mine1.name = "enmey"
    mine1.speed = math.random(2,6)
   -- mine1.initY = mine1.y
  --  mine1.amp = math.random(20,100)
   -- mine1.angle = math.random(1,360)
    --mine1.collType = "solidV"
    physics.addBody(mine1, "static", {density=.1, bounce=0.1, friction=.2, radius=12})
	screenGroup:insert(mine1)
 


    rocket = display.newImage("rocket01.png")
    rocket.x = 2100
    rocket.y = math.random(50,100)
    rocket.name = "enmey"
    rocket.speed = math.random(2,6)
   -- mine1.initY = mine1.y
  --  mine1.amp = math.random(20,100)
   -- mine1.angle = math.random(1,360)
    --mine1.collType = "solidV"
    physics.addBody(rocket, "static", {density=.1, bounce=0.1, friction=.2, radius=12})
  screenGroup:insert(rocket)

    rock = display.newImage("missles.png")
    rock.x = 2000
    rock.y = math.random(40,100)
    rock.name = "enmey"
    rock.speed = math.random(2,6)
   -- mine1.initY = mine1.y
  --  mine1.amp = math.random(20,100)
   -- mine1.angle = math.random(1,360)
    --mine1.collType = "solidV"
    physics.addBody(rock, "static", {density=.1, bounce=0.1, friction=.2, radius=12})
  screenGroup:insert(rock)
 
    mine2 = display.newImage("missles.png")
    mine2.y = 100--math.random (1,100)
    mine2.x = 1090
    mine2.name = "enmey"
    mine2.speed = math.random(2,6)
-- mine2.amp = math.random(2,6) 	
 --mine2.initY = mine2.y
 physics.addBody(mine2, "static", {density=.1,bounce=0.1, friction=.2,radius=12})
 screenGroup:insert(mine2)
 
 
 
    mine3 = display.newImage("missles.png")
    mine3.y = 100
    mine3.x = 500
    mine3.name =  "enmey"
    mine3.speed = math.random(2,6)
   -- mine3.initY = mine1.y
  --  mine3.amp   = math.random(20,100)
 mine3.angle = math.random(1,360)	
 mine3.collType = "solidV"
 physics.addBody(mine3, "static", {density=.1,bounce=0.1, friction=.2,radius=12})
 screenGroup:insert(mine3)
 
  mine4 = display.newImage("rocket01.png")
    mine4.y = 100
    mine4.x = 500
    mine4.speed = math.random(2,6)
    mine4.name =  "enmey"
   -- mine3.initY = mine1.y
  --  mine3.amp   = math.random(20,100)
 mine3.angle = math.random(1,360)	
  screenGroup:insert(mine4)
 
 physics.addBody(mine4, "static", {density=.1,bounce=0.1, friction=.2,radius=12})
 screenGroup:insert(mine4)
  
   coin04 = display.newImage("images/rocket3.png")
   coin04.y = 100
   coin04.x = 500
   coin04.speed = math.random(2,6)
   coin04.initY = mine1.y
   coin04.amp   = math.random(20,100)
   coin04.angle = math.random(1,360)	
   coin04.name = "enmey"
 physics.addBody(coin04, "static", {density=.1,bounce=0.0, friction=.2,radius=12})
 screenGroup:insert(coin04)
  
  


  rocket02 = display.newImage("rocket02.png")
  rocket02.y = 100
  rocket02.x = 500
  rocket02.speed = math.random(2,6)
  rocket02.initY = mine1.y
  rocket02.amp   = math.random(20,100)
  rocket02.angle = math.random(1,360)	
  rocket02.name =  "enmey"
 physics.addBody(rocket02, "static", {density=.1,bounce=0.1, friction=.2,radius=12})
 
 screenGroup:insert(rocket02)
 
 
  rocket03 = display.newImage("rocket02.png")
  rocket03.y = 100
  rocket03.x = 500
  rocket03.speed = math.random(2,6)
  rocket03.initY = mine1.y
  rocket03.amp   = math.random(20,100)
  rocket03.angle = math.random(1,360)	
  rocket03.name = "enmey"
 physics.addBody(rocket03, "static", {density=.1,bounce=0.1, friction=.2,radius=12})
 
 screenGroup:insert(rocket03)
 
 
  rocket04 = display.newImage("rocket02.png")
  rocket04.y = 100
  rocket04.x = 500
  rocket04.speed = math.random(2,6)
  rocket04.initY = mine1.y
  rocket04.amp   = math.random(20,100)
  rocket04.angle = math.random(1,360)	
  rocket04.name =  "enmey"
 physics.addBody(rocket04, "static", {density=.1,bounce=0.1, friction=.2,radius=12})
 
 screenGroup:insert(rocket04)
 
 
 ball01 = display.newImage("ball01.png")
  ball01.y = 100
  ball01.x = 500
  ball01.speed = math.random(2,6)
  ball01.initY = mine1.y
  ball01.amp   = math.random(20,150)
  ball01.angle = math.random(1,360)	
  rotation = 2 
  ball01.alpha = 0 
  ball01.name =  "enmey"
 physics.addBody(ball01, "static", {density=.1,bounce=0.1, friction=.2,radius=12})
 screenGroup:insert(ball01)
 
 
 
  ball02 = display.newImage("ball01.png")
  ball02.y = 100
  ball02.x = 500
  ball02.speed = math.random(2,6)
  ball02.initY = mine1.y
  ball02.amp   = math.random(20,150)
  ball02.angle = math.random(1,360)
  ball02.name =  "enmey"	
  rotation = 2 
 physics.addBody(ball02, "static", {density=.1,bounce=0.1, friction=.2,radius=12})
 
 screenGroup:insert(ball02)
 
 
   ball03 = display.newImage("ball02.png")
  ball03.y = 100
  ball03.x = 500
  ball03.speed = math.random(2,6)
  --ball03.initY = mine1.y
 -- ball03.amp   = math.random(20,100)
  ball03.angle = math.random(1,360)	
  rotation = 2 
   ball03.name = "enmey"
 physics.addBody(ball03, "static", {density=.1,bounce=0.1, friction=.2,radius=12})
 
 screenGroup:insert(ball03)
 

  ball04 = display.newImage("ball02.png")
  ball04.y = 100
  ball04.x = 500
  ball04.speed = math.random(2,6)
  ball04.initY = mine1.y
  ball04.amp   = math.random(20,100)
  ball04.angle = math.random(1,360)	
  rotation = 2 
  ball04.name = "enmey"
 physics.addBody(ball04, "static", {density=.1,bounce=0.1, friction=.2,radius=12})
 
 screenGroup:insert(ball04)



--[[
pause = display.newImage("pause.png")
pause.x = display.contentWidth-60
pause.y = 289
screenGroup:insert(pause)
--]]

   pauseButton = widget.newButton({
    width = 48,
    height = 48,
    defaultFile = "pause.png",
    overFile = "pause.png",
    x = display.contentWidth-60,
    y = 289,
    onEvent = handleButtonEvent,
  })
screenGroup:insert(pauseButton)


 --[[shootButton = display.newImage("shoot.png")
    shootButton.x = 50
    shootButton.y = 289
    screenGroup:insert(shootButton)--]]




  play = display.newImage("sound.png")
 play.x= display.contentWidth-460
 play.y= 289
play.isVisible = false 
 screenGroup:insert(play)



 stop = display.newImage("nosound.png")
 stop.x= play.x 
 stop.y= play.y
 stop.isVisible = true  
 screenGroup:insert(stop)
--[[
 scoreText = score.init({
  fontSize = 20,
  font = "Helvetica",
  x = display.contentCenterX,
  y = 20,
  maxDigits = 7,
  leadingZeros = true,
  --filename = "scorefile.txt",
  })
screenGroup:insert(scoreText)
--]]
scoreText3 = display.newText( coinsCount .."C" , 0, 0, "arial", 20)
scoreText3:setFillColor(250,250,0)
scoreText3.x = display.contentCenterX+200
scoreText3.y = 50
screenGroup:insert(scoreText3)


scoreText2 = display.newText( myscore.."M", 0, 0, "arial", 20)
scoreText2:setFillColor(250,250,0)
scoreText2.x = display.contentCenterX+200
scoreText2.y = 20
screenGroup:insert(scoreText2)
--[[

local saveButton = widget.newButton({
    width = 200,
    height = 64,
    x = display.contentCenterX,
    y = display.contentHeight - 64,
    label = "Load Score",
    labelColor = { default = { 1, 1, 1 }, over = { 0, 0, 0 } },
    fontSize = 32,
    onEvent = loadScore
  })
screenGroup:insert(saveButton)
--]]

newHighscore=display.newImage("animations/newhigh.png")
newHighscore.x = display.contentWidth/2
newHighscore.y =display.contentHeight/2
newHighscore.alpha =0  
screenGroup:insert(newHighscore)
--]]
---------------------------------------------------pre collision events 

function onLocalPreCollision( self, event )
 
 platform3 = event.other
 if platform3.myName == "money" then
     
      event.contact.isEnabled = false  

      print "pass through"
       
       display.remove(event.other)

           coinsPoint()   
--[[

if you  want you could put your collison detection here i think you should see if you have any eorres with this new system. 

--]] 

end 
end


--[[function jet:preCollision( event )
  print "called"
 platform3 = event.other
    if platform3.myName == "money" then
     
      event.contact.isEnabled = false  

      print "pass through"
       
       display.remove(event.other)
       
       coinsPoint()
        print( "preCollision", platform3.myName )
    end
end

function jet:postCollision( event )
    print( "Remove listeners")
    self:removeEventListener( "preCollision" )
    self:removeEventListener( "postCollision" )
end
--]]
------------------------------------------------------------------------ scroll coins 


resume = display.newImage( "pasue2.png" )
resume.x = display.contentCenterX
resume.y = display.contentHeight+300 
resume.alpha = 0 
screenGroup:insert(resume)


reset = display.newImage( "leader3.png" )
reset.x = display.contentCernterX 
reset.y = display.contentHeight+300 
reset.alpha = 0 
screenGroup:insert(reset)


men = display.newImage("men2.png")
men.x = display.contentCenterX+400 
men.y = display.contentHeight+300 
men.alpha = 0 
screenGroup:insert(men)


howtoplay = display.newImage("tap.png")
howtoplay.x = display.contentCenterX
howtoplay.y = display.contentCenterY
howtoplay.alpha = 0 
screenGroup:insert(howtoplay)

tex = display.newImage("Text.png")
tex.x = display.contentCenterX
tex.y = display.contentHeight/2-120
tex.alpha = 0 
screenGroup:insert(tex)

end  -- end of create scene



function howtoplay01 ( event )
transition.to( howtoplay, { time = 1000, delay=1000, alpha=1, onComplete =howtoplay02} )
end
timer.performWithDelay( 2000, howtoplay01, 1 )

function howtoplay02( event)

transition.to( howtoplay, {time = 1000, delay = 1000, alpha = 0, onComplete = recycle } )

end

function  coinsPoint ( event )
print "given"
--score.add(300)
--[[
myscore = myscore+1 
scoreText2.text = myscore 
--]]

audio.play( soundFile3)
coinsCount = coinsCount+1  
scoreText3.text= coinsCount.."c"
end

--[[
 function saveScore( event )
  if event.phase == "ended" then
    score.save()
  end
  return true
end


 function loadScore( event )
  if event.phase == "ended" then
    local prevScore = score.load()
    if prevScore then
      score.set(prevScore)
    end
  end
  return true
end
--]]


--- score set up   

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



 function scoreUpdate()

myscore = myscore+1 
scoreText2.text = myscore .. "M"
--score.add(100)
end

function  timegive (event )
   pauseButton:setEnabled(true)
timer01 = timer.performWithDelay( 1000/2, scoreUpdate, 0 )
 end 




 function handleButtonEvent( event )

    if ( "ended" == event.phase ) then
        
physics.pause()

  --function jetReady()
  --jet.bodyType = "static"
--storyboard.gotoScene("pause menu","crossFade",400)  

  timer.pause( timer1 )

  timer.pause( timer01 )

print( "pause")

transition.to( resume,{ delay = 1000, time = 2000, x = display.contentCenterX, y = display.contentCenterY, alpha = 1, onComplete = nil} )


transition.to( reset,{ delay = 1000, time = 2000, x = display.contentCenterX+100, y = display.contentCenterY, alpha = 1, onComplete = nil} )


transition.to( men,{ delay = 1000, time = 2000, x = display.contentCenterX -100, y = display.contentCenterY, alpha = 1, onComplete = nil} )


transition.to( tex,{ delay = 1000, time = 2000, alpha = 1, onComplete = nil} )


Runtime:removeEventListener ("enterFrame",jet)


    end
end



--[[
 function pause01 (event)
 if event.phase =="began" then 

  --print "hi"
  physics.pause()

  --function jetReady()
	--jet.bodyType = "static"
--storyboard.gotoScene("pause menu","crossFade",400) 	

  timer.pause( timer1 )

  timer.pause( timer01 )

print( "pause")

transition.to( resume,{ delay = 1000, time = 2000, x = display.contentCenterX, y = display.contentCenterY, alpha = 1, onComplete = nil} )


transition.to( reset,{ delay = 1000, time = 2000, x = display.contentCenterX+100, y = display.contentCenterY, alpha = 1, onComplete = nil} )


transition.to( men,{ delay = 1000, time = 2000, x = display.contentCenterX -100, y = display.contentCenterY, alpha = 1, onComplete = nil} )


transition.to( tex,{ delay = 1000, time = 2000, alpha = 1, onComplete = nil} )


Runtime:removeEventListener ("enterFrame",jet)

 end 
 return true 
end
--]]

function  pause02 ( event )

if event.phase == "began" then 
-- note 
-- if pause is not working try if myscore is < 0 then pause 


 print "unpasue"

physics.start( )

timer.resume( timer1 )
timer.resume( timer01 )



--Runtime:removeEventListener ("enterFrame",jet)

transition.to( resume,{ delay = 1000, time = 2000, x = display.contentCenterX, y = display.contentCenterY-300, alpha = 0, onComplete = nil} )


transition.to( reset,{ delay = 1000, time = 2000, x = display.contentCenterX+100, y = display.contentCenterY-300, alpha = 0, onComplete = nil} )


transition.to( men,{ delay = 1000, time = 2000, x = display.contentCenterX -100, y = display.contentCenterY-300, alpha = 0, onComplete = nil} )
 

transition.to( tex,{ delay = 1000, time = 2000,  alpha = 0, onComplete = nil} )
 



end 
return true
end



function  reset01 ( event )

if event.phase == "began" then 

 print "rest the game"

if ( system.getInfo("platformName") == "Android" ) then
      gameNetwork.show( "leaderboards" )
   else
      gameNetwork.show( "leaderboards", { leaderboard = {timeScope="AllTime"} } )
   end
--[[
physics.start( )
storyboard.purgeScene( "game2" ) 
storyboard.gotoScene("game2","flip")
--]]

end 
return true
end

function  men01 ( event )

if event.phase == "began" then 
  print 'menu'


storyboard.gotoScene("start","flip")


end 
return true 
end


 function scrollSpace(self,event)
 if self.x  < display.contentWidth-1350 then
  self.x = 1000
else 
self.x = self.x - self.speed
 end  
 	end
 	
 	 
  function moveMines(self,event)
  if self.x  < -900 then
   self.x = 489            --800
   
   self.y = math.random(90,220)
   self.x = 500
   self.speed = math.random(2,6)
--  self.amp = math.random(20,100)
--  self.angle = math.random(1,360)
 
 else 
    self.x = self.x - self.speed
    -- self.angle = self.angle + .1
    -- self.y = self.amp * math.sin(self.angle)+ self.initY
        end
 	end
 	
 	
 	
 function coins010(self,event)
  if self.x  < -900 then
   self.x = 800
   
   self.y = math.random(90,100)
   self.x = 500
   self.speed = math.random(2,6)
  self.amp = math.random(20,100)
 self.angle = math.random(1,360)
 
 else 
    self.x = self.x - self.speed
     self.angle = self.angle + .1
     self.y = self.amp * math.sin(self.angle)+ self.initY
        end 
 	end	
 	
  --	 moveMissile1

function jetReady()
	jet.bodyType = "dynamic"
  timegive()
end


function activateJets(self,event)
  self:applyForce(0,-1.5,self.x,self.y)
  end
  
  function touchScreen(event)
 -- print("touch")
  if event.phase == "began"then
 jet.enterFrame = activateJets 
 Runtime:addEventListener ("enterFrame",jet)
   end
   
   if event.phase == "ended"then
   --print ("ended")
   Runtime:removeEventListener ("enterFrame",jet)
  end

  end

  --[[

-- check if score is high or not and display it 
function newHigh(event)
--checkUp()
   prevScore = score.load()
   if score.get() > prevScore then

    transition.to( newHighscore,{ time = 3000, alpha = 1, delay=5000,onComplete = recycle2} )
  end 
end 
timer.performWithDelay( 1000, newHigh, -1 )--]]

function  recycle ( event )
  display.remove( newHighscore )
  newHighscore = nil 
  display.remove(coins[coins] )
   
  display.remove( howtoplay )

end

function  recycle2 ( event )
  display.remove( newHighscore )
  newHighscore = nil 
end

--[[
function checkUp (event)
print "pass up"
 prevScore = score.load()
   if score.get() > prevScore then
   -- print "saved"
     
end 
--]]
 function gameOver()
 print " sumit"

awardUnlock()


   storyboard.gotoScene("restart", "fade", 400)

end 

function scoreSubmit( event )
  print "scoreSubmited"

gameNetwork.request( "setHighScore",
{
    localPlayerScore = { category="CgkI2tWRg-kfEAIQBg", value=myscore },
    listener = requestCallback
})

end 


function coinSubmit( event )
  print "coinSubmited"

gameNetwork.request( "setHighScore",
{
    localPlayerScore = { category="CgkI2tWRg-kfEAIQGA", value=coinsCount },
    listener = requestCallback
})

end 


function awardUnlock( event )


gameNetwork.request( "unlockAchievement",
{
   achievement = { identifier="CgkI2tWRg-kfEAIQAQ",percentComplete=100, showsCompletionBanner=true },
   listener = achievementRequestCallback
} )


end

function explode()

	explosion.x = jet.x
	explosion.y = jet.y
	explosion.isVisible = true
	explosion:play()
	jet.isVisible = false
	timer.performWithDelay(3000, gameOver, 1)
audio.play(soundFile2)

end

 function onLocalCollision( self, event )
 
if event.other.name ==  "enmey" then 

  if event.phase == "began" then
    if jet.collided == false then 
      jet.collided = true
      jet.bodyType = "static"
      system.vibrate( )
     --  result =  timer.pause(timer1 )
      explode()
      timer.cancel( timer01 )


  jet:removeEventListener( "preCollision", jet )
 
  jet:removeEventListener( "collision", jet )

--[[
elseif event.other.myName == "money" then 
--jet:preCollision()

  print "coin"
--]]

end 
end 
end 
end



function  award ( event )


if myscore == 20 then 

gameNetwork.request( "unlockAchievement",
{
   achievement = { identifier="CgkI2tWRg-kfEAIQAg",percentComplete=100, showsCompletionBanner=true },
   listener = achievementRequestCallback
} )


elseif  myscore ==  50 then 

gameNetwork.request( "unlockAchievement",
{
   achievement = { identifier="CgkI2tWRg-kfEAIQAw",percentComplete=100, showsCompletionBanner=true },
   listener = achievementRequestCallback
} )


elseif myscore == 80 then 

gameNetwork.request( "unlockAchievement",
{
   achievement = { identifier="CgkI2tWRg-kfEAIQBA",percentComplete=100, showsCompletionBanner=true },
   listener = achievementRequestCallback
} )


elseif myscore == 100 then 



gameNetwork.request( "unlockAchievement",
{
   achievement = { identifier="CgkI2tWRg-kfEAIQBQ",percentComplete=100, showsCompletionBanner=true },
   listener = achievementRequestCallback
} )


elseif coinsCount == 10 then 



gameNetwork.request( "unlockAchievement",
{
   achievement = { identifier="CgkI2tWRg-kfEAIQCA",percentComplete=100, showsCompletionBanner=true },
   listener = achievementRequestCallback
} )



elseif coinsCount == 20 then 



gameNetwork.request( "unlockAchievement",
{
   achievement = { identifier="CgkI2tWRg-kfEAIQCQ",percentComplete=100, showsCompletionBanner=true },
   listener = achievementRequestCallback
} )

elseif myscore == 150 then 

gameNetwork.request( "unlockAchievement",
{
   achievement = { identifier="CgkI2tWRg-kfEAIQCg",percentComplete=100, showsCompletionBanner=true },
   listener = achievementRequestCallback
} )


elseif myscore == 190 then 
print "you called ?"
gameNetwork.request( "unlockAchievement",
{
   achievement = { identifier="CgkI2tWRg-kfEAIQCw",percentComplete=100, showsCompletionBanner=true },
   listener = achievementRequestCallback
} )


elseif myscore == 250  then 

gameNetwork.request( "unlockAchievement",
{
   achievement = { identifier="CgkI2tWRg-kfEAIQDA",percentComplete=100, showsCompletionBanner=true },
   listener = achievementRequestCallback
} )


elseif myscore == 500  then 

gameNetwork.request( "unlockAchievement",
{
   achievement = { identifier="CgkI2tWRg-kfEAIQDQ",percentComplete=100, showsCompletionBanner=true },
   listener = achievementRequestCallback
} )


elseif myscore == 4000  then 

gameNetwork.request( "unlockAchievement",
{
   achievement = { identifier="CgkI2tWRg-kfEAIQDg",percentComplete=100, showsCompletionBanner=true },
   listener = achievementRequestCallback
} )


elseif myscore == 3000  then 

gameNetwork.request( "unlockAchievement",
{
   achievement = { identifier="CgkI2tWRg-kfEAIQDw",percentComplete=100, showsCompletionBanner=true },
   listener = achievementRequestCallback
} )



elseif myscore == 100000  then 

gameNetwork.request( "unlockAchievement",
{
   achievement = { identifier=" CgkI2tWRg-kfEAIQEA ",percentComplete=100, showsCompletionBanner=true },
   listener = achievementRequestCallback
} )


elseif coinsCount == 100  then 

gameNetwork.request( "unlockAchievement",
{
   achievement = { identifier="CgkI2tWRg-kfEAIQEQ ",percentComplete=100, showsCompletionBanner=true },
   listener = achievementRequestCallback
} )


elseif coinsCount == 300  then 

gameNetwork.request( "unlockAchievement",
{
   achievement = { identifier="CgkI2tWRg-kfEAIQEg  ",percentComplete=100, showsCompletionBanner=true },
   listener = achievementRequestCallback
} )


elseif myscore == 500  then 

gameNetwork.request( "unlockAchievement",
{
   achievement = { identifier="CgkI2tWRg-kfEAIQEw",percentComplete=100, showsCompletionBanner=true },
   listener = achievementRequestCallback
} )



elseif coinsCount == 1000000  then 

gameNetwork.request( "unlockAchievement",
{
   achievement = { identifier="CgkI2tWRg-kfEAIQFA",percentComplete=100, showsCompletionBanner=true },
   listener = achievementRequestCallback
} )


elseif coinsCount == 900 then 

gameNetwork.request( "unlockAchievement",
{
   achievement = { identifier="CgkI2tWRg-kfEAIQFQ ",percentComplete=100, showsCompletionBanner=true },
   listener = achievementRequestCallback
} )


elseif coinsCount == 2000 then 

gameNetwork.request( "unlockAchievement",
{
   achievement = { identifier="CgkI2tWRg-kfEAIQFg ",percentComplete=100, showsCompletionBanner=true },
   listener = achievementRequestCallback
} )



elseif myscore == 30 then 

gameNetwork.request( "unlockAchievement",
{
   achievement = { identifier="CgkI2tWRg-kfEAIQFw",percentComplete=100, showsCompletionBanner=true },
   listener = achievementRequestCallback
} )

end 
end

--achievementTimer=timer.performWithDelay( 1000, award,0 )

leaderboardTimer=timer.performWithDelay( 1000, scoreSubmit,0 )

coinTimer=timer.performWithDelay( 1000, coinSubmit,0 )



   function scene:enterScene(event)
  	 local screenGroup = self.view

 pauseButton:setEnabled(false)

resume:addEventListener( "touch", pause02 )

men:addEventListener( "touch", men01 )

reset:addEventListener( "touch", reset01 )

 Runtime:addEventListener ("enterFrame",award)
 --Runtime:addEventListener ("enterFrame",scoreSubmit)
 --Runtime:addEventListener ("enterFrame",coinSubmit)

--jet:addEventListener( "preCollision" )

jet.preCollision = onLocalPreCollision
jet:addEventListener( "preCollision", jet )

--jet:addEventListener( "postCollision" )
  --	storyboard.purgeScene("start")
--	storyboard.purgeScene("restart")
   -- storyboard.purgeScene("pause menu")
 Runtime:addEventListener ("enterFrame",empire3)
  
  jet.collision = onLocalCollision
  jet:addEventListener( "collision", jet )
  	

  moon.enterFrame = scrollSpace
 Runtime:addEventListener ("enterFrame",moon)

--pause:addEventListener("touch", pause01)
  --pause:addEventListener("touch",pause01)
  
  --shootButton:addEventListener("touch",shoot)
 	
 empire3.enterFrame = scrollSpace

 
 moon2.enterFrame = scrollSpace
 Runtime:addEventListener ("enterFrame",moon2)
 	
 mine1.enterFrame = moveMines
 Runtime:addEventListener ("enterFrame",mine1)
 
 	 mine2.enterFrame = moveMines
 Runtime:addEventListener ("enterFrame",mine2)
 
 	 mine3.enterFrame = moveMines
 Runtime:addEventListener ("enterFrame",mine3)
 	
   mine4.enterFrame = moveMines
 Runtime:addEventListener ("enterFrame",mine4)	
 

   mine10.enterFrame = scrollSpace
 Runtime:addEventListener ("enterFrame",mine10)  
 

   rocket02	.enterFrame = coins010
Runtime:addEventListener ("enterFrame",rocket02)


   rocket .enterFrame = moveMines
Runtime:addEventListener ("enterFrame",rocket)  


   rock .enterFrame = moveMines
Runtime:addEventListener ("enterFrame",rock)  


 coin04.enterFrame = coins010
Runtime:addEventListener ("enterFrame",coin04)
 	

rocket03 .enterFrame = coins010
Runtime:addEventListener ("enterFrame",rocket03)

rocket04 .enterFrame = moveMines
Runtime:addEventListener ("enterFrame",rocket04)


ball01 .enterFrame = coins01
Runtime:addEventListener ("enterFrame",ball01)

ball02 .enterFrame = coins010
Runtime:addEventListener ("enterFrame",ball02)	
	
ball03 .enterFrame = moveMines
Runtime:addEventListener ("enterFrame",ball03)

ball04 .enterFrame = coins010
Runtime:addEventListener ("enterFrame",ball04)	
	
 --	empire2.enterFrame = scrollSpace
 --Runtime:addEventListener ("enterFrame",empire2)
 
 	--	empire4.enterFrame = scrollSpace
-- Runtime:addEventListener ("enterFrame",empire4)
 	
 empire1.enterFrame = scrollSpace
 Runtime:addEventListener ("enterFrame",empire1)
 
 Runtime:addEventListener("touch",touchScreen)
 
 -- Runtime:addEventListener("collision",onCollision) 
 -- Runtime:addEventListener("collision",bulletHit)

--coin01:addEventListener( "preCollision", collision1 )
--coin04:addEventListener( "collision", preCollision1 )

stop:addEventListener("touch",stopMusic)

play:addEventListener("touch",playMusic)
   

  end 
 
 
  function scene:exitScene(event)
 local screenGroup = self.view

timer.cancel( leaderboardTimer )
--timer.cancel( achievementTimer )
timer.cancel( coinTimer )

audio.dispose(soundFile3)

 Runtime:removeEventListener ("enterFrame",award)
--[[
Runtime:removeEventListener ("enterFrame",scoreSubmit)
 Runtime:removeEventListener ("enterFrame",coinSubmit)
 --]]
 Runtime:removeEventListener ("enterFrame",mine10)  
 


coinsCount = coinsCount-coinsCount 
scoreText3.text= coinsCount.."c"

myscore = myscore - myscore 
scoreText2.text = myscore .. "M"


timer.cancel( timer01 )
result = timer.pause( timer1 )
--timer3 = timer.cancel( chronixx )

  Runtime:removeEventListener ("enterFrame",award)
 -- pause:removeEventListener("touch", pause01)
  Runtime:removeEventListener("touch",touchScreen)
  Runtime:removeEventListener ("enterFrame",moon)
  Runtime:removeEventListener ("enterFrame",empire3)
  Runtime:removeEventListener ("enterFrame",moon2)
  Runtime:removeEventListener ("enterFrame",mine1)
  Runtime:removeEventListener ("enterFrame",mine2)
  Runtime:removeEventListener ("enterFrame",mine3)
  Runtime:removeEventListener ("enterFrame",mine4)
  Runtime:removeEventListener ("enterFrame",coin04)
  Runtime:removeEventListener ("enterFrame",coin01)
  Runtime:removeEventListener ("enterFrame",empire1)
  --Runtime:removeEventListener("collision",onCollision)  
  Runtime: removeEventListener ("enterFrame",rocket02)
  Runtime:removeEventListener ("enterFrame",ball01)
  Runtime:removeEventListener ("enterFrame",ball02)
  Runtime:removeEventListener ("enterFrame",ball03)
  Runtime:removeEventListener ("enterFrame",ball04)
  Runtime:removeEventListener ("enterFrame",rocket04)
  Runtime:removeEventListener ("enterFrame",rocket03) 	
--  pause:removeEventListener("touch",pause01)
 -- shootbutton:removeEventListener("touch",shoot)
Runtime:removeEventListener ("enterFrame",rocket)  
Runtime:removeEventListener ("enterFrame",rock)  


  end
  
   function scene:destroyScene(event)
    local screenGroup = self.view
  
   end
 

  
 
scene:addEventListener("createScene",scene)
scene:addEventListener("enterScene",scene) 
scene:addEventListener("exitScene",scene) 
scene:addEventListener("destroyScene",scene) 

return scene
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 