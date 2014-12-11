---------------------------------------------------------------------------------
-- SCENE NAME
-- Scene notes go here
---------------------------------------------------------------------------------
local widget = require("widget")
local storyboard = require( "storyboard" )
local tapfortap = require("plugin.tapfortap")
local scene = storyboard.newScene()
 
-- Clear previous scene
storyboard.removeAll()
 
-- local forward references should go here --
local gd = require("GameData")
 
---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
 local bg = nil
 local logo = nil
 local sound = nil
 local soundlb = nil
 local credits = nil
 local credit = nil
 local menu = nil
 local music = nil
 local musiclb = nil
 local soundState = nil
 local state2 = nil


-- Called when the scene's view does not exist:
function scene:createScene( event )
  local group = self.view
  
  bg = display.newImageRect("images/UI/backgrounds/background5.png",display.contentWidth,display.contentHeight)
	bg.x = display.contentWidth/2
	bg.y = display.contentHeight/2

	logo = display.newImageRect("images/UI/Options.png",380,130)
	logo.x =150
	logo.y =70
	

  sound = widget.newButton
  {
      left=(display.contentWidth/2)-70,
      top=(display.contentHeight/2)-110,
      width=64,
      height=64,
      defaultFile="images/UI/speaker_volume-128.png",      
      onRelease=soundEvt
  }

  music = widget.newButton
  {
      left=(display.contentWidth/2)-70,
      top=sound.y+54,
      width=64,
      height=64,
      defaultFile="images/UI/music.png",
      overFile="images/UI/music.png",
      onRelease=musicEvt
  }

  credits = widget.newButton
  {
      left=(display.contentWidth/2)-70,
      top=sound.y+130,
      width=64,
      height=64,
      defaultFile="images/UI/sign-up.png",
      overFile="images/UI/sign-up.png",
      onRelease=creditEvt
  }

  menu = widget.newButton
  {
      left=2,
      top=display.contentHeight-120,
      width=100,
      height=60,
      defaultFile="images/buttons/menu_btn.png",
      overFile="images/buttons/menu_btn_press.png",
      onEvent=menucall
  }

  local state = false

  if(gd.getSound())then
    state = "loud"
  else
    state = "mute"
  end

  if (gd.getMusic()) then
    state2 = "loud"
  else
    state2 = "mute"
  end

  credit =  display.newText("credits",credits.x+90,credits.y,native.systemFontBold,30)
  soundlb = display.newText(state,sound.x+90,sound.y,native.systemFontBold,30)
  musiclb = display.newText(state2,music.x+90,music.y,native.systemFontBold,30)

  
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
  display.remove(sound) 
  display.remove(soundlb)
  display.remove(menu)
  display.remove(credit)
  display.remove(credits)
  display.remove(music)
  display.remove(musiclb)
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
  sound = nil
  soundlb = nil
  menu = nil
  credit = nil
  credits = nil
  music = nil
  musiclb = nil
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

function menucall(e)
  storyboard.gotoScene("MenuScene")
end

function soundEvt(e)
  if(gd.getSound())then
    soundlb.text="mute"
    --sound.defaultFile = display.newImageRect("images/UI/speaker_volume-mute-128.png",64,64)   
    gd.setSound(false)  
  else
    --sound.defaultFile = display.newImageRect("images/UI/speaker_volume-128.png",64,64)    
    soundlb.text="loud"
    gd.setSound(true)
  end
end

function musicEvt(e)
   if(gd.getMusic())then
    musiclb.text="mute"
    --sound.defaultFile = display.newImageRect("images/UI/speaker_volume-mute-128.png",64,64)   
    gd.setMusic(false)  
  else
    --sound.defaultFile = display.newImageRect("images/UI/speaker_volume-128.png",64,64)    
    musiclb.text="loud"
    gd.setMusic(true)
  end
end

function creditEvt(e)
  local alert = native.showAlert( "Bubble Letters - Credits",
   "David Dwyer - game designer and Developer \n"..
   "----Contact Info----\n"..
   "Email:Bubletter@gmail.com\n"..
   "Skype:DavidDwyer87\n\n"..
   "Neal Mcbean - graphic artist\n"..
   "----Contact info----\n"..
   "Email:NTekSolutions@gmail.com", 
    { "OK"})
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