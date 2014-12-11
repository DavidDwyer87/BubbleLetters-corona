
display.setStatusBar(display.HiddenStatusBar)

local story = require("storyboard")
local tapfortap = require("plugin.tapfortap")
local gdata  = require("GameData")

tapfortap.initialize("f1408a971d4af1550cd3d75bc50b26e6")
tapfortap.createAdView(BOTTOM,CENTER,0,0)

story.gotoScene("MenuScene")
--story.gotoScene("mainScene")

function onComplete(event)
	if (event.action == "clicked") then
		local index = event.index

		if (index == 1) then
			physics.start()
			gdata.visual(true)
		elseif(index == 2) then
			story.gotoScene("MenuScene")
		end
	end
end

function onKeyEvent(event)

  local keyname = event.keyName

  if ("back" == keyname) then
  	if (story.getCurrentSceneName() == "mainScene") then
  		physics.pause()
  		gdata.visual(false)
  		local alert = native.showAlert( "Bubble Letter", "Pause ", { "Resume", "Quit" }, onComplete )
  	elseif (story.getCurrentSceneName() == "prep" or story.getCurrentSceneName() == "End_Game" or 
  		story.getCurrentSceneName() == "Options"or story.getCurrentSceneName() == "info") then
  		story.gotoScene("MenuScene")
  	elseif(story.getCurrentSceneName() == "MenuScene") then
  		return false
  	end    
    return true
  end
end

Runtime:addEventListener( "key", onKeyEvent)

