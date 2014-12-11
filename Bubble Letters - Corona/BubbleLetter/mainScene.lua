---------------------------------------------------------------------------------
-- SCENE NAME
-- Scene notes go here
---------------------------------------------------------------------------------
 
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

-- Clear previous scene
storyboard.removeAll()
 
-- local forward references should go here --
local widget = require("widget")
local physics = require("physics")
local tapfortap = require("plugin.tapfortap")
local gdata  = require("GameData")

physics.start(true)
physics.setGravity(0,9.8)
 
---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
 local goButton=nil
 local stopButton=nil
 local theWordText=nil
 

local alphabetArray = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", 
  "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"}

local scoreArray = {2, 3, 3, 6, 2, 5, 6, 4, 2, 8, 5, 1, 
3, 1, 2, 3, 10, 1, 1, 1, 2, 4, 5, 8, 4, 10}

local clockTimer=nil
local startCounter=false
local counter=0
local theWord=""
local choosenBalls={}
local allBalls={}
local movingTime = 3000
local dword=nil
local limit=60
local db = nil

--local path
local db 
local words1 = {}
local words2 = {}
--------------------------------------------------------------------------------
-- END
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--MAIN SCENE MENU BAR
--------------------------------------------------------------------------------
--UI
local sun=nil
local bar=nil
local targertscore=nil
local currentScore=nil
local scoreCtrl=nil
local bg = nil
local theWordText = nil
local stopButton = nil
local goButton = nil
local moves = nil
local groundLine = nil
local TargetCtrl = nil
local cheeseMoon = nil
local moon = nil
local topWScorelb = nil
local topword = nil
local twscorelb = nil
local topScore = nil
local bomb = nil
--local w1 = nil
local pause = nil
--local w2 = nil
local w3 = nil
local wone = nil
local groundLine = nil

local pop = audio.loadStream("sounds/pop.mp3")
local otherPop = audio.loadStream("sounds/Computer_Error.mp3")
local newScore = audio.loadStream("sounds/Tick Tock.mp3")
local violen = audio.loadStream("sounds/hipsbell.wav")
local dot=nil
local dotlb=nil
local star=nil
local stardotlb = nil
local starVal = nil
local bigStar = nil
local bigstarlb = nil
local smallstar = nil
local ss=nil

--varibles
local move=0
local scores=0
local target=0
local total = nil
local tscore = 0
local bool_tick = false
local soundState = gdata.getSound()
local wrong = 3
local restore = 0
local starCount = 0
local cdown=3
local hyper=false
local starRestore = 0

-----------------------------------------------------------------------------
--END
-----------------------------------------------------------------------------
 

 tapfortap.initialize("f1408a971d4af1550cd3d75bc50b26e6")
 tapfortap.removeAdView();

-- Called when the scene's view does not exist:
function scene:createScene( event )

  local group = self.view
   bg = display.newImageRect("images/UI/backgrounds/background4.png",display.contentWidth,display.contentHeight)
   bg.x= display.contentWidth/2
   bg.y=display.contentHeight/2   
   

   --textbox for displaying text
  theWordText = display.newText("",60,display.contentHeight-40,native.systemFontBold,25)
  --theWordText.text = ""
  --theWordText:setTextColor("#ffffff");

  --createLevels()
  setupbar()
  setupButtons()
  ground()

  startTimer(100,10)
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
  display.remove(sun)
  display.remove(bar)
  display.remove(targertscore)
  display.remove(currentScore)
  display.remove(scoreCtrl)
  display.remove(bg)
  display.remove(theWordText)
  display.remove(stopButton)
  display.remove(goButton)
  display.remove(moves)
  display.remove(groundLine)
  display.remove(TargetCtrl)
  display.remove(topWScorelb)
  display.remove(twscorelb)
  display.remove(topword)
  display.remove(topScore)
  display.remove(w1)
  display.remove(w2)
  display.remove(w3)
  display.remove(pause) 

  display.remove(dot)
  display.remove(dotlb)
  display.remove(star)
  display.remove(stardotlb)
  display.remove(starVal)
  display.remove(bigStar)
  display.remove(bigstarlb)
  display.remove(smallstar)

  --removeEventListener("Tap",CheckWord)
  --removeEventListener("Tap",backSpace)
  --removeEventListener("",fromString)

  --remove all bubble on screen
  for i=1,#gdata.getball() do
    display.remove(gdata.getball()[i])
  end
  --remove all buble in queue for word
  for j=1, #choosenBalls do
    display.remove(choosenBalls[j])
  end
end
 
-- Called AFTER scene has finished moving offscreen:
function scene:didExitScene( event )
  local group = self.view 
end
 
-- Called prior to the removal of scene's "view" (display view)
function scene:destroyScene( event )
  local group = self.view
  sun = nil
  bar = nil
  targertscore = nil
  currentScore = nil
  scoreCtrl = nil
  bg = nil
  theWordText = nil
  stopButton = nil
  goButton = nil
  moves = nil
  allBalls = nil
  cho = nil
  groundLine = nil
  TargetCtrl = nil
  bomb = nil
  topWScorelb = nil
  twscorelb = nil
  w1=nil
  w2=nil
  w3=nil
  pause=nil

  dot=nil
  dotlb=nil
  star=nil
  stardotlb=nil
  starVal=nil
  bigStar=nil
  bigstarlb=nil
  smallstar = nil
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

function setupButtons()

  -- body
  stopButton = widget.newButton
  {
      left=5,
      top=display.contentHeight-55,
      width=48,
      height=48,
      defaultFile="images/buttons/mainScene/Actions-dialog-close-icon.png",
      overFile="images/buttons/mainScene/Actions-dialog-close-icon.png",
      onRelease= backSpace
  }


  goButton = widget.newButton
  {
      left=display.contentWidth-50,
      top=display.contentHeight-55,
      width=48,
      height=48,
      defaultFile="images/buttons/mainScene/Accept-icon.png",
      overFile="images/buttons/mainScene/Accept-icon.png",
      onRelease= CheckWord
  }  
end

function setupbar()


  -- body  
  readTextFile()

  tapfortap.prepareInterstitial()

  bar = display.newImageRect('images/UI/bar.png',display.contentWidth,60)
  bar.x =200
  bar.y =30

  sun  = display.newImageRect("images/UI/Status-weather-clear-icon.png", 148,148)
  sun.x=25
  sun.y=30

  moves = display.newText("Score"..
    " ",30,20, native.systemFontBold, 17)
  moves:setTextColor(0,0,0)  

  topWScorelb = display.newImageRect("images/UI/panel.png",170,30)
  topWScorelb.x=display.contentWidth-105
  topWScorelb.y=40

  twscorelb = display.newImageRect("images/UI/panel2.png",190,30)
  twscorelb.x=display.contentWidth-95
  twscorelb.y=15

  w3 = display.newImageRect('images/UI/panelheart.png',69,30)
  w3.x = display.contentWidth - 34
  w3.y = topWScorelb.y+1

  
  scoreCtrl = display.newText(scores,30,40,native.systemFontBold,12)
  scoreCtrl:setTextColor( 0, 0, 0)  

  topword = display.newText(" - ",display.contentWidth-55,15,native.systemFontBold,12)

  tscore = 0
  topScore = display.newText(tscore,display.contentWidth-95,40,native.systemFontBold,12)

  --display tthe chances that play has left
  dotlb = display.newText("X"..wrong,display.contentWidth-20,topScore.y+1,native.systemFontBold,14)


   --the star is use to remove that the un-wanted letters
  star = widget.newButton
  {
      left=sun.x+55,
      top=sun.y-23,
      width=32,
      height=32,
      defaultFile='images/UI/star.png',
      overFile="images/UI/starRed.png",
      onRelease= hyperDrive
  }

  stardotlb =display.newImageRect('images/UI/greenDot.png',20,20)
  stardotlb.x=star.x+22
  stardotlb.y=star.y+14

  --load files from settings 
  starCount = gdata.getstars()

  --load get points for stars
  starRestore = gdata.getrscore()

  starVal = display.newText(starCount,stardotlb.x,stardotlb.y,native.systemFontBold,16)

  --[[w3 = display.newImageRect('images/UI/wrong.png',32,32)
  w3.x=topword.x-150
  w3.y=sun.y-10

  dot = display.newImageRect('images/UI/greenDot.png',20,20)
  dot.x = w3.x+23
  dot.y = w3.y+14
  
 ]]--
 
end

function ground()

  -- body
  groundLine = display.newRect(display.contentWidth/2,display.contentHeight-75,display.contentWidth, 1)
  local lineLeft = display.newRect(0,display.contentHeight-300,2,display.contentHeight)
  local lineRight = display.newRect(320,display.contentHeight-300,2,display.contentHeight)

    physics.addBody(groundLine, 'static',{bounce=0,friction=0})
    physics.addBody(lineLeft, 'static',{bounce=0,friction=0})
    physics.addBody(lineRight,'static',{bounce=0,friction=0})

    groundLine.isVisible = false;
    lineLeft.isVisible = false;
    lineRight.isVisible = false;
end

function CheckWord()


  --if text null on contain one letter
  if (string.len(theWord) <=1 or startCounter == nil) then
    backSpace('tap')
    theWord = ""
    theWordText.text = ""
    choosenBalls = {} 
    return      
  end 

   --set to low case 
  local lowerCaseWord = string.lower(theWord)

  --get the lenght of the letters
  local num = 0 
  num = string.len(lowerCaseWord) 

  -- check the tables if contain words
  if (table.indexOf(words1,lowerCaseWord)~=nil or table.indexOf(words2,lowerCaseWord) ~=nil) then
    local wordscore = 0 
    local double = false
    local triple = false
    local multiple = 1

   
    for i=1,num do

      --sum up word score
      wordscore = wordscore+choosenBalls[i].val

      --check if word contains a double score
      if (choosenBalls[i].bubtype =="double") then
        if (multiple==1) then
          multiple=2          
        end        
      end

      --check if word contain a triple letter score
      if (choosenBalls[i].bubtype =="triple") then
        multiple=3
      end
      --remove word from temp array
      display.remove(choosenBalls[i])
      table.remove(choosenBalls[i])
    end    
    
    --calcualte score 
    wordscore=(wordscore*multiple)

    --calculate the top score and word
    if (wordscore>tscore) then
      tscore = wordscore
      topScore.text = tscore

      topword.text = theWord  
      
      if(soundState)then
        audio.play(violen)
      end
    end

    --display word and score 
    dword = display.newText(string.upper(lowerCaseWord)
      .."  "..wordscore,display.contentWidth/2,100,native.systemFontBold,26)    

    --set word transition color
    if (multiple==2) then --set text color orange
      dword:setTextColor( 255, 165, 0)
    elseif(multiple==3)then -- set text color red 
      dword:setTextColor( 255, 0, 0)
    end

    --begin word tranition
    transition.to(dword, {time = 2000,alpha=0, y=50} )

     --adjust limit
    counter = counter-num
    
    --update score
    updatescore(wordscore)    

  else --if word doesnt not exit in tables that its not a word  
    if(soundState)then      
      audio.play(otherPop)
    end

    if(wrong>1)then
      dword = display.newText("Not a word",display.contentWidth/2,100,native.systemFontBold,26)
      transition.to(dword, {time = 2000,alpha=0, y=50} )
    end

    backSpace('tap')


    if (wrong == 1) then
      startCounter = nil
      display.remove(groundLine)
      wrong = wrong -1
      dotlb.text = wrong

    
      dword = display.newText("Game Over",display.contentWidth/2,100,native.systemFontBold,26)    
      transition.to(dword, {time = 5000,alpha=0, y=50,onComplete = removeWScore})    
    end 

    if (wrong == 2) then
      wrong = wrong -1      
      dotlb.text = wrong
    end

    if (wrong == 3) then
      wrong = wrong -1      
      dotlb.text = wrong
    end    
  end
  
  --reset varables
  if(theWordText~=nil)then
    theWord = ""
    theWordText.text = ""
    choosenBalls = {} 
  end
end

function backSpace(e)


  local length = table.maxn(choosenBalls) 

  if (length >0) then
    local word = "" 
    local letter = choosenBalls[length].letter


    if (e ~= 'tap') then
      for i=1,length-1 do
        word = word..choosenBalls[i].letter
      end

      theWord = word
    
      theWordText.text = word
      
      table.remove(choosenBalls,length)
      createBubble(letter)
      
    else      
      for i=1,string.len(theWord) do
        createBubble(choosenBalls[i].letter)
      end
    end
  end 
end

function createBubble(l)


  -- body
  local vowels = {"A","E","I","O","U"}

  local ballGroup = display.newGroup()
  local ball
  local ballRadius

  local letterIndex
  local letter 
  local val
  local cstar=false
  local bubtype = display.newText("reg", 0,10, native.systemFontBold, 1 )
  bubtype.x=0
  bubtype.y=0


  if (tonumber(starRestore)>1000) then  --give user a star
    cstar=true
    starRestore=starRestore-1000
    --print(starRestore)
  elseif (l=="") then
    local prob = math.random(3)

    if (prob ==3) then
      letterIndex = math.random(#vowels)
      letter = vowels[letterIndex]
      val = 2
    else
      letterIndex = math.random(#alphabetArray)
      letter = alphabetArray[letterIndex]     
      val = scoreArray[letterIndex]
    end
  else
    letter = l
    local index = table.indexOf( alphabetArray, l)
    val = scoreArray[index]

  end 

  local double = math.random(15)
  local triple = math.random(30)

  if(cstar==true)then
    ball = display.newImage("images/UI/assests/Reg_bubble.png")  
    bubtype.text="star"
  elseif (double==7) then
    ball = display.newImage("images/UI/assests/Double_bubble.png")
    bubtype.text="double"
  elseif(triple==30) then
    ball = display.newImage("images/UI/assests/Triple_bubble.png")   
    bubtype.text="triple"
  else
    ball = display.newImage("images/UI/assests/Reg_bubble.png")  
    bubtype.text="none" 
  end

  ball.width  = 48
  ball.height = 48
  ballRadius=23

  local letterText = nil
  if (cstar==true) then
    letterText = display.newImageRect("images/UI/star.png",32,32)
    letterText.x = ball.x
    letterText.y = ball.y
  else
    letterText = display.newText( letter, 0,10, native.systemFontBold, 20 )
    letterText:setTextColor(0,0, 0)
    letterText.x = ball.x
    letterText.y = ball.y

    val = display.newText(val,10,10,native.systemFontBold,12)
    val:setTextColor(0,0,0)
    val.x = ball.x+10
    val.y = ball.y+8
  end 
  
  
  ballGroup:insert(bubtype)
  ballGroup:insert(ball)
  ballGroup:insert(letterText)
  if (cstar==false) then
    ballGroup:insert(val)
  end
  
  
  ballGroup.x = math.random(ballRadius,320-ballRadius*2)
  ballGroup.y= -40

  if (gdata.getvisual() == true) then
    physics.addBody(ballGroup, 'dynamic',{friction = 0,bounce = 0,radius = ballRadius})

    ballGroup.name = "ball"
    ballGroup.letter = letter
    if (cstar==false) then
      ballGroup.val = val.text
    end
    
    ballGroup.bubtype = bubtype.text

    ballGroup:addEventListener('tap',formString)
    --table.insert( allBalls, ballGroup )  

    
  gdata.setball(ballGroup)
    
  end
end

function formString(e)

  local thisSprite = e.target
  local theLetter = thisSprite.letter



  if(thisSprite.bubtype =="star")then
    ss=thisSprite
    thisSpirite = nil
    starCount=starCount+1
    starVal.text = starCount
    transition.to( thisSprite, {time = 1000,alpha=0,x=w3.x-60,y=w3.y-16,onComplete=killStar} )    
  elseif(hyper==true)then    
    if (thisSprite.bubtype =="double") then
      local n = thisSprite.val*2
      updatescore(n)
    elseif (thisSprite.bubtype =="triple") then
      local n = thisSprite.val*3
      updatescore(n)
    else
      updatescore(thisSprite.val)
    end    

    --adjust limit
    counter = counter-1

    dword = display.newText(thisSprite.letter.."               "
      ..thisSprite.val,display.contentWidth/2,150,native.systemFontBold,26)
    --begin word tranition
    transition.to(dword, {time = 2000,alpha=0,y=50,onComplete=killStar})
  else
    theWord = theWord..theLetter
    theWordText.text = theWord
    theWordText.x = display.contentWidth/2  
    table.insert( choosenBalls, thisSprite)  
  end

  
  
  --print("sprite inserted into table")
  if (thisSprite.bubtype ~="star") then
    display.remove(thisSprite) 
  end  
  
  if(soundState)then
    audio.play(pop)
  end
 

  thisSpirite = nil
end

function killStar(event)
 display.remove(ss)
end

function startTimer(etime,gtimer)
  clockTimer = timer.performWithDelay(etime,doCountdown,gtimer)
end

function doCountdown()


  if (startCounter == false) then
    if (counter <9) then
      counter=counter+1
      createBubble('')
    else
      startCounter = true
      gdata.visual(true)
      startTimer(movingTime,1)
      counter = 10
    end
  else 
    if (startCounter==true) then
      --when bubble below the limit increment by one.
    if (counter<limit) then
        createBubble('')
         if (gdata.getvisual() == true) then
          counter = counter+1
         end

        startTimer(movingTime,1)        

    if (gdata.getvisual() == true) then
        --manage count down for star system
        if(hyper==true)then          
          cdown = cdown - 1
          bigstarlb.text = cdown
                    
           --star animation
          smallstar = display.newImageRect('images/UI/starWhite.png',32,32)

           local x = math.random(40,80)
            local y = math.random(10,30)
            local pos = math.random(1,3)

            if(pos==1)then
              smallstar.x = bigStar.x+x
            elseif(pos==2)then
              smallstar.x = bigStar.x-x
            else
              smallstar.x = bigStar.x
            end
            
            smallstar.y = 100+y

          transition.to(smallstar, {time = 500,alpha=0, y=50,onComplete=moreStars})
          
          --a star has died
          if(cdown<=0)then
            --remove graphics
            display.remove(bigstarlb)
            display.remove(bigStar)

            --reset count
            cdown = 3
            hyper=false
          end
        end

        if(counter == limit-15) then
          dword = display.newText("Running out of space\n for these bubbles",display.contentWidth/2,100,native.systemFontBold,26)    
          transition.to(dword, {time = 2000,alpha=0, y=50,onComplete = removeWScore})

          --[[if(soundState)then
            audio.play(newScore) 
          end]]--        
        end

        if(counter == limit-10) then
          dword = display.newText("Running out of space\n for these bubbles",display.contentWidth/2,100,native.systemFontBold,26)    
          transition.to(dword, {time = 2000,alpha=0, y=50,onComplete = removeWScore})

          --[[if(soundState)then
            audio.play(newScore)  
          end]]--        
        end

        if(counter == limit-5) then
          dword = display.newText("Running out of space\n for these bubbles",display.contentWidth/2,100,native.systemFontBold,26)    
          transition.to(dword, {time = 2000,alpha=0, y=50,onComplete = removeWScore})

          --[[if(soundState)then
            audio.play(newScore)  
          end]]--  
        end  
        if (counter ==limit) then          
          startCounter = nil
          display.remove(groundLine)
          dword = display.newText("Game Over",display.contentWidth/2,100,native.systemFontBold,26)    
          transition.to(dword, {time = 5000,alpha=0, y=50,onComplete = removeWScore} )             
        end 
      end    
    end    
  end 
  end  
end

function moreStars()

  if(hyper==true)then
    smallstar = display.newImageRect('images/UI/starWhite.png',32,32)

    local x = math.random(40,80)
    local y = math.random(10,30)
    local pos = math.random(1,3)

    if(pos==1)then
      smallstar.x = bigStar.x+x
    elseif(pos==2)then
      smallstar.x = bigStar.x-x
    else
      smallstar.x = bigStar.x
    end
    
    smallstar.y = 100+y

    transition.to(smallstar, {time = 500,alpha=0, y=50,onComplete=moreStars})
  end
end

function removeWScore() 

    --incomplete game
    if (counter>=limit or wrong ==0) then 
        print("push out")     
        gdata.setTopWordScore(topScore.text,topword.text)
        gdata.setScore(scoreCtrl.text,starRestore,starCount)

       if(math.random(2)==2)then
          tapfortap.showInterstitial()
       end 
           
       storyboard.gotoScene("End_Game")
    end   
end

function getScores()

  local data={scores,target}  

  return data
end

function updatescore(score)
  -- body
  scores = scores+score
  scoreCtrl.text = scores
  
  restore = restore + score
  starRestore = starRestore + score

  --keep a tally of the restore life
    if(restore >=500)then
      if(wrong==2)then
        --w3.isVisible = true
        wrong = wrong + 1
        dotlb.text = wrong
                
      elseif(wrong==1) then
        --w2.isVisible = true
        wrong = wrong + 1
        dotlb.text = wrong
      end
    end
end

function createLevels()
  --generate move
  move = math.random(7,32)
  --move = 2

  local easyOne = {7,9,11}
  local hardOne = {9,11,13}
  local easyTwo = {5,7,9}
  local hardTwo = {7,9,11}
  local easyThree = {3,5,7}
  local hardThree = {5,7,9}

  local difficulty = math.random(6)
  local num = easyTwo[math.random(1,3)]
  target = num
  print("Difficulty = "..difficulty)
  
  if (difficulty == 1) then
    for i=1,move do
      target=target+easyOne[math.random(3)]
    end
  end
  if (difficulty == 2) then
    for i=1,move do
      target=target+hardOne[math.random(3)]
    end
  end
  if (difficulty == 3) then
    for i=1,move do      
      target=target+easyTwo[math.random(3)]
    end
  end
  if (difficulty == 4) then
    for i=1,move do
      target=target+hardTwo[math.random(3)]
    end
  end
  if (difficulty == 5) then
    for i=1,move do
      target=target+easyThree[math.random(3)]
    end
  end
  if (difficulty == 6) then
    for i=1,move do
      target=target+hardThree[math.random(3)]
    end
  end  
end

function hyperDrive(event)
  if(hyper==false and tonumber(starCount)>0)then
    bigStar = display.newImageRect('images/UI/bigstar.png',96,96)
    bigStar.x=display.contentWidth/2
    bigStar.y=stardotlb.y+80  

    bigstarlb=display.newText(cdown,bigStar.x,bigStar.y,native.systemFontBold,32) 
    hyper=true
    starCount=starCount-1
    starVal.text = starCount
  elseif(starCount<=0)then
    dword = display.newText("Out of stars",display.contentWidth/2,100,native.systemFontBold,26)
    transition.to(dword, {time = 2000,alpha=0, y=50} )
  end
end

function readTextFile()


  local path = system.pathForFile( "wordlist.txt",system.ResourceDirectory)

  local file = io.open( path, "r" )  
  local x = 1
  for line in file:lines() do
     line = string.sub(line,1, #line);
     
     if (x<=42000) then
        table.insert(words1,line)      
     else
        table.insert(words2,line)
     end

     x=x+1
  end

  io.close( file )
  file = nil
  --print(""..#words1.."+"..#words2 )
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