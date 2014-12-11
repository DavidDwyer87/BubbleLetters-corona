---------------------------------------------------------------------------------
-- SCENE Menu Scene
-- Scene notes go here
---------------------------------------------------------------------------------

local widget = require("widget")

local storyboard = require( "storyboard" )

--local gs = require("GPGS")

local scene = storyboard.newScene()

local play = nil
local wordResource = nil
local options = nil
local howTo = nil
local leader = nil

local bg = nil
local logo = nil
local gdata  = require("GameData")

local leaderboardId = ""
local achievementId = ""
local soundState = gdata.getSound()



 
-- Clear previous scene
storyboard.removeAll()
 
-- local forward references should go here --
 
---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------


-- Called when the scene's view does not exist:
function scene:createScene(event)	

  local group = self.view   

    bg = display.newImageRect("images/UI/backgrounds/background5.png",display.contentWidth,display.contentHeight);
	bg.x = display.contentWidth*0.5;
	bg.y = display.contentHeight*0.5;

	group:insert(bg)	

	logo = display.newImageRect("images/UI/bubbleLogo.png",380,180)
	logo.x =display.contentWidth*0.5;
	logo.y = display.contentHeight*0.15;

	group:insert(logo)

	-- Create the button 
	play = widget.newButton
	{

		left = 160/2,
		top = logo.y+120,
		--width = 350,
		--height = 48,	
	    --label = "Play",
		font = "Arial",
		defaultFile="images/buttons/play_btn_unpress.png",
	    overFile="images/buttons/play_btn_press.png",
		onRelease = handlePlayEvent
	}
	play._view._label.size =40;

	howTo = widget.newButton
	{

		left = display.contentWidth-50,
		top =  display.contentHeight*0.77,
		width = 48,
		height = 48,	
	    --label = "Learn",
		font = "Arial",
		defaultFile="images/buttons/info.png",
		onRelease = learn
	}
	howTo._view._label.size =40;

	leader = widget.newButton
	{
		left = display.contentWidth-50,
		top =  howTo.y-80,
		width = 48,
		height = 48,	
	    --label = "Learn",
		font = "Arial",
		defaultFile="images/buttons/Medal.png",
		onRelease = lead
	}

	wordResource = widget.newButton
	{	

		left = 160/2,
		top = play.y+15,
		--width = 350,
		--height = 48,	
	    --label = "Words",
		font = "Arial",
		defaultFile="images/buttons/words_btn_unpress.png",
	    overFile="images/buttons/words_btn_press.png",
		onRelease = Words
	}
	wordResource._view._label.size =40;

	options = widget.newButton
	{

		left = 160/2,
		top = wordResource.y+15,
		--width = 350,
		--height = 48,	
		font = "Arial",	
		--label = "Options",
		defaultFile="images/buttons/options_btn_unpress.png",
	    overFile="images/buttons/options_btn_press.png",
		onEvent = handleOptionEvent
	}
	options._view._label.size =40;	

	group:insert( play)
	group:insert(wordResource)
	group:insert( options )
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
  display.remove(play)
  display.remove(wordResource)
  display.remove(options)
  display.remove(howTo)
  display.remove(leader)
  
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
  play = nil
  options = nil
  wordResource = nil
  howTo = nil  
  leader = nil
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

function learn()
	-- body
	storyboard.gotoScene("info")
end

function Words()
	-- body
	system.openURL("http://www.bubletter.com/dictionary.php")
end

 function handlePlayEvent(event)
	local phase =  event.phase;
	
	if "ended" == phase then		
		--storyboard.gotoScene("mainScene")
		storyboard.gotoScene("prep")
	end
end

function handleOptionEvent(event)
	local phase =  event.phase;
	
	if "ended" == phase then
		storyboard.gotoScene("Options")	
	end
end

function lead(event)
	storyboard.gotoScene("End_Game")
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
