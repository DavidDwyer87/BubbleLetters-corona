
local move=0
local moves
local scores
local TargetCtrl
local target
local bar
local bomb
local pin
local targertscore
local groundLine
local currentScore
local moveGroup
local sun
local statgroup


function createLevels()
	--generate move	
	move = math.random(7,32)
	

	local easyOne = {7,9,11}
	local hardOne = {9,11,13}
	local easyTwo = {5,7,9}
	local hardTwo = {7,9,11}
	local easyThree = {3,5,7}
	local hardThree = {5,7,9}

	local difficulty = 1--math.random(6)
	local num = easyTwo[math.random(1,3)]
	target = num
	--print(difficulty)
	
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
			--print(easyTwo[math.random(1,3)])
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

function init()
	-- body
	 target =0
	 scores=0
	 createLevels()
	 print("num "..move)

	--move =2
	  bar = display.newImageRect('images/UI/bar.png',display.contentWidth,55)
	  bar.x =200
	  bar.y =25

	  sun  = display.newImageRect("images/UI/Status-weather-clear-icon.png", 148,148)
	  sun.x=25
	  sun.y=30

	  moves = display.newText("Moves\n"..
	    "    "..move,34,30, native.systemFontBold, 17)
	  moves:setTextColor(0,0,0)

	  targertscore = display.newText("Target Score",display.contentWidth-90,35,native.systemFontBold,13)
	  targertscore:setTextColor( 0, 0, 0)
	  

	  groundLine = display.newRect(260, 25,140, 2);

	  currentScore = display.newText("Current Score",display.contentWidth-88,15,native.systemFontBold,13)
	  currentScore:setTextColor( 0, 0, 0)

	  scoreCtrl = display.newText(scores,display.contentWidth-30,15,native.systemFontBold,13)
	  scoreCtrl:setTextColor( 0, 0, 0)

	  TargetCtrl = display.newText(target,display.contentWidth-30,35,native.systemFontBold,13)
	  TargetCtrl:setTextColor( 0, 0, 0)

	  bomb = display.newImageRect("images/UI/assests/bomb.png",40,40)
	  bomb.x = 120
	  bomb.y = 25

	  pin = display.newImageRect('images/UI/assests/pin.png',40,40)
	  pin.x = 160
	  pin.y = 25 
end


function  updateMoves()
	-- body
	move = move-1
	moves.text = "Moves\n"..""..move	
	return move
end

function getScores()
	local data={scores,target}	

	return data
end

function updatescore(score)
	-- body
	scores = scores+score
	scoreCtrl.text = scores
end

function remove()
	-- body
	display.remove(bar)
	display.remove(bomb)
	display.remove(sun)
	display.remove(pin)
	display.remove(groundLine)
	display.remove(moveGroup)
	display.remove(TargetCtrl)
	display.remove(moves)
	display.remove(scoreCtrl)
	display.remove(currentScore)
	display.remove(targertscore)
end




local public = {}

public.init = init
public.updateMoves = updateMoves
public.updatescore = updatescore
public.remove = remove
public.getScores = getScores

return public

