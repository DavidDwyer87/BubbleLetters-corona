local wordScore = 0
local scoreNum = 0
local soundState = true
local public = {}
local word = ""
local current = 0
local allballs = {}
local startTimer = true



function setTopWordScore(score,tword)

	if (score>wordScore) then
		wordScore = score
		word = tword
	end	
	write_Settings()
end

function setScore(score)	
	if (score==nil) then
		score = 0
	end
	if (scoreNum==nil) then
		scoreNum=0
	end

	if (tonumber(score)>tonumber(scoreNum)) then
		scoreNum = score
		
	end

	current = score
	print(score.." "..scoreNum)
	write_Settings()
end

function getScore()
	
	return scoreNum
end

function getTopWordScore()
	
	return wordScore
end

function getTopWord()
	
	return word
end

function getCurrent()
	return current
end

function setSound(state)
	soundState =  state
	write_Settings()
end

function getSound()
	Read_Settings()
	return soundState
end

function Read_Settings()
  
  local path = system.pathForFile( "settings.txt", system.ResourceDirectory )
  local saveData = "topWordScore=\n"..
  					"topword=\n"..
                   "topScore=\n"..
                   "current=\n"..
                   "sound=true\n"
  if(path == nil)then
    local file = io.open( path, "w" )
    file:write( saveData )

	io.close( file )
	file = nil
  else
	local file = io.open( path, "r" )
	for line in file:lines() do

		--get top word score
		if(string.find(line,"topWordScore="))then
			if(line:sub(14)==nil)then
				wordScore = 0
			else
				wordScore = line:sub(14)
			end			 
		end

		if(string.find(line,"topword="))then
			if(line:sub(9)==nil)then
				word = ""
			else
				word = line:sub(9)
			end			 
		end

		if(string.find(line,"current="))then
			if(line:sub(9)==nil)then
				current=0
			else
				current=line:sub(9)
			end
		end

		if(string.find(line,"topScore="))then
			if(line:sub(10)==nil)then
				scoreNum=0
			else
				scoreNum=line:sub(10)
			end
		end

		--get sound state
	    if(line == "sound=true")then
	    	soundState = true
	    elseif(line == "sound=false")then
	    	soundState = false
    	end
	end

	io.close( file )
	file = nil
  end  
end

function write_Settings()
	local state = ""	
	if(soundState == true)then
		state = "true"
	else
		state = "false"
	end

	local path = system.pathForFile( "settings.txt", system.ResourceDirectory )

	local saveData = "topWordScore="..wordScore.."\n"..
					"topword="..word.."\n"..
                   "topScore="..scoreNum.."\n"..
                   "current="..current.."\n"..
                   "sound="..state

    local file = io.open( path, "w" )
    file:write( saveData )

	io.close( file )
	file = nil
end

function setBall(ball)
	--print("ball")
	table.insert( allballs, ball )
end

function getball()
	return allballs
end

function visual(show)
	
	for i=1,#allballs do
		allballs[i].isVisible = show
	end

	startTimer = show
end

function getVisual()
	return startTimer
end


Read_Settings()

public.setTopWordScore = setTopWordScore
public.getTopWordScore = getTopWordScore
public.getTopWord = getTopWord

public.setScore = setScore
public.getScore = getScore


public.getSound = getSound
public.setSound= setSound

public.getCurrent=getCurrent

public.getball = getball
public.setball = setBall

public.visual = visual
public.getvisual = getVisual


return public