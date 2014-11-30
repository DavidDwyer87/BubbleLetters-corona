---------------------------------------------------------------------------------
-- SCENE NAME
-- Scene notes go here
---------------------------------------------------------------------------------
 
local storyboard = require( "storyboard" )
local widget = require("widget")
local scene = storyboard.newScene()
--local tapfortap = require("plugin.tapfortap")
 
-- Clear previous scene
storyboard.removeAll()
 
-- local forward references should go here --
 
---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

--UI
local bg =nil
local ready=nil
local bomb=nil
local pin=nil
local bomb_txt=nil
local purchase = nil
local level = nil
local menu=nil
local heart = nil
local pin = nil
local double=nil
local triple = nil
local clocktime=nil
local img=nil
local dimg = nil
local timg = nil
local simg = nil
local logo=nil
local letterText=nil
local d_letterText=nil
local t_letterText=nil
local s_letterText=nil
local val = nil
local d_val = nil
local t_val = nil
local txtlb = nil
local d_txtlb = nil
local t_txtlb = nil
local s_txtlb = nil
local dic_txt=nil
local dictionary = nil
local learn = nil


--non UI
local btxt =""
local score=""
local counter=2
local etime = 15000
local Group = display.newGroup()
local tGroup = display.newGroup()
local dGroup = display.newGroup()


--tapfortap.initialize("f1408a971d4af1550cd3d75bc50b26e6")
-- Called when the scene's view does not exist:
function scene:createScene( event )
  local group = self.view
 
  bg = display.newImageRect("images/UI/backgrounds/prepBackground.png",display.contentWidth,display.contentHeight);
  bg.x = display.contentWidth/2;
  bg.y = display.contentHeight/2;

  logo = display.newImageRect("images/UI/bubble_logo2.png",310,100)
  logo.x=340/2
  logo.y=50

  ready = widget.newButton
  {
      left=180/2,
      top=logo.y+20,
      width=140,
      height=90,
      defaultFile="images/buttons/ready_btn_press.png",
      overFile="images/buttons/ready_btn.png",
      onEvent=nextg
  } 

  menu = widget.newButton
  {
      left=10,
      top=display.contentHeight-100,
      width=100,
      height=60,
      defaultFile="images/buttons/menu_btn.png",
      overFile="images/buttons/menu_btn_press.png",
      onEvent=menug
  }  

  counter = math.random(2)
  --counter = 1
  doCountdown()  
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
  display.remove(ready)
  display.remove(bomb)
  display.remove(pin)
  display.remove(bomb_txt)
  display.remove(purchase)
  display.remove(menu)
  display.remove(heart) 
  display.remove(pin)

  display.remove(double)
  display.remove(triple)

  display.remove(clocktime)

  display.remove(img)
  display.remove(dimg)
  display.remove(timg)
  display.remove(simg)
  display.remove(dictionary)
  display.remove(learn)

  display.remove(logo)

  display.remove(letterText)
  display.remove(d_letterText)
  display.remove(t_letterText)
  display.remove(s_letterText)

  display.remove(val)
  display.remove(d_val)
  display.remove(t_val)

  display.remove(txtlb)
  display.remove(d_txtlb)
  display.remove(t_txtlb)
  display.remove(s_txtlb)
  display.remove(dic_txt)

end
 
-- Called AFTER scene has finished moving offscreen:
function scene:didExitScene( event )
  local group = self.view
 
end
 
-- Called prior to the removal of scene's "view" (display view)
function scene:destroyScene( event )

  local group = self.view
  --UI
  bg =nil
  ready=nil
  bomb=nil
  pin=nil
  bomb_txt=nil
  purchase = nil
  menu=nil
  heart = nil
  pin = nil
  double=nil
  triple = nil
  clocktime=nil

  img=nil
  dimg=nil
  timg=nil
  simg=nil
  dictionary = nil
  learn = nil

  logo=nil
  txtlb = nil
  d_txtlb=nil
  t_txtlb=nil
  letterText = nil
  d_txtlb=nil
  t_txtlb=nil
  s_txtlb=nil
  dic_txt =nil
  
  val=nil
  d_val=nil
  t_val=nil

  d_txtlb=nil
  t_txtlb=nil
  s_txtlb=nil

  --non UI
  btxt =""
  score=""
  counter=1
  etime = 0
  Group=nil
  dGroup=nil
  tGroup=nil
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

function triple_slide()
  -- body
  timg = display.newImage("images/UI/assests/Triple_bubble.png")
  timg.width  = 48
  timg.height = 48
  
  t_letterText = display.newText( "C", 0,10, native.systemFontBold, 20 )
  t_letterText:setTextColor(0,0, 0)
  t_letterText.x = timg.x
  t_letterText.y = timg.y

  t_val = display.newText("3",10,10,native.systemFontBold,12)
  t_val:setTextColor(0,0,0)
  t_val.x = timg.x+10
  t_val.y = timg.y+8
  

  tGroup = display.newGroup()
  tGroup:insert(timg)
  tGroup:insert(t_letterText)
  tGroup:insert(t_val)

  tGroup.x=40
  tGroup.y=dGroup.y+50

  local trip_txt = "-The red bubble represents a \ntriple word score."
  t_txtlb = display.newText(trip_txt, display.contentWidth-135,tGroup.y, native.systemFontBold, 14)
end

function double_slide()
  dimg = display.newImage("images/UI/assests/Double_bubble.png")
  dimg.width  = 48
  dimg.height = 48  
 
  d_letterText = display.newText( "B", 0,10, native.systemFontBold, 20 )
  d_letterText:setTextColor(0,0, 0)
  d_letterText.x = dimg.x
  d_letterText.y = dimg.y

  d_val = display.newText("3",10,10,native.systemFontBold,12)
  d_val:setTextColor(0,0,0)
  d_val.x = dimg.x+10
  d_val.y = dimg.y+8

  dGroup = display.newGroup()
  dGroup:insert(dimg)
  dGroup:insert(d_letterText)
  dGroup:insert(d_val)

  dGroup.x=40
  dGroup.y=Group.y+70

  local dub_txt = "-The orange bubble represents a \ndouble word score.\n"
  d_txtlb = display.newText(dub_txt, display.contentWidth-130,dGroup.y, native.systemFontBold, 14 )
end

function reg_slide()
  img = display.newImage("images/UI/assests/Reg_bubble.png")
  img.width  = 48
  img.height = 48
  
  letterText = display.newText( "A", 0,10, native.systemFontBold, 20 )
  letterText:setTextColor(0,0, 0)
  letterText.x = img.x
  letterText.y = img.y

  val = display.newText("2",10,10,native.systemFontBold,12)
  val:setTextColor(0,0,0)
  val.x = img.x+10
  val.y = img.y+8

  Group = display.newGroup()
  Group:insert(img)
  Group:insert(letterText)
  Group:insert(val)

  Group.x=40
  Group.y=simg.y+100

  local reg_txt ="Each bubble contains a letter and \na score. You can spell a word\nby tapping "..
  "the bubble.The score is\ntallied by the number \nassociated with each letter.\n"
  txtlb = display.newText(reg_txt, display.contentWidth-135,Group.y, native.systemFontBold, 14)
end

function sun_slide()
  -- body
  simg = display.newImage("images/UI/Status-weather-clear-icon.png")
  simg.width = 128
  simg.Height = 128
  simg.x=40
  simg.y=logo.y+120
  s_letterText =  display.newText("Score\n"..
    "   17", 45,simg.y, native.systemFontBold, 17)
  s_letterText:setTextColor(0,0,0)

  local sun_info = "The sun contains the\n accumulated score for each\n word spelt correctly. "
  s_txtlb = display.newText(sun_info, display.contentWidth-135,simg.y, native.systemFontBold, 14)
end

function dict_info()
  -- body
  dictionary = display.newImageRect("images/UI/dictionary.png",96,96);
  dictionary.x=50
  dictionary.y=logo.y+230
  
  local txt = " Please visit our\n online dictionary to improve\n your vocabulary or to find\n scores for word.\n\n"..
  " To access our online\n dictionary now click the\n word button."
  dic_txt = display.newText(txt,display.contentWidth-135,dictionary.y,native.systemFontBold,14)

  learn = widget.newButton
  {
      left=display.contentWidth-140,
      top=dictionary.y+40,
      width=90,
      height=50,
      defaultFile="images/buttons/words_btn_unpress.png",
      overFile="images/buttons/words_btn_press.png",
      onEvent=toLearning
  }
end

function doCountdown()
  -- body
  if (counter>3) then
    counter=1
  end

  display.remove(img)
  display.remove(bomb_txt)
  btxt = ""
  
  if (etime==15000) then
    if(counter==1) then      
      sun_slide()
      reg_slide()
      double_slide()
      triple_slide()
    elseif(counter==2)then     
      dict_info()
    end
    --clocktime = timer.performWithDelay(etime,doCountdown,1)
  end
  
  counter=counter+1
end
 
function nextg(event)
   -- body
   storyboard.gotoScene("mainScene")
 end 

 function menug(event)
   -- body
   storyboard.gotoScene("MenuScene")
 end 

 function purg(event)
   -- body
   --storyboard.gotoScene("mainScene")
   print("to the purchase scene")
 end 

 function toLearning()
  system.openURL("http://www.bubletter.com/dictionary.php")
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