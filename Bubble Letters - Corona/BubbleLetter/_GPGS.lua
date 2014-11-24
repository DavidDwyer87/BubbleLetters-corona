local gameNetwork = require( "gameNetwork" )
local gdata= require("GameData")



local function initCallback( event )
    if not event.isError then
        --native.showAlert( "Success!", "", { "OK" } )
        gameNetwork.request("login",
         {
            userInitiated = true
         })
    else
        native.showAlert( "Failed!", event.errorMessage, { "OK" } )
        print( "Error Code:", event.errorCode )
    end
end

function updateleaderboard()
   -- Tries to automatically log in the user without displaying the login screen if the user doesn't want to login
   gameNetwork.request("setHighScore",
   {
      localPlayerScore =
      {
         category = "CgkIms6XnIgVEAIQAA", -- Id of the leaderboard to submit the score into
         value = 30 -- The score to submit
      }
   })

   --gameNetwork.show("Bubble Letters Leaderboard") -- Shows all the leaderboards.
end

function showLeaderboards()
   gameNetwork.show("Bubble Letters Leaderboard") -- Shows all the leaderboards.
end

local function onSystemEvent( event )
    if ( event.type == "applicationStart" ) then
        gameNetwork.init( "google", initCallback )
        return true
    end
end

Runtime:addEventListener( "system", onSystemEvent )

local public = {}

public.leaderboard = showLeaderboards
public.updateleaderboard = updateleaderboard

return public
