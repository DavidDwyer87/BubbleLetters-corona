---------------------------------------------------------------------------------
-- SCENE NAME
-- Scene notes go here
---------------------------------------------------------------------------------
 
local storyboard = require( "storyboard" )
local widget = require("widget")
local scene = storyboard.newScene()
 
-- Clear previous scene
storyboard.removeAll()
 
-- local forward references should go here --
local bg
local logo
local sun 
local moves
local Moves_text
local reg_bub
local letterText
local val
local m_text
local bubGroup
local dub_bub
local letterText2
local val2
local dubGroup
local trip_bub
local letterText3
local val3
local tripGroup
local reg_text
local reg_desc
local bomb
local bomb_desc
local bomb_txt
local pin
local pin_desc
local pin_txt
local next_btn
local menu
local dub_txtlb = nil
local trip_txtlb = nil
---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
 
-- Called when the scene's view does not exist:
function scene:createScene( event )
  local group = self.view
  
  bg = display.newImageRect("images/UI/backgrounds/prepBackground.png",display.contentWidth,display.contentHeight)
  bg.x=display.contentWidth/2
  bg.y=display.contentHeight/2

  logo = display.newImageRect("images/UI/bubble_logo2.png",310,100)
  logo.x=340/2
  logo.y=50

  sun = display.newImageRect("images/UI/Status-weather-clear-icon.png",128,128)
  sun.x=40
  sun.y=120

  moves = display.newText("Score\n"..
    "   17", 45,120, native.systemFontBold, 17)
  moves:setTextColor(0,0,0)

  Moves_text = "The sun contains the\n accumulated score for each\n word spelt correctly. "
  

  m_text = display.newText(Moves_text,display.contentWidth-110,120,native.systemFontBold,14)

  reg_bub = display.newImage("images/UI/assests/Reg_bubble.png")
  reg_bub.width  = 48
  reg_bub.height = 48
  
  letterText = display.newText( "A", 0,10, native.systemFontBold, 20 )
  letterText:setTextColor(0,0, 0)
  letterText.x = reg_bub.x
  letterText.y = reg_bub.y

  val = display.newText("2",10,10,native.systemFontBold,12)
  val:setTextColor(0,0,0)
  val.x = reg_bub.x+10
  val.y = reg_bub.y+8

  bubGroup = display.newGroup()
  bubGroup:insert(reg_bub)
  bubGroup:insert(letterText)
  bubGroup:insert(val)

  bubGroup.x=40
  bubGroup.y=200

  dub_bub = display.newImage("images/UI/assests/Double_bubble.png")
  dub_bub.width  = 48
  dub_bub.height = 48 

  local dub_txt = "-The orange bubble represents a \ndouble word score.\n"
  dub_txtlb = display.newText(dub_txt, display.contentWidth-130,300, native.systemFontBold, 14 )
 
  letterText2 = display.newText( "B", 0,10, native.systemFontBold, 20 )
  letterText2:setTextColor(0,0, 0)
  letterText2.x = reg_bub.x
  letterText2.y = reg_bub.y

  val2 = display.newText("3",10,10,native.systemFontBold,12)
  val2:setTextColor(0,0,0)
  val2.x = reg_bub.x+10
  val2.y = reg_bub.y+8

  dubGroup = display.newGroup()
  dubGroup:insert(dub_bub)
  dubGroup:insert(letterText2)
  dubGroup:insert(val2)

  dubGroup.x=40
  dubGroup.y=300

  trip_bub = display.newImage("images/UI/assests/Triple_bubble.png")
  trip_bub.width  = 48
  trip_bub.height = 48
  
  letterText3 = display.newText( "C", 0,10, native.systemFontBold, 20 )
  letterText3:setTextColor(0,0, 0)
  letterText3.x = reg_bub.x
  letterText3.y = reg_bub.y

  val3 = display.newText("3",10,10,native.systemFontBold,12)
  val3:setTextColor(0,0,0)
  val3.x = reg_bub.x+10
  val3.y = reg_bub.y+8
  
  local trip_txt = "-The red bubble represents a \ntriple word score."
  trip_txtlb = display.newText(trip_txt, display.contentWidth-135,350, native.systemFontBold, 14)

  tripGroup = display.newGroup()
  tripGroup:insert(trip_bub)
  tripGroup:insert(letterText3)
  tripGroup:insert(val3)

  tripGroup.x=40
  tripGroup.y=350

  reg_text ="Each bubble contains a letter and \na score. You can spell a word\nby tapping "..
  "the bubble.The score is\ntallied by the number \nassociated with each letter.\n"
  
  reg_desc = display.newText(reg_text, display.contentWidth-130,225, native.systemFontBold, 14 ) 
  
  menu = widget.newButton
  {
      left=10,
      top=display.contentHeight-110,
      width=100,
      height=60,
      defaultFile="images/buttons/menu_btn.png",
      overFile="images/buttons/menu_btn_press.png",
      onEvent=menucall
  }
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
  display.remove(sun)  
  display.remove(reg_bub)
  display.remove(letterText)
  display.remove(letterText2)
  display.remove(val2)
  display.remove(val)
  display.remove(m_text)
  display.remove(dub_bub)
  display.remove(trip_bub)
  display.remove(letterText3)
  display.remove(val3)
  display.remove(reg_text)
  display.remove(bomb_txt)
  display.remove(pin_txt)
  display.remove(next_btn)
  display.remove(menu)
  display.remove(moves)
  display.remove(bomb)
  display.remove(pin)
  display.remove(reg_desc)
  display.remove(dub_txtlb)
  display.remove(trip_txtlb)
end
 
-- Called AFTER scene has finished moving offscreen:
function scene:didExitScene( event )
  local group = self.view
  
end
 
-- Called prior to the removal of scene's "view" (display view)
function scene:destroyScene( event )
  local group = self.view

  bg=nil  
  logo=nil 
  sun=nil  
  reg_bub=nil
  letterText=nil
  letterText2=nil
  val2=nil
  val=nil
  m_text=nil
  dub_bub=nil
  trip_bub=nil
  letterText3=nil
  val3=nil
  reg_text=nil
  bomb_txt=nil
  pin_txt=nil
  next_btn=nil
  menu=nil
  moves=nil
  bomb=nil
  pin=nil
  reg_text=nil
  reg_desc=nil
  trip_txtlb=nil
  dub_txtlb=nil
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

function nextg(event)
  -- body
  storyboard.gotoScene("mainScene")
  --print("onto purchase scene")
end

function menucall(event)
  -- body
  storyboard.gotoScene("MenuScene")
  print("menu scene")
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