 local storyboard = require("storyboard")
 local scene = storyboard.newScene()
 
 centerX = display.contentWidth/2
 centeerY = display.contentHeight/2  
 
 storyboard.removeAll( )

 function scene:createScene(event)
  local screenGroup = self.view
  -- background 
 local   background = display.newImage("start background01.png",570,320)
   background.x = display.contentWidth/2
   background.y = display.contentHeight/2
    screenGroup:insert(background)


 moon = display.newImage("moon.png")
 moon.x =510
 moon.y=40
screenGroup:insert(moon)

   empire1 =display.newImage("empire1.png")
   empire1.x = display.contentWidth-85
   empire1.y= display.contentHeight-80
  screenGroup:insert(empire1)
 
    jetFighter= display.newImage("jet fighter.png")
    jetFighter.x = centerX
    jetFighter.y = display.contentHeight -280
    screenGroup:insert(jetFighter)
    
    
     
  
 end  -- end of create scene
 
 --[[

local tapit = require("tapit")

local function adClicked(result)

    -- for alert ads; result will be true if user clicked on "affirmative" alert button
    -- for all other ad types; result will be always true
    print("adClicked:", result)

end

-- If you would like to receive a banner ad from TapIt, simply call the function below.
--
-- zoneId is your active zoneId that you create on tapit control panel.
-- x and y are onscreen ad display positions.
-- onClick parameter is an optional callback function. It will be called when users click
-- on a banner.
-- You can use zoneId=3644 as a test mode until your actual zoneId will be approved by tapit.

--tapit.requestBannerAds({zoneId=42997, x= centerX, y= 400, onClick=adClicked})

-- If you would like to refresh banner ads automatically, please use the code below:
-- timer.performWithDelay( 60*1000, function() tapit.requestBannerAds({zoneId=42997, x=0, y=0, onClick=adClicked}) end, 0) 

-- TapIt also provides Alert Ads. If you comment out the code below, you will get
-- an alert popup.
-- swapButtons: set this parameter true to swap alert popup confirmation buttons.
-- This parameter is for compatibility purposes between android and ios platforms.

 --tapit.requestAlertAds({zoneId=43495, swapButtons= true, onClick=adClicked})


-- TapIt also supports full screen interstitial ads (wall ads)

 tapit.requestInterstitialAds({zoneId=47157, x=0, y=0, onClick=adClicked})

-- you can also call the function below to close an already opened interstitial ads window
-- tapit.closeInterstitialAds()


--]]


 
 
 function title()

storyboard.gotoScene("start","crossFade",400) 	

end

timer.performWithDelay( 8000, title, 1 )-- timer
 
 
 
 
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