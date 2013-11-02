centerX = display.contentCenterX
centerY = display.contentCenterY
screenLeft = display.screenOriginX
screenWidth = display.contentWidth - screenLeft * 2
screenRight = screenLeft + screenWidth
screenTop = display.screenOriginY
screenHeight = display.contentHeight - screenTop * 2
screenBottom = screenTop + screenHeight
display.contentWidth = screenWidth
display.contentHeight = screenHeight
screenTopSB = screenTop + display.topStatusBarContentHeight -- when status bar is showing
screenHeightSB = display.contentHeight - screenTopSB
screenBottomSB = screenTopSB + screenHeightSB
--
display.tl = display.TopLeftReferencePoint
display.tc = display.TopCenterReferencePoint
display.tr = display.TopRightReferencePoint
display.cl = display.CenterLeftReferencePoint
display.c  = display.CenterReferencePoint
display.cr = display.CenterRightReferencePoint
display.bl = display.BottomLeftReferencePoint
display.bc = display.BottomCenterReferencePoint
display.br = display.BottomRightReferencePoint

------------------------------ main game function for New Game ?    begining of game loop
function Game()

local widget = require( "widget" )
display.setStatusBar( display.HiddenStatusBar )

local diceSound = audio.loadSound("diceroll.wav")
local background = display.newImage( "images/iphone4-wallpaper7s.jpg" )

 myText = display.newText("hey hey", centerX, centerY+100, native.systemFont, 40)
  myText2 = display.newText("hey hey", centerX, centerY+50, native.systemFont, 25)
  
 local rollTime=135
local score= {0,0}
  local rollScore
local firstTimeScore=true
 local oneVale=0
 local   tempScore=0
 
----------------------------------- add 6 seperate dice
local dice = display.newImage( "" )
local dice2 = display.newImage( "" )
local dice3 = display.newImage( "" )
local dice4 = display.newImage( "" )
local dice5 = display.newImage( "" )
local dice6 = display.newImage( "" )
-------------------------------------- 6 seperate is playable's 
dice.isPlayable=true
dice2.isPlayable=true
dice3.isPlayable=true
dice4.isPlayable=true
dice5.isPlayable=true
dice6.isPlayable=true
------------------------------- 6 seperate is locked
dice.isLocked=false
dice2.isLocked=false
dice3.isLocked=false
dice4.isLocked=false
dice5.isLocked=false
dice6.isLocked=false



local function diceTouched( event )
	
	
	if event.phase=="ended" then
		
	if event.target.isPlayable==true then
	event.target.alpha=.5
        event.target.isPlayable=false

	elseif event.target.isPlayable==false then
	event.target.alpha=1
        event.target.isPlayable=true 
	end
	end
	
	
	print (event.target.idx)
	print (event.target.num)
	print (event.target.isPlayable)
	
end

----------------------------------- checkScore()
local function checkScore()
	print ("dice number")
	
	if firstTimeScore==true then
  oneVale=0
  tempScore=0
	end
	
	if dice.isPlayable==false and dice.isLocked==false then
		dice.isLocked=true
	print (dice.idx)
	print (dice.num)
	score[1]=dice.num
	if score[1]==1 then
		print ("oneVale equals")
		 oneVale=oneVale+1
		 print(oneVale)
	end
	dice.isPlayable=true
	end
	
	if dice2.isPlayable==false and dice2.isLocked==false then
		dice2.isLocked=true
	print (dice2.idx)
	print (dice2.num)
	score[2]=dice2.num
	if score[2]==1 then
		print ("oneVale equals")
		 oneVale=oneVale+1
		 tempScore=tempScore+score[2]
		 print(oneVale)
	end
	end
	
	
	for i = 1,2 do
		print ("score ZE "..i)
		print (score[i])
		local score=score[i]
		
		print (score)
		print (tempScore)
			 print(oneVale)

	


		end
 firstTimeScore=false		
				myText.text = "score "
end


---------------------------------- roll function
local function listener( event )
audio.play( diceSound )
------------- die1
if dice.isPlayable==true and dice.isLocked==false then
local function timerE(ev)
x=math.random(6)
dice:removeSelf()
dice = display.newImage( "images/Dice-"..x..".png" ) 
dice.x = 70 - math.random(30)
dice.y =50 +math.random(35)
dice:scale(.25,.25)
dice.rotation = math.random(360)
dice.idx="  die one"
dice.num=x 
dice.isPlayable=true
dice.isLocked=false
dice: addEventListener("touch", diceTouched)
checkScore()
end
timer.performWithDelay( rollTime, timerE, math.random(6,12) )
end

------------- die2
if dice2.isPlayable==true  and dice2.isLocked==false then
local function timerE(ev)
x=math.random(6)
dice2:removeSelf()
dice2 = display.newImage( "images/Dice-"..x..".png" ) 
dice2.x = 170 - math.random(50)
dice2.y =50 +math.random(35)
dice2:scale(.25,.25)
dice2.rotation = math.random(360)
dice2.idx="  die 2"
dice2.num=x 
dice2.isPlayable=true
dice2.isLocked=false
dice2: addEventListener("touch", diceTouched)
checkScore()
end
timer.performWithDelay( rollTime, timerE, math.random(6,12) )
end
 
------------- die3
if dice3.isPlayable==true then
local function timerE(ev)
x=math.random(6)
dice3:removeSelf()
dice3 = display.newImage( "images/Dice-"..x..".png" ) 
dice3.x = 270- math.random(50)
dice3.y =50 +math.random(45)
dice3:scale(.25,.25)
dice3.rotation = math.random(360)
dice3.idx="  die 3"
dice3.num=x 
dice3.isPlayable=true
dice3: addEventListener("touch", diceTouched)
print("Rolled"..x)
myText.text = "Rolled "..x
end
timer.performWithDelay( rollTime, timerE, math.random(7,12) )
end
 
------------- die4
if dice4.isPlayable==true then
local function timerE(ev)
x=math.random(6)
dice4:removeSelf()
dice4 = display.newImage( "images/Dice-"..x..".png" ) 
dice4.x = 275- math.random(50)
dice4.y =150 +math.random(45)
dice4:scale(.25,.25)
dice4.rotation = math.random(360)
dice4.idx="  die 4"
dice4.num=x 
dice4.isPlayable=true
dice4: addEventListener("touch", diceTouched)
print("Rolled"..x)
myText.text = "Rolled "..x
end
timer.performWithDelay( rollTime, timerE, math.random(8,13) )
end
------------- die5
if dice5.isPlayable==true then
local function timerE(ev)
x=math.random(6)
dice5:removeSelf()
dice5 = display.newImage( "images/Dice-"..x..".png" ) 
dice5.x = 170- math.random(50)
dice5.y =150 +math.random(45)
dice5:scale(.25,.25)
dice5.rotation = math.random(360)
dice5.idx="  die 5"
dice5.num=x 
dice5.isPlayable=true
dice5: addEventListener("touch", diceTouched)
print("Rolled"..x)
myText.text = "Rolled "..x
end
timer.performWithDelay( rollTime, timerE, math.random(6,12) )
end

------------- die6
if dice6.isPlayable==true then
local function timerE(ev)
x=math.random(6)
dice6:removeSelf()
dice6 = display.newImage( "images/Dice-"..x..".png" ) 
dice6.x = 70- math.random(30)
dice6.y =150 +math.random(45)
dice6:scale(.25,.25)
dice6.rotation = math.random(360)
dice6.idx="  die 6"
dice6.num=x 
dice6.isPlayable=true
dice6: addEventListener("touch", diceTouched)
print("Rolled"..x)


end
timer.performWithDelay( rollTime, timerE, math.random(6,13) )
end

----------------end of dice








myText2.text =("Rolling is")
end
----------------- end of listener function



---------------------------------------------- button 1 Roll 
local function onButtonEvent( event )
   local phase = event.phase
   local target = event.target
      if ( "began" == phase ) then
      print( target.id .. " pressed" )
      target:setLabel( "Yea Baby" )  --set a new label
   elseif ( "ended" == phase ) then
   rolling = true
   listener()
   checkScore()
      print( target.id .. " released" )
      target:setLabel( target.baseLabel )  --reset the label
   end
   return true
end
local myButton = widget.newButton
{
   left = centerX-30,
   top = centerY+150,
   label = "ROLL",
   labelAlign = "center",
   font = "Arial",
   fontSize = 18,
   labelColor = { default = {0,0,0}, over = {255,255,255} },
   onEvent = onButtonEvent
}
myButton.baseLabel = "ROLL"
myButton:scale (.7,.7)
------------------------------------------------------ button 2 new game


local function onButton2Event( event )
   local phase = event.phase
   local target = event.target
      if ( "began" == phase ) then
      print( target.id .. " pressed" )
      target:setLabel( "Yea Baby" )  --set a new label
   elseif ( "ended" == phase ) then
   rolling = true
   Game()
   
      print( target.id .. " released" )
      target:setLabel( target.baseLabel )  --reset the label
   end
   return true
end
local myButton = widget.newButton
{
   left = centerX-170,
   top = centerY+150,
   label = "New Game",
   labelAlign = "center",
   font = "Arial",
   fontSize = 18,
   labelColor = { default = {0,0,0}, over = {255,255,255} },
   onEvent = onButton2Event
}
myButton.baseLabel = "New Game"
myButton:scale (.7,.7)



---------------------------------------- end of game loop
return true
end
Game()


 


