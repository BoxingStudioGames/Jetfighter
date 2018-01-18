-----------------------------------------------------------------------------------------
--
-- main.lua
-----------------------------------------------------------------------------------------

local backgroundMusic = audio.loadStream("temple run riddim.mp3") 

 local soundFile = audio.loadSound ("buttonpush.mp3")
local sheetInfo3 = require("stars")
---local  titlebar = "no title bar"
 local storyboard = require("storyboard")
 local scene = storyboard.newScene()
 
centerX = display.contentWidth/2 
centerY = display.contentHeight/2 

local gameNetwork = require( "gameNetwork") 

storyboard.removeAll( )
 --------------------------imports 
 function scene:createScene(event)
  local screenGroup = self.view
  -- background 
   background = display.newImage("start background01.png",570,320)
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

   moon2 = display.newImage("moon.png")
   moon2.x =1090
   moon2.y=100
   moon2.speed = 4
screenGroup:insert(moon2)

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


 play = display.newImage("sound.png")
 play.x= 45
 play.y= 40 
 play.isVisible =  false 
 screenGroup:insert(play)



 stop = display.newImage("nosound.png")
 stop.x= play.x 
 stop.y= play.y
stop. isVisible = true 
 screenGroup:insert(stop)

credits2 = display.newImage("question.png")
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


-- 1st image sheet
-- sheetData1 = { width=64, height=60, numFrames=10, sheetContentWidth=640, sheetContentHeight=60}
sheet1 = graphics.newImageSheet("animations/stars.png", sheetInfo3:getSheet())

-- In your sequences, add the parameter 'sheet=' referencing which image sheet the sequence should use
 sequenceData = {
                { name="seq1", sheet=sheet1, start=1, count=10, time=3000, loopCount="bounce"}
                }

 startup= display.newSprite( sheet1, sequenceData )
--startup = display.newImage("start01.png")
--startup:scale( 1.5, 1.5 )
startup.x = centerX 
startup.y = centerY 
startup:play( )
 screenGroup:insert(startup)


play01 = display.newImage( "animations/play.png" )
play01.x = display.contentCenterX
play01.y = display.contentCenterY
screenGroup:insert(play01)



  
 end  -- end of create scene

 


 
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



function  playanime ( event )

trans1 = transition.to( play01, {time=3000, alpha= 1, onComplete=playanime2})


end
-- change back to zero alpha 
function  playanime2 ( event )

trans2 = transition.to( play01, {time= 3000, alpha= 0, onComplete=playanime})


end

timer001 =timer.performWithDelay( 1000, playanime, 1 )
 
 backgroundMusicChannel = audio.play( backgroundMusic, { channel=1, loops=-1, fadein=9000 }  )  


function playMusic( event )
 if  event.phase == "began"then 

 audio.resume( backgroundMusicChannel )

stop. isVisible = true 
play. isVisible = false 



end
return true 
end 


function stopMusic ( event )
  
  if event.phase=="began" then 

print  "work 1" 
print "kik"

 audio.pause( backgroundMusicChannel )
stop. isVisible = false 
play. isVisible = true 


end
return true 
end

    function start(event)
 if event.phase =="began" then 
 --  print "hi"

audio.play(soundFile)

   storyboard.gotoScene("game2","fade",400)
 
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
 function giverUp ( event )
  print "give"
    gameNetwork.request( "unlockAchievement",
{
   achievement = { identifier="CgkI2tWRg-kfEAIQBw",percentComplete=100, showsCompletionBanner=true },
   listener = achievementRequestCallback
} )

 end
 
  function rate (event)
 if event.phase =="began" then 
 --  print "hi"

   giverUp()

   system.openURL("https://play.google.com/store/apps/details?id=com.boxingstudiogames.jetfighter&hl=en")


   end
 end 
 
 function google (event)
 if event.phase =="began" then 
 --  print "hi"
   system.openURL("https://www.youtube.com/user/seanDp32")
 
   end
 end 
 
 
	function scrollbackground(self,event)
 if self.x  < display.contentWidth-1300 then
	  self.x = 1000
 
else 
self.x = self.x - self.speed
end 
	end

function  cred ( event )
  
if event.phase == "began" then 
  print 'question'

storyboard.gotoScene("cred","flip",400)

end
end


----------------------=============================================$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

local tapit = require("tapit")

local function adClicked(result)

    -- for alert ads; result will be true if user clicked on "affirmative" alert button
    -- for all other ad types; result will be always true
    print("adClicked:", result)

end

-- If you would like to receive a banner ad from TapIt, simply call the function below.
--
-- zoneId is your active zoneId that you create on tapit control panel.
-- x and y arSe onscreen ad display positions.
-- onClick parameter is an optional callback function. It will be called when users click
-- on a banner.
-- You can use zoneId=3644 as a test mode until your actual zoneId will be approved by tapit.

--tapit.requestBannerAds({zoneId=42997, x= centerX, y= 400, onClick=adClicked})

-- If you would like to refresh banner ads automatically, please use the code below:

timer.performWithDelay( 60*1000, function() tapit.requestBannerAds({zoneId=47151, x=125, y=289, onClick=adClicked}) end, 0) 

-- TapIt also provides Alert Ads. If you comment out the code below, you will get
-- an alert popup.
-- swapButtons: set this parameter true to swap alert popup confirmation buttons.
-- This parameter is for compatibility purposes between android and ios platforms.

 tapit.requestAlertAds({zoneId=47155, swapButtons= true, onClick=adClicked})


-- TapIt also supports full screen interstitial ads (wall ads)

 --tapit.requestInterstitialAds({zoneId=47157, x=0, y=0, onClick=adClicked})

-- you can also call the function below to close an already opened interstitial ads window
-- tapit.closeInterstitialAds()




--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$



  function scene:enterScene(event)

credits2:addEventListener("touch",cred)



 play01:addEventListener("touch",start)

leader:addEventListener( "touch", stopUp )
 
awards:addEventListener( "touch", showawards )

  facebook1:addEventListener("touch",facebook)
  	
  twitter2:addEventListener("touch",twitter)
  
  rate3:addEventListener("touch",rate)
  
  google4:addEventListener("touch",google)
  
  moon.enterFrame = scrollbackground
 Runtime:addEventListener ("enterFrame",moon)
 	
 	
 empire3.enterFrame = scrollbackground
 Runtime:addEventListener ("enterFrame",empire3)
 
 moon2.enterFrame = scrollbackground
 Runtime:addEventListener ("enterFrame",moon2)
 	
 	
 --	empire2.enterFrame = scrollbackground
 --Runtime:addEventListener ("enterFrame",empire2)
 
 	--	empire4.enterFrame = scrollbackground
-- Runtime:addEventListener ("enterFrame",empire4)
 	
 empire1.enterFrame = scrollbackground
 Runtime:addEventListener ("enterFrame",empire1)
 
stop:addEventListener("touch",stopMusic)

play:addEventListener("touch",playMusic)
   
  end 
 
 
 
 
  function scene:exitScene(event)

 timer.cancel( timer001 ) 
transition.cancel( trans1)
transition.cancel( trans2)

tapit.hide() 

   startup:removeEventListener("touch",start)

  facebook1:removeEventListener("touch",facebook)
  	
  twitter2:removeEventListener("touch",twitter)
  
  rate3:removeEventListener("touch",rate)
  
  google4:removeEventListener("touch",google)
 
  Runtime:removeEventListener ("enterFrame",moon) 
  
  Runtime:removeEventListener ("enterFrame",empire3)	
  	
  Runtime:removeEventListener ("enterFrame",moon2)
  	
  Runtime:removeEventListener ("enterFrame",empire1)
 
  end
  
   function scene:destroyScene(event)
   
   end
 

  
 
scene:addEventListener("createScene",scene)
scene:addEventListener("enterScene",scene) 
scene:addEventListener("exitScene",scene) 
scene:addEventListener("destroyScene",scene) 

return scene