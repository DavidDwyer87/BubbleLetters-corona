---------------------------------------------------------------------------------
-- SCENE NAME
-- Scene notes go here
---------------------------------------------------------------------------------
 
local storyboard = require( "storyboard" )
local widget = require("widget")
local gs = require("GPGS")
local gdata = require("GameData")
local tapfortap = require("plugin.tapfortap")

local scene = storyboard.newScene()

local playerName
local bg
local logo
local play_again
local menu
local status
local heart
local equal
local life
local life_pur
local bomb
local equal1
local life1
local bomb_pur
local pin
local equal2
local life2
local pin_pur

local topwordscore = nil
local topword_val = nil
local topwordscore_val = nil
local topscore = nil
local topscore_val = nil
local curentscore = nil
local curentscore_val = nil
 
-- Clear previous scene
storyboard.removeAll()
 
-- local forward references should go here --
 
---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
tapfortap.initialize("f1408a971d4af1550cd3d75bc50b26e6")
tapfortap.createAdView(BOTTOM,CENTER,0,0)

-- Called when the scene's view does not exist:
function scene:createScene( event )
  local group = self.view

  --gs.submitScore()

  bg = display.newImageRect("images/UI/backgrounds/background7.png",display.contentWidth,display.contentHeight)
  bg.x= display.contentWidth/2
  bg.y=display.contentHeight/2

  --logo = display.newImageRect("images/UI/bubble_logo2.png",280,100)
  --logo.x = 170 
  --logo.y = 60  

  topwordscore = display.newImageRect('images/UI/topwordscore.png',200,80)
  topwordscore.x = display.contentWidth/2
  topwordscore.y = 60

  local word = gdata.getTopWord()
  local sco = gdata.getTopWordScore()
  local points = sco.." points"
  local score = gdata.getScore().." points"
  local current = gdata.getCurrent().." points" 

  topword_val = display.newText(word,display.contentWidth/2,topwordscore.y+40,native.systemFontBold,30)
  topword_val:setTextColor( 255, 255, 0)
  
  topwordscore_val = display.newText(points,display.contentWidth/2,topword_val.y+50,native.systemFontBold,30)  
  topwordscore_val:setTextColor(255, 255, 0)


  topscore =display.newImageRect('images/UI/topscore.png',200,80)
  topscore.x = display.contentWidth/2
  topscore.y = topwordscore.y+140

  topscore_val = display.newText(score,display.contentWidth/2,topscore.y+50,native.systemFontBold,30)  
  topscore_val:setTextColor( 255, 255, 0)

  curentscore = display.newImageRect('images/UI/currentscore.png',200,80)
  curentscore.x = display.contentWidth/2
  curentscore.y = topscore.y+100

  curentscore_val = display.newText(current,display.contentWidth/2,curentscore.y+50,native.systemFontBold,30)
  curentscore_val:setTextColor(255, 255, 0)

  menu = widget.newButton
  {
      left=2,
      top=display.contentHeight-120,
      width=100,
      height=60,
      defaultFile="images/buttons/menu_btn.png",
      overFile="images/buttons/menu_btn_press.png",
      onRelease=menucall
  } 

  play_again = widget.newButton
  {
      left=display.contentWidth-102,
      top=display.contentHeight-120,
      width=100,
      height=60,
      defaultFile="images/buttons/play_again_btn.png",
      overFile="images/buttons/play_again_btn_press.png",
      onRelease=playAgain
  } 
  --gs.showLeaderboard()

end
 
-- Called BEFORE scene has moved onscreen:
function scene:willEnterScene( event )
  local group = self.view
 
end
 
-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
  local group = self.view
  
end
 
-- Called when scene is about to move offscreen:
function scene:exitScene( event )
  local group = self.view
  display.remove(bg) 
  display.remove(logo)
  display.remove(play_again)
  display.remove(menu)
  display.remove(status)
  display.remove(heart)
  display.remove(equal)
  display.remove(life)
  display.remove(life_pur)
  display.remove(bomb)
  display.remove(equal1)
  display.remove(life1)
  display.remove(bomb_pur)
  display.remove(pin)
  display.remove(equal2)
  display.remove(life2)
  display.remove(pin_pur)

  display.remove(topwordscore)  
  display.remove(topword_val)
  display.remove(topwordscore_val)
  display.remove(topscore)
  display.remove(topscore_val)
  display.remove(curentscore)
  display.remove(curentscore_val)
end
 
-- Called AFTER scene has finished moving offscreen:
function scene:didExitScene( event )
  local group = self.view
 
end
 
-- Called prior to the removal of scene's "view" (display view)
function scene:destroyScene( event )
  local group = self.view
  
  bg = nil 
  logo = nil
  play_again = nil
  menu = nil
  status = nil
  heart=nil
  equal=nil
  life=nil
  life_pur=nil
  bomb=nil
  equal1=nil
  life1=nil
  bomb_pur=nil
  pin=nil
  equal2=nil
  life2=nil
  pin_pur=nil

  topwordscore=nil
  topword_val=nil
  topwordscore_val=nil
  topscore=nil
  topscore_val=nil
  curentscore=nil
  curentscore_val=nil
end
 
-- Called if/when overlay scene is displayed via storyboard.showOverlay()
function scene:overlayBegan( event )
  local group = self.view
  local overlay_name = event.sceneName  -- name of the overlay scene 
end
 
-- Called if/when overlay scene is hidden/removed via storyboard.hideOverlay()
function scene:overlayEnded( event )
  local group = self.view
  local overlay_name = event.sceneName  -- name of the overlay scene 
end

function playAgain(e)
  storyboard.gotoScene("mainScene")
  --gs.showLeaderboard()
end

function menucall(e)
  storyboard.gotoScene("MenuScene")
end

function nextg()
  storyboard.gotoScene("mainScene")
end
 
---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
 
-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )
 
-- "willEnterScene" event is dispatched before scene transition begins
scene:addEventListener( "willEnterScene", scene )
 
-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )
 
-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "exitScene", scene )
 
-- "didExitScene" event is dispatched after scene has finished transitioning out
scene:addEventListener( "didExitScene", scene )
 
-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )
 
-- "overlayBegan" event is dispatched when an overlay scene is shown
scene:addEventListener( "overlayBegan", scene )
 
-- "overlayEnded" event is dispatched when an overlay scene is hidden/removed
scene:addEventListener( "overlayEnded", scene )
 
---------------------------------------------------------------------------------
 
return scene