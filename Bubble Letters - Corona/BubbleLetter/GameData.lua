
local wordScore = 0
local scoreNum = 0
local soundState = true
local public = {}
local word = ""
local current = 0
local allballs = {}
local startTimer = true
local star = 2
local _score = 0
local musicState = true
local funtime = audio.loadStream("sounds/fun-time.mp3")


local path = system.pathForFile("settings.txt", system.DocumentsDirectory)


function setTopWordScore(score,tword)
	if (tonumber(score)>tonumber(wordScore)) then
		wordScore = score
		word = tword
	end
	write_Settings()
end

function setScore(score,rs,str)	
	if (score==nil) then
		score = 0
	end
	if (scoreNum==nil) then
		scoreNum=0
	end
	
	if (rs==nil) then
		_score=0
	else
		_score = tonumber(rs)
	end

	if (str==nil) then
		star=0
	else
		star=str	
	end

	if (tonumber(score)>tonumber(scoreNum)) then
		scoreNum = score		
	end
	
	current = score
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

function getStars()
	return star
end 

function getRscore()
	return _score
end

function setMusic(sta)
	musicState = sta

	--print(sta)
	if (musicState==true) then
		if(audio.isChannelPlaying(1) == false) then
			 audio.play(funtime,{channel=1,loops=-1,fadein=2000})
		end
	else
		audio.stop(1)
		
	end
	write_Settings()
end

function setSound(state)
	soundState =  state	 
	write_Settings()
end

function getSound()
	Read_Settings()	   
	return soundState
end

function getMusic()
	Read_Settings()
	return musicState
end

function Read_Settings()  
  
  local saveData = "topWordScore=\n"..
  					"topword=\n"..
                   "topScore=\n"..
                   "current=\n"..
                   "stars=\n"..
                   "score=\n"..
                   "music=true\n"..
                   "sound=true\n"

  -- io.open opens a file at path. returns nil if no file found
  local fileHandle, errorString = io.open( path, "r" )

  if fileHandle then  	
  	
	for line in fileHandle:lines() do

		--get top word score
		if(string.find(line,"topWordScore="))then
			if(line:sub(14)=="")then
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
			if(line:sub(10)=="")then
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

    	 if(line == "music=true")then
	    	musicState = true
	    elseif(line == "music=false")then
	    	musicState = false
    	end


    	if (string.find(line,"stars=")) then
    		if (line:sub(7)=="") then
    			star=2
    		else
    			star=line:sub(7)    			
    		end
    	end

    	if (string.find(line,"score=")) then
    		if (line:sub(7)=="") then
    			_score=0
    		else
    			_score=line:sub(7)    			
    		end
    	end
	end

	io.close( fileHandle )
	fileHandle = nil
  else
  	 local file = io.open( path, "w" )
    file:write( saveData )

	io.flush()
	io.close( file )

	file = nil
  end 

  if(musicState==true)then	
	if(audio.isChannelPlaying(1) == false) then
		 audio.play(funtime,{channel=1,loops=-1,fadein=2000})
	end
   end 
end

function write_Settings()
	local state = ""	
	local state2 = ""

	if (musicState == true) then
		state2 = "true"
	else
		state2 = "false"
	end
	print(state2)

	if(soundState == true)then
		state = "true"
	else
		state = "false"
	end

	local saveData = "topWordScore="..wordScore.."\n"..
					"topword="..word.."\n"..
                   "topScore="..scoreNum.."\n"..
                   "current="..current.."\n"..
                   "stars="..star.."\n"..
                   "score=".._score.."\n"..
                   "music="..state2.."\n"..
                   "sound="..state 
    --print(saveData)
    local file = io.open( path, "w" )
    file:write( saveData )

    io.flush()
	io.close( file )
	file = nil
end

function setBall(ball)
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

public.getstars = getStars
public.getrscore = getRscore

public.getMusic = getMusic
public.setMusic = setMusic


return public