local poggers = false
local swaying = false
local move = false
local funnyEffect = false

local swayingForce = 1;
local waitForBeat = false
local waitForTween = false

function setDefault(id)
	move = true
	swayingForce = 0
	_G['defaultStrum'..id..'X'] = getActorX(id)
	print('angle 0')
	setActorAngle(0,id)
end

function fadeOutAndGo() 
	move = false
    for i=0,3 do
		tweenFadeIn(i,0,0.6)
    end
	for i = 4, 7 do
		print('tween x ang')
		tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 275,getActorAngle(i) + 360, 0.6, 'setDefault')
	end
end

function fadeInAndGo()
	move = false
    for i=0,3 do
		tweenFadeIn(i,1,0.6)
    end
	for i = 4, 7 do
		tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 275, getActorAngle(i) - 360, 0.6, 'setDefault')
	end
	tweenFadeIn('girlfriend', 1, 0.6)
end

function resetTween()
	waitForTween = false
end

function update (elapsed) 

	if swaying and move then
		--print(currentBeat)
		local currentBeat = (swayingForce/1000)*(bpm/120)
		if curBeat % 4 == 0 and not waitForBeat and funnyEffect then
			waitForBeat = true
			waitForTween = true
			poggers = not poggers
			if poggers then
				tweenPosXAngle(0, getActorX(0) - 120 + 64 * math.sin(currentBeat * math.pi) ,360, 0.2, 'resetTween')
				tweenPosXAngle(1, getActorX(1) - 60 + 64 * math.sin(currentBeat * math.pi),360, 0.2)
				tweenPosXAngle(2, getActorX(2) + 60 + 64 * math.sin(currentBeat * math.pi),360, 0.2)
				tweenPosXAngle(3, getActorX(3) + 120 + 64 * math.sin(currentBeat * math.pi),360, 0.2)
	
				tweenPosXAngle(4, getActorX(4) - 120 + 64 * math.sin(currentBeat * math.pi),360, 0.2)
				tweenPosXAngle(5, getActorX(5) - 60 + 64 * math.sin(currentBeat * math.pi),360, 0.2)
				tweenPosXAngle(6, getActorX(6) + 60 + 64 * math.sin(currentBeat * math.pi),360, 0.2)
				tweenPosXAngle(7, getActorX(7) + 120 + 64 * math.sin(currentBeat * math.pi),360, 0.2)

				_G['defaultStrum0X'] = getActorX(0) - 120
				_G['defaultStrum1X'] = getActorX(1) - 60
				_G['defaultStrum2X'] = getActorX(2) + 60
				_G['defaultStrum3X'] = getActorX(3) + 120

				_G['defaultStrum4X'] = getActorX(4) - 120
				_G['defaultStrum5X'] = getActorX(5) - 60
				_G['defaultStrum6X'] = getActorX(6) + 60
				_G['defaultStrum7X'] = getActorX(7) + 120

			else
				tweenPosXAngle(0, getActorX(0) + 120 + 64 * math.sin(currentBeat * math.pi),0, 0.2, 'resetTween')
				tweenPosXAngle(1, getActorX(1) + 60 + 64 * math.sin(currentBeat * math.pi),0, 0.2)
				tweenPosXAngle(2, getActorX(2) - 60 + 64 * math.sin(currentBeat * math.pi),0, 0.2)
				tweenPosXAngle(3, getActorX(3) - 120 + 64 * math.sin(currentBeat * math.pi),0, 0.2)
	
				tweenPosXAngle(4, getActorX(4) + 120 + 64 * math.sin(currentBeat * math.pi),0, 0.2)
				tweenPosXAngle(5, getActorX(5) + 60 + 64 * math.sin(currentBeat * math.pi),0, 0.2)
				tweenPosXAngle(6, getActorX(6) - 60 + 64 * math.sin(currentBeat * math.pi),0, 0.2)
				tweenPosXAngle(7, getActorX(7) - 120 + 64 * math.sin(currentBeat * math.pi),0, 0.2)

				_G['defaultStrum0X'] = getActorX(0) + 120
				_G['defaultStrum1X'] = getActorX(1) + 60
				_G['defaultStrum2X'] = getActorX(2) - 60
				_G['defaultStrum3X'] = getActorX(3) - 120

				_G['defaultStrum4X'] = getActorX(4) + 120
				_G['defaultStrum5X'] = getActorX(5) + 60
				_G['defaultStrum6X'] = getActorX(6) - 60
				_G['defaultStrum7X'] = getActorX(7) - 120
			end
			
		elseif not waitForTween then
			swayingForce = swayingForce + 4;
			for i = 0, 7  do
				setActorX(_G['defaultStrum'..i..'X'] + 64 * math.sin(currentBeat * math.pi),i)
			end
		end
	end
end

function beatHit (beat)
	waitForBeat = false
end

function stepHit (step)
	if step == 1 then
        for i=0,7 do
			tweenFadeOut(i,0,0.6)
		end
    end
	if step == 59 then
        for i=0,7 do
			tweenFadeIn(i,1,0.6)
		end
	end
	if step == 129 then
        for i=0,7 do
			tweenFadeOut(i,0,0.6)
		end
    end
	if step == 188 then
        for i=0,7 do
			tweenFadeIn(i,1,0.6)
		end
	end
	if step == 258 then
        for i=0,7 do
			tweenFadeOut(i,0,0.6)
		end
    end
	if step == 315 then
        for i=0,7 do
			tweenFadeIn(i,1,0.6)
		end
	end
	if step == 386 then
        for i=0,7 do
			tweenFadeOut(i,0,0.6)
		end
    end
	if step == 442 then
        for i=0,7 do
			tweenFadeIn(i,1,0.6)
		end
	end
	if step == 512 then
        for i=0,7 do
			tweenFadeOut(i,0,0.6)
		end
    end
	if step == 537 then
        for i=0,7 do
			tweenFadeIn(i,1,0.6)
		end
	end
	if step == 576 then
        for i=0,7 do
			tweenFadeOut(i,0,0.6)
		end
    end
	if step == 602 then
        for i=0,7 do
			tweenFadeIn(i,1,0.6)
		end
	end
	if step == 640 then
        for i=0,7 do
			tweenFadeOut(i,0,0.6)
		end
    end
	if step == 665 then
        for i=0,7 do
			tweenFadeIn(i,1,0.6)
		end
	end	
	if step == 705 then
        for i=0,7 do
			tweenFadeOut(i,0,0.6)
		end
    end						
	--steps de dad son 1, 129 258 386 512 576 640 705
	--steps de bf son 64, 193 321 447 543 607 671

	if step == 10000 then
        fadeOutAndGo()
        swaying = true
    end
	if step == 10000 then
        fadeInAndGo()
    end
	if step == 10000 then
        fadeOutAndGo()
        funnyEffect = true
    end
	for i = 772, 832, 8 do
		if i < 827 then
			if step == i then
				pop()
			end
		end
	end
	for i = 836, 906, 8 do
		if i < 895 then
			if step == i then
				pop()
			end
		end
	end
	if step == 100000 then
		fadeInAndGo()
		funnyEffect = false
		swaying = false
	end
end	
print("mod chart here gaming\n")