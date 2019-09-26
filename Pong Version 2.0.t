setscreen ("graphics:1260;900,nobuttonbar")
%Bugs 
%A bug that we have come across during the making of our game is when a player either scores a goal or blocks a ball (depending on the game mode), the screen
%flashes for half a second. This is an unreproducable bug as we tried to recreate the situation where this bug occurred but sometimes the bug occurred
%and sometimes it did not. 

%All Variables
var BallMoveX : int := 630 %Centerizes ball on BallMoveX axis
var BallMoveY : int := 450 %Centerizes ball on BallMoveY axis
var LeftPaddleMove : int := 0  %Moves the left paddle
var RightPaddleMove : int := 0  %Moves the right paddle
var chars : array char of boolean %This is declaring that the arrow keys will function as the user input
var scoreleft : int := 0 %This is the score for left side of the screen (Player 1)
var scoreright : int := 0 %This is the score for right side of the screen (Player 2/Computer)
var directionx : int := 1 %Moves the ball when it hits something horizontal
var directiony : int := 0 %Moves the ball when it hits something vertically
var directionleftpaddle : string := "up" %This variable allows the left paddle to move by itself (Starts moving up)
var directionrightpaddle : string := "down" %This variable allows the right paddle to move by itself (Starts moving down)
var xIncrease : int   %This is for setting the first paddle and text to the far right and then decreasing the value of this variable to bring the objects onscreen
var xIncrease2 : int  %This is for setting the second paddle and text to the far right and then decreasing the value of this variable to bring the objects onscreen
var xIncrease3 : int %This is for setting the ball and text to the far right and then decreasing the value of this variable to bring the objects onscreen
var goalorblocktext : int %This allows the text (goal or block) to move
var colourforleftpaddle : int %This variable is here to get a colour from the user for the left paddle
var colourforrightpaddle : int %This variable is here to get a colour from the user for the right paddle and it is a string to check the number of digits; the number of digits
var colourforball : int %This variable is here to get a colour from the user for the ball and it is a string to check the number of digits; the number of digits will help determine

%-------------------------------------------------------------------
%Fonts
var font : int %This font is for smaller text such as instructions
font := Font.New ("comicsans:20")
var font1 : int %This font is for the scoreboard
font1 := Font.New ("comicsans:55")
var font2 : int %This font is for the title
font2 := Font.New ("Comicsans:120:bold,italic")
var font3 : int %This font is for larger words such as "Choose Your Colour"
font3 := Font.New ("Comicsans:35:bold,italic")
var font4 : int %This font is for subtitles such as "Player 1"
font4 := Font.New ("Comicsans:65:bold,italic")
var font5 : int %This font is for the "goal" and "block" text
font5 := Font.New ("Comicsans:130:bold,italic")
var font6 : int %This font is for the text "Player 1" and "Player 2" for the final scoreboard
font6 := Font.New ("Comicsans:90:bold,italic")
var font7 : int %This font is for the actual score for the final scoreboard
font7 := Font.New ("Comicsans:250:bold")
%-------------------------------------------------------------------

%==========================================================================================================================================
%Sounds
process goal %This process is for the "goal" sound
    Music.PlayFile ("Goal Sound.wav")
end goal
process block %This process is for the "block" sound
    Music.PlayFile ("Block Better.mp3")
end block
%==========================================================================================================================================
procedure UserVSUser %This procedure is for 2 players versing each other
    View.Set ("offscreenonly")
    %Setting certain values in order to begin the game
    BallMoveX := 630
    BallMoveY := 450
    LeftPaddleMove := 0
    RightPaddleMove := 0
    xIncrease := 700
    xIncrease2 := 700
    xIncrease3 := 700
    %-------------------------------------------------------------------------------------
    for i : 1 .. 140 %This is for moving the paddle and text from right to left until it reaches the center
	Draw.FillBox (0, 0, maxx, maxy, 7)       %tsets a black background
	%-----------------------------------------------------------------------------------
	Draw.FillBox (0, 60, 1260, 80, 0) %bottom
	Draw.FillBox (0, 820, 1260, 840, 0) %top                           %Borders for game
	%----------------------------------------------------------------------------------
	Font.Draw ("Esc = Exit During Gameplay", 460, 860, font, 0)
	Font.Draw ("Player 1", 475 + xIncrease, 725, font4, 0)
	Draw.FillBox (585 + xIncrease, 250, 665 + xIncrease, 680, 0)
	Font.Draw ("Choose Your Colour:", 400 + xIncrease, 200, font3, 0) %Moves text and player 1's paddle from far right to center
	Font.Draw ("Choose an integer between 0 to 99", 400, 20, font, 0)
	xIncrease := xIncrease - 5
	View.Update
	delay (5)
	cls
    end for
    loop
	%-----------------------------------------------------------------------------------
	Draw.FillBox (0, 0, maxx, maxy, 7)     %sets a black background
	%-----------------------------------------------------------------------------------
	Draw.FillBox (0, 60, 1260, 80, 0) %bottom
	Draw.FillBox (0, 820, 1260, 840, 0) %top                           %Borders for game
	%----------------------------------------------------------------------------------
	Font.Draw ("Esc = Exit During Gameplay", 460, 860, font, 0)
	Font.Draw ("Player 1", 475 + xIncrease, 725, font4, 0)
	Draw.FillBox (585 + xIncrease, 250, 665 + xIncrease, 680, 0)    %Now the text and paddle is at the centre (Redraws it)
	Font.Draw ("Choose Your Colour:", 400 + xIncrease, 200, font3, 0)
	Font.Draw ("Choose an integer between 0 to 99", 400, 20, font, 0)
	%----------------------------------------------------------------------------------
	View.Set ("nooffscreenonly")
	locate (47, 80)
	get colourforleftpaddle %Gets the colour for the left paddle (Player 1's)
	View.Set ("offscreenonly")
	exit when colourforleftpaddle >= 0 and colourforleftpaddle <= 99 and colourforleftpaddle not= 7 and colourforleftpaddle not= 16  %Checking to see the value of what the user puts

    end loop
    cls
    %-----------------------------------------------------------------------------------
    for i2 : 1 .. 180 %This is for moving the paddle and text from middle to out of screen (Moves left)
	Draw.FillBox (0, 0, maxx, maxy, 7)     %sets a black background
	%-----------------------------------------------------------------------------------
	Draw.FillBox (0, 60, 1260, 80, 0) %bottom
	Draw.FillBox (0, 820, 1260, 840, 0) %top                           %Borders for game
	%----------------------------------------------------------------------------------
	Font.Draw ("Esc = Exit During Gameplay", 460, 860, font, 0)
	Font.Draw ("Player 1", 475 + xIncrease, 725, font4, 0)
	Draw.FillBox (585 + xIncrease, 250, 665 + xIncrease, 680, colourforleftpaddle)
	Font.Draw ("Choose Your Colour:", 400 + xIncrease, 200, font3, 0)
	Font.Draw ("Choose an integer between 0 to 99", 400, 20, font, 0)
	Font.Draw (intstr (colourforleftpaddle), 585 + xIncrease, 115, font4, 0) %Moves text and player 1's paddle from center to far left
	xIncrease := xIncrease - 5
	View.Update
	delay (5)
	cls
    end for
    %----------------------------------------------------------------------------------
    for i3 : 1 .. 140 %This is for moving the paddle and text from right to left until it reaches the center
	Draw.FillBox (0, 0, maxx, maxy, 7)     %sets a black background
	%-----------------------------------------------------------------------------------
	Draw.FillBox (0, 60, 1260, 80, 0) %bottom
	Draw.FillBox (0, 820, 1260, 840, 0) %top                           %Borders for game
	%----------------------------------------------------------------------------------
	Font.Draw ("Esc = Exit During Gameplay", 460, 860, font, 0)
	Font.Draw ("Player 2", 475 + xIncrease2, 725, font4, 0)
	Draw.FillBox (585 + xIncrease2, 250, 665 + xIncrease2, 680, 0)              %Moves text and player 2's paddle from far right to center
	Font.Draw ("Choose Your Colour:", 400 + xIncrease2, 200, font3, 0)
	Font.Draw ("Choose an integer between 0 to 99", 400, 20, font, 0)
	xIncrease2 := xIncrease2 - 5
	View.Update
	delay (5)
	cls
    end for
    loop
	Draw.FillBox (0, 0, maxx, maxy, 7)     %sets a black background
	%-----------------------------------------------------------------------------------
	Draw.FillBox (0, 60, 1260, 80, 0) %bottom
	Draw.FillBox (0, 820, 1260, 840, 0) %top                           %Borders for game
	%----------------------------------------------------------------------------------
	Font.Draw ("Esc = Exit During Gameplay", 460, 860, font, 0)
	Font.Draw ("Player 2", 475 + xIncrease2, 725, font4, 0)
	Draw.FillBox (585 + xIncrease2, 250, 665 + xIncrease2, 680, 0)      %Now the text and paddle is at the centre (Redraws it)
	Font.Draw ("Choose Your Colour:", 400 + xIncrease2, 200, font3, 0)
	Font.Draw ("Choose an integer between 0 to 99", 400, 20, font, 0)
	%----------------------------------------------------------------------------------
	View.Set ("nooffscreenonly")
	locate (47, 80)
	get colourforrightpaddle
	View.Set ("offscreenonly")           %Gets the colour for the right paddle (Player 2's)
	exit when colourforrightpaddle >= 0 and colourforrightpaddle <= 99 and colourforrightpaddle not= 7 and colourforrightpaddle not= 16 %Checking to see the value of what the user puts
    end loop
    cls
    %-----------------------------------------------------------------------------------
    for i4 : 1 .. 180
	Draw.FillBox (0, 0, maxx, maxy, 7)     %sets a black background
	%-----------------------------------------------------------------------------------
	Draw.FillBox (0, 60, 1260, 80, 0) %bottom
	Draw.FillBox (0, 820, 1260, 840, 0) %top                           %Borders for game
	%----------------------------------------------------------------------------------
	Font.Draw ("Esc = Exit During Gameplay", 460, 860, font, 0)
	Font.Draw ("Player 2", 475 + xIncrease2, 725, font4, 0)
	Draw.FillBox (585 + xIncrease2, 250, 665 + xIncrease2, 680, colourforrightpaddle)
	Font.Draw ("Choose Your Colour:", 400 + xIncrease2, 200, font3, 0)                    %Moves text and player 2's paddle from center to far left
	Font.Draw ("Choose an integer between 0 to 99", 400, 20, font, 0)
	Font.Draw (intstr (colourforrightpaddle), 585 + xIncrease2, 115, font4, 0)
	xIncrease2 := xIncrease2 - 5
	View.Update
	delay (5)
	cls
    end for
    %----------------------------------------------------------------------------------
    for i5 : 1 .. 140
	Draw.FillBox (0, 0, maxx, maxy, 7)     %sets a black background
	%-----------------------------------------------------------------------------------
	Draw.FillBox (0, 60, 1260, 80, 0) %bottom
	Draw.FillBox (0, 820, 1260, 840, 0) %top                           %Borders for game
	%----------------------------------------------------------------------------------
	Font.Draw ("Esc = Exit During Gameplay", 460, 860, font, 0)
	Font.Draw ("Ball", 530 + xIncrease3, 725, font4, 0)
	Draw.FillOval (620 + xIncrease3, 475, 150, 150, 0)
	Font.Draw ("Choose Your Colour:", 390 + xIncrease3, 200, font3, 0)
	Font.Draw ("Choose an integer between 0 to 99", 400, 20, font, 0)
	xIncrease3 := xIncrease3 - 5                                        %Moves text and ball from far right to center
	View.Update
	delay (5)
	cls
    end for
    %------------------------------------------------------------------------------------------------------
    loop
	Draw.FillBox (0, 0, maxx, maxy, 7)     %sets a black background
	%-----------------------------------------------------------------------------------
	Draw.FillBox (0, 60, 1260, 80, 0) %bottom
	Draw.FillBox (0, 820, 1260, 840, 0) %top                           %Borders for game
	%----------------------------------------------------------------------------------
	Font.Draw ("Esc = Exit During Gameplay", 460, 860, font, 0)
	Font.Draw ("Ball", 530 + xIncrease3, 725, font4, 0)
	Draw.FillOval (620 + xIncrease3, 475, 150, 150, 0)      %Now the text and ball is at the centre (Redraws it)
	Font.Draw ("Choose Your Colour:", 390 + xIncrease3, 200, font3, 0)
	Font.Draw ("Choose an integer between 0 to 99", 400, 20, font, 0)
	%----------------------------------------------------------------------------------
	View.Set ("nooffscreenonly")
	locate (47, 80)
	get colourforball       %Gets the colour for the ball
	View.Set ("offscreenonly")
	exit when colourforball >= 0 and colourforball <= 99 and colourforball not= 7 and colourforball not= 16 %Checking to see the value of what the user puts
    end loop
    cls
    %-----------------------------------------------------------------------------------
    for i6 : 1 .. 180
	Draw.FillBox (0, 0, maxx, maxy, 7)     %sets a black background
	%-----------------------------------------------------------------------------------
	Draw.FillBox (0, 60, 1260, 80, 0) %bottom
	Draw.FillBox (0, 820, 1260, 840, 0) %top                           %Borders for game
	%----------------------------------------------------------------------------------
	Font.Draw ("Esc = Exit During Gameplay", 460, 860, font, 0)
	Font.Draw ("Ball", 530 + xIncrease3, 725, font4, 0)
	Draw.FillOval (620 + xIncrease3, 475, 150, 150, colourforball)
	Font.Draw ("Choose Your Colour:", 400 + xIncrease3, 200, font3, 0)                    %Moves text and ball from center to far left
	Font.Draw ("Choose an integer between 0 to 99", 400, 20, font, 0)
	Font.Draw (intstr (colourforball), 585 + xIncrease3, 115, font4, 0)
	xIncrease3 := xIncrease3 - 5
	View.Update
	delay (5)
	cls
    end for
    %--------------------------------------------------------------------------------------------------------
    loop
	BallMoveX := BallMoveX + directionx  %Changes the direction of ball when it hits the paddle
	BallMoveY := BallMoveY + directiony %Changes direction of teh paddle when it hits the top and bottom border
	%---------------------------------------------------------------------------------
	Draw.FillBox (0, 0, maxx, maxy, 7) %sets a black background
	%---------------------------------------------------------------------------------
	Font.Draw ("Instructions:", 560, 35, font, 0)
	Font.Draw ("Up: W", 0, 5, font, 0)
	Font.Draw ("<--- Player 1 --->", 125, 5, font, 0)
	Font.Draw ("Down: S", 400, 5, font, 0)
	Font.Draw ("Up Key ", 720, 5, font, 0)                     %Draws instuctions on the bottom
	Font.Draw ("<--- Player 2 --->", 862, 5, font, 0)
	Font.Draw ("Down Key", 1100, 5, font, 0)
	%----------------------------------------------------------------------------------
	Font.Draw (intstr (scoreleft), 300, 845, font1, 10)         %Draws left score on top left
	Font.Draw (intstr (scoreright), 900, 845, font1, 10)         %Draws right score on top right
	%-----------------------------------------------------------------------------------
	%-----------------------------------------------------------------------------------
	Draw.FillBox (0, 60, 1260, 80, 0) %Bottom
	Draw.FillBox (0, 820, 1260, 840, 0)
	Draw.FillBox (620, 900, 635, 835, 0)
	Draw.FillBox (620, 810, 635, 785, 0)
	Draw.FillBox (620, 775, 635, 750, 0)
	Draw.FillBox (620, 740, 635, 715, 0)
	Draw.FillBox (620, 705, 635, 680, 0)
	Draw.FillBox (620, 670, 635, 645, 0)
	Draw.FillBox (620, 635, 635, 610, 0)
	Draw.FillBox (620, 600, 635, 575, 0)
	Draw.FillBox (620, 565, 635, 540, 0)
	Draw.FillBox (620, 530, 635, 505, 0) %to           %Dotted lines in the middle
	Draw.FillBox (620, 495, 635, 470, 0)
	Draw.FillBox (620, 460, 635, 435, 0)
	Draw.FillBox (620, 425, 635, 400, 0)
	Draw.FillBox (620, 390, 635, 365, 0)
	Draw.FillBox (620, 355, 635, 330, 0)
	Draw.FillBox (620, 320, 635, 295, 0)
	Draw.FillBox (620, 285, 635, 260, 0)
	Draw.FillBox (620, 250, 635, 225, 0)
	Draw.FillBox (620, 215, 635, 190, 0)
	Draw.FillBox (620, 180, 635, 155, 0)
	Draw.FillBox (620, 145, 635, 120, 0)
	Draw.FillBox (620, 110, 635, 85, 0) %top
	%-----------------------------------------------------------------------------------
	Draw.FillBox (30, 90 + LeftPaddleMove, 40, 260 + LeftPaddleMove, colourforleftpaddle)      %Left Paddle colouring
	Draw.FillBox (1220, 90 + RightPaddleMove, 1230, 260 + RightPaddleMove, colourforrightpaddle)  %Right Paddle colouring
	%-----------------------------------------------------------------------------------
	Input.KeyDown (chars)
	if chars (KEY_UP_ARROW) then
	    RightPaddleMove := RightPaddleMove + 3 %Arrow up moves paddle up
	end if
	if chars (KEY_DOWN_ARROW) then                                               %Right Paddle Movement
	    RightPaddleMove := RightPaddleMove - 3 %Arrow down moves paddle  down
	end if
	%------------------------
	Input.KeyDown (chars)
	if chars ('w') then
	    LeftPaddleMove := LeftPaddleMove + 3 %W moves paddle up
	end if
	if chars ('s') then                                                           %Left Paddle Movement
	    LeftPaddleMove := LeftPaddleMove - 3 %S moves paddle down
	end if
	%-----------------------------------------------------------------------------------
	if LeftPaddleMove > 555 then %Stops left paddle from passing top border
	    LeftPaddleMove := 555
	end if
	if RightPaddleMove > 555 then %Stops right paddle from passing top border
	    RightPaddleMove := 555
	end if
	if LeftPaddleMove < -5 then %Stops left paddle from passing bottom border                                                %Paddle Boarder
	    LeftPaddleMove := -5
	end if
	if RightPaddleMove < -5 then %Stops right paddle from passing bottom border
	    RightPaddleMove := -5
	end if
	%-----------------------------------------------------------------------------------
	if BallMoveY > 810 then     %Restrics ball from passing upper border
	    BallMoveY := 810
	end if
	if BallMoveY < 90 then     %Restrics ball from passing lower border           %Ball Restrictions
	    BallMoveY := 90
	end if
	%-----------------------------------------------------------------------------------
	if BallMoveX > 1270 then %if the ball crosses the right side goal then
	    fork goal %Plays goal sound
	    View.Set ("offscreenonly")
	    goalorblocktext := 400
	    for i7 : 1 .. 350
		Draw.FillBox (0, 0, maxx, maxy, 7) %sets a black background
		%---------------------------------------------------------------------------------
		Font.Draw ("Instructions:", 560, 35, font, 0)
		Font.Draw ("Up: W", 0, 5, font, 0)
		Font.Draw ("<--- Player 1 --->", 125, 5, font, 0)
		Font.Draw ("Down: S", 400, 5, font, 0)
		Font.Draw ("Up Key ", 720, 5, font, 0)             %Draws instuctions on the bottom
		Font.Draw ("<--- Player 2 --->", 862, 5, font, 0)
		Font.Draw ("Down Key", 1100, 5, font, 0)
		%----------------------------------------------------------------------------------
		Font.Draw (intstr (scoreleft), 300, 845, font1, 10) %Draws left score on top left
		Font.Draw (intstr (scoreright), 900, 845, font1, 10) %Draws right score on top right
		%-----------------------------------------------------------------------------------
		Draw.FillBox (0, 60, 1260, 80, 0) %Bottom
		Draw.FillBox (0, 820, 1260, 840, 0)
		Draw.FillBox (620, 900, 635, 835, 0)
		Draw.FillBox (620, 810, 635, 785, 0)
		Draw.FillBox (620, 775, 635, 750, 0)
		Draw.FillBox (620, 740, 635, 715, 0)
		Draw.FillBox (620, 705, 635, 680, 0)
		Draw.FillBox (620, 670, 635, 645, 0)
		Draw.FillBox (620, 635, 635, 610, 0)
		Draw.FillBox (620, 600, 635, 575, 0)
		Draw.FillBox (620, 565, 635, 540, 0)
		Draw.FillBox (620, 530, 635, 505, 0) %to           %Dotted Lines In the middle
		Draw.FillBox (620, 495, 635, 470, 0)
		Draw.FillBox (620, 460, 635, 435, 0)
		Draw.FillBox (620, 425, 635, 400, 0)
		Draw.FillBox (620, 390, 635, 365, 0)
		Draw.FillBox (620, 355, 635, 330, 0)
		Draw.FillBox (620, 320, 635, 295, 0)
		Draw.FillBox (620, 285, 635, 260, 0)
		Draw.FillBox (620, 250, 635, 225, 0)
		Draw.FillBox (620, 215, 635, 190, 0)
		Draw.FillBox (620, 180, 635, 155, 0)
		Draw.FillBox (620, 145, 635, 120, 0)
		Draw.FillBox (620, 110, 635, 85, 0) %top
		%-----------------------------------------------------------------------------------
		Draw.FillBox (30, 90 + LeftPaddleMove, 40, 260 + LeftPaddleMove, colourforleftpaddle) %Left Paddle colouring
		Draw.FillBox (1220, 90 + RightPaddleMove, 1230, 260 + RightPaddleMove, colourforrightpaddle) %Right Paddle colouring
		%-----------------------------------------------------------------------------------
		Font.Draw ("GOAL!!!", 400 + goalorblocktext, 650, font5, colourforleftpaddle) %Prints goal on screen
		goalorblocktext := goalorblocktext - 5 %moves goal form on screen to off screen
		View.Update
		delay (10)
		cls
	    end for
	    %-----------------------------------------------
	    BallMoveX := 630
	    BallMoveY := 450
	    directionx := 1
	    directiony := 0   %resets variables
	    scoreleft := scoreleft + 1
	    %-----------------------------------------------
	end if
	if BallMoveX < -11 then     %if ball passes left side goal then
	    fork goal
	    View.Set ("offscreenonly")
	    goalorblocktext := -400
	    for i8 : 1 .. 350
		Draw.FillBox (0, 0, maxx, maxy, 7) %sets a black background
		%---------------------------------------------------------------------------------
		Font.Draw ("Instructions:", 560, 35, font, 0)
		Font.Draw ("Up: W", 0, 5, font, 0)
		Font.Draw ("<--- Player 1 --->", 125, 5, font, 0)
		Font.Draw ("Down: S", 400, 5, font, 0)
		Font.Draw ("Up Key ", 720, 5, font, 0)             %Draws instuctions on the bottom
		Font.Draw ("<--- Player 2 --->", 862, 5, font, 0)
		Font.Draw ("Down Key", 1100, 5, font, 0)
		%----------------------------------------------------------------------------------
		Font.Draw (intstr (scoreleft), 300, 845, font1, 10) %Draws left score on top left
		Font.Draw (intstr (scoreright), 900, 845, font1, 10) %Draws right score on top right
		%-----------------------------------------------------------------------------------
		Draw.FillBox (0, 60, 1260, 80, 0) %Bottom
		Draw.FillBox (0, 820, 1260, 840, 0)
		Draw.FillBox (620, 900, 635, 835, 0)
		Draw.FillBox (620, 810, 635, 785, 0)
		Draw.FillBox (620, 775, 635, 750, 0)
		Draw.FillBox (620, 740, 635, 715, 0)
		Draw.FillBox (620, 705, 635, 680, 0)
		Draw.FillBox (620, 670, 635, 645, 0)
		Draw.FillBox (620, 635, 635, 610, 0)
		Draw.FillBox (620, 600, 635, 575, 0)
		Draw.FillBox (620, 565, 635, 540, 0)
		Draw.FillBox (620, 530, 635, 505, 0) %to           %Dotted Lines In the middle
		Draw.FillBox (620, 495, 635, 470, 0)
		Draw.FillBox (620, 460, 635, 435, 0)
		Draw.FillBox (620, 425, 635, 400, 0)
		Draw.FillBox (620, 390, 635, 365, 0)
		Draw.FillBox (620, 355, 635, 330, 0)
		Draw.FillBox (620, 320, 635, 295, 0)
		Draw.FillBox (620, 285, 635, 260, 0)
		Draw.FillBox (620, 250, 635, 225, 0)
		Draw.FillBox (620, 215, 635, 190, 0)
		Draw.FillBox (620, 180, 635, 155, 0)
		Draw.FillBox (620, 145, 635, 120, 0)
		Draw.FillBox (620, 110, 635, 85, 0) %top
		%-----------------------------------------------------------------------------------
		Draw.FillBox (30, 90 + LeftPaddleMove, 40, 260 + LeftPaddleMove, colourforleftpaddle) %Left Paddle colouring
		Draw.FillBox (1220, 90 + RightPaddleMove, 1230, 260 + RightPaddleMove, colourforrightpaddle) %Right Paddle colouring
		%-----------------------------------------------------------------------------------
		Font.Draw ("GOAL!!!", 400 + goalorblocktext, 650, font5, colourforrightpaddle) %Prints goal on screen
		goalorblocktext := goalorblocktext + 5 %moves goal onscreen to offscreen
		View.Update
		delay (10)
		cls
	    end for
	    %----------------------------------------------------------------
	    BallMoveX := 630
	    BallMoveY := 450      %resets variables
	    directionx := -1
	    directiony := 0
	    scoreright := scoreright + 1
	    %----------------------------------------------------------------
	end if
	%-----------------------------------------------------------------------------------
	if BallMoveX > 1205 and BallMoveX < 1240 and BallMoveY >= 90 + RightPaddleMove and BallMoveY <= 124 + RightPaddleMove then
	    %If the ball hits top quadrent of right paddle ball direction of ball changes and steapness increases a lot
	    directionx := -3
	    directiony := 3
	end if
	if BallMoveX > 1205 and BallMoveX < 1240 and BallMoveY > 124 + RightPaddleMove and BallMoveY <= 158 + RightPaddleMove then
	    %If the ball hits top middle quadrent of right paddle ball direction of ball changes and steapness increases
	    directionx := -3
	    directiony := 2
	end if
	if BallMoveX > 1205 and BallMoveX < 1240 and BallMoveY > 158 + RightPaddleMove and BallMoveY <= 192 + RightPaddleMove then
	    %If the ball hits middle quadrent of right paddle ball direction of ball changes and steapness increases a little
	    directionx := -3
	    directiony := 1
	end if
	if BallMoveX > 1205 and BallMoveX < 1240 and BallMoveY > 192 + RightPaddleMove and BallMoveY <= 226 + RightPaddleMove then
	    %If the ball hits bottom middle quadrent of right paddle ball direction of ball changes and steapness increases
	    directionx := -3
	    directiony := -2
	end if
	if BallMoveX > 1205 and BallMoveX < 1240 and BallMoveY > 226 + RightPaddleMove and BallMoveY <= 260 + RightPaddleMove then
	    %If the ball hits bottom quadrent of right paddle ball direction of ball changes and steapness increases a lot
	    directionx := -3
	    directiony := -3
	end if
	if BallMoveX < 48 and BallMoveX > 38 and BallMoveY >= 90 + LeftPaddleMove and BallMoveY <= 124 + LeftPaddleMove then
	    %If the ball hits bottom quadrent of left paddle ball direction of ball changes and steapness increases a lot
	    directionx := 3
	    directiony := 3
	end if
	if BallMoveX < 48 and BallMoveX > 38 and BallMoveY > 124 + LeftPaddleMove and BallMoveY <= 158 + LeftPaddleMove then
	    %If the ball hits middle bottom quadrent of left paddle ball direction of ball changes and steapness increases
	    directionx := 3
	    directiony := 2
	end if
	if BallMoveX < 48 and BallMoveX > 38 and BallMoveY > 158 + LeftPaddleMove and BallMoveY <= 192 + LeftPaddleMove then
	    %If the ball hits middle quadrent of left paddle ball direction of ball changes and steapness increases a little
	    directionx := 3
	    directiony := -1
	end if
	if BallMoveX < 48 and BallMoveX > 38 and BallMoveY > 192 + LeftPaddleMove and BallMoveY <= 226 + LeftPaddleMove then
	    %If the ball hits middle top quadrent of left paddle ball direction of ball changes and steapness increases
	    directionx := 3
	    directiony := -2
	end if
	if BallMoveX < 48 and BallMoveX > 38 and BallMoveY > 226 + LeftPaddleMove and BallMoveY <= 260 + LeftPaddleMove then
	    %If the ball hits top quadrent of left paddle ball direction of ball changes and steapness increases a lot
	    directionx := 3
	    directiony := -3
	end if
	if BallMoveY = 810 then %If the ball hits the top border it bounces down
	    directiony := -1
	end if
	if BallMoveY = 90 then %If the ball hits the bottom border it bounces up
	    directiony := 1
	end if
	%-----------------------------------------------------------------------------------
	if scoreright = 7 then %If the player on the right wins (gets 7 points)
	    cls
	    BallMoveX := 1000 %Moves ball off screen
	    BallMoveY := 1000 %Moves ball off screen
	    for i1 : 1 .. 3 %Loops the colour changing 3 times
		for i9 : 31 .. 103 %Specific colours
		    Draw.FillBox (0, 0, maxx, maxy, 7) %sets a black background
		    Font.Draw ("Player 2 Wins", 50, 730, font5, i9) %Puts winner at the top while colour changing
		    Draw.FillBox (0, 650, 1260, 670, 0) %Draws borders
		    Draw.FillBox (0, 870, 1260, 890, 0) %Draws border
		    Draw.FillBox (620, 0, 635, 655, 0) %Draws border
		    Font.Draw (intstr (scoreleft), 225, 200, font7, colourforleftpaddle) %Puts left score on left
		    Font.Draw (intstr (scoreright), 875, 200, font7, colourforrightpaddle) %Puts right score on right
		    Font.Draw ("Player 2", 725, 550, font6, colourforrightpaddle) %Puts player 2 ontop of score
		    Font.Draw ("Player 1", 75, 550, font6, colourforleftpaddle) %Puts player 1 ontop of score
		    View.Update
		    delay (10)
		end for
	    end for
	    exit %Exits to menu once done
	end if

	if scoreleft = 7 then %If the player on the leftt wins (gets 7 points)
	    cls
	    BallMoveX := 1000 %Moves ball off screen
	    BallMoveY := 1000 %Moves ball off screen
	    for i10 : 1 .. 3 %Loops the colour changing 3 time
		for i11 : 31 .. 131 %Specific colours
		    Draw.FillBox (0, 0, maxx, maxy, 7) %sets a black background
		    Font.Draw ("Player 1 Wins", 50, 730, font5, i11) %Puts winner at the top while changing colour
		    Draw.FillBox (0, 650, 1260, 670, 0) %Draws border
		    Draw.FillBox (0, 870, 1260, 890, 0) %Draws border
		    Draw.FillBox (620, 0, 635, 655, 0) %Draws border
		    Font.Draw (intstr (scoreleft), 225, 200, font7, colourforleftpaddle) %Puts left score on left
		    Font.Draw (intstr (scoreright), 875, 200, font7, colourforrightpaddle) %Puts right score on right
		    Font.Draw ("Player 2", 725, 550, font6, colourforrightpaddle) %Puts player 2 ontop of score
		    Font.Draw ("Player 1", 75, 550, font6, colourforleftpaddle) %Puts player 1 ontop of score
		    View.Update
		    delay (10)
		end for
	    end for
	    exit %Exits to menu once done
	end if
	%-----------------------------------------------------------------------------------
	Draw.ThickLine (BallMoveX, BallMoveY, BallMoveX, BallMoveY, 20, colourforball) %The Ball
	View.Update
	cls
	if chars (KEY_ESC) then %If the exit key is pressed then it goes to the menu screen
	    exit
	end if
    end loop
    %-----------------------------------------------------------------------------------
    BallMoveX := 200 %Sets ball to the side
    BallMoveY := 700 %Sets ball to the side
    scoreleft := 0 %Resets score
    scoreright := 0 %Resets score
    LeftPaddleMove := 0 %Resets paddle
    RightPaddleMove := 0 %Resets paddle
end UserVSUser

%==========================================================================================================================================
procedure PracticeMode
    xIncrease := 700
    xIncrease2 := 700
    xIncrease3 := 700
    LeftPaddleMove := 0 %Resets paddle
    RightPaddleMove := 0 %Resets paddle
    %-------------------------------------------------------------------------------------
    for i : 1 .. 140 %This is for moving the paddle and text from right to left until it reaches the center
	Draw.FillBox (0, 0, maxx, maxy, 7)       %tsets a black background
	%-----------------------------------------------------------------------------------
	Draw.FillBox (0, 60, 1260, 80, 0) %bottom
	Draw.FillBox (0, 820, 1260, 840, 0) %top                           %Borders for game
	%----------------------------------------------------------------------------------
	Font.Draw ("Esc = Exit During Gameplay", 460, 860, font, 0)
	Font.Draw ("Player 1", 475 + xIncrease, 725, font4, 0)
	Draw.FillBox (585 + xIncrease, 250, 665 + xIncrease, 680, 0)
	Font.Draw ("Choose Your Colour:", 400 + xIncrease, 200, font3, 0) %Moves text and player 1's paddle from far right to center
	Font.Draw ("Choose an integer between 0 to 99", 400, 20, font, 0)
	xIncrease := xIncrease - 5
	View.Update
	delay (5)
	cls
    end for
    loop
	%-----------------------------------------------------------------------------------
	Draw.FillBox (0, 0, maxx, maxy, 7)     %sets a black background
	%-----------------------------------------------------------------------------------
	Draw.FillBox (0, 60, 1260, 80, 0) %bottom
	Draw.FillBox (0, 820, 1260, 840, 0) %top                           %Borders for game
	%----------------------------------------------------------------------------------
	Font.Draw ("Esc = Exit During Gameplay", 460, 860, font, 0)
	Font.Draw ("Player 1", 475 + xIncrease, 725, font4, 0)
	Draw.FillBox (585 + xIncrease, 250, 665 + xIncrease, 680, 0)    %Now the text and paddle is at the centre (Redraws it)
	Font.Draw ("Choose Your Colour:", 400 + xIncrease, 200, font3, 0)
	Font.Draw ("Choose an integer between 0 to 99", 400, 20, font, 0)
	%----------------------------------------------------------------------------------
	View.Set ("nooffscreenonly")
	locate (47, 80)
	get colourforleftpaddle %Gets the colour for the left paddle (Player 1's)
	View.Set ("offscreenonly")
	exit when colourforleftpaddle >= 0 and colourforleftpaddle <= 99 and colourforleftpaddle not= 7 and colourforleftpaddle not= 16  %Checking to see the value of what the user puts

    end loop
    cls
    %-----------------------------------------------------------------------------------
    for i2 : 1 .. 180 %This is for moving the paddle and text from middle to out of screen (Moves left)
	Draw.FillBox (0, 0, maxx, maxy, 7)     %sets a black background
	%-----------------------------------------------------------------------------------
	Draw.FillBox (0, 60, 1260, 80, 0) %bottom
	Draw.FillBox (0, 820, 1260, 840, 0) %top                           %Borders for game
	%----------------------------------------------------------------------------------
	Font.Draw ("Esc = Exit During Gameplay", 460, 860, font, 0)
	Font.Draw ("Player 1", 475 + xIncrease, 725, font4, 0)
	Draw.FillBox (585 + xIncrease, 250, 665 + xIncrease, 680, colourforleftpaddle)
	Font.Draw ("Choose Your Colour:", 400 + xIncrease, 200, font3, 0)
	Font.Draw ("Choose an integer between 0 to 99", 400, 20, font, 0)
	Font.Draw (intstr (colourforleftpaddle), 585 + xIncrease, 115, font4, 0) %Moves text and player 1's paddle from center to far left
	xIncrease := xIncrease - 5
	View.Update
	delay (5)
	cls
    end for
    %----------------------------------------------------------------------------------
    for i3 : 1 .. 140 %This is for moving the paddle and text from right to left until it reaches the center
	Draw.FillBox (0, 0, maxx, maxy, 7)     %sets a black background
	%-----------------------------------------------------------------------------------
	Draw.FillBox (0, 60, 1260, 80, 0) %bottom
	Draw.FillBox (0, 820, 1260, 840, 0) %top                           %Borders for game
	%----------------------------------------------------------------------------------
	Font.Draw ("Esc = Exit During Gameplay", 460, 860, font, 0)
	Font.Draw ("Computer", 435 + xIncrease2, 725, font4, 0)
	Draw.FillBox (585 + xIncrease2, 250, 665 + xIncrease2, 680, 0)              %Moves text and player 2's paddle from far right to center
	Font.Draw ("Choose Your Colour:", 400 + xIncrease2, 200, font3, 0)
	Font.Draw ("Choose an integer between 0 to 99", 400, 20, font, 0)
	xIncrease2 := xIncrease2 - 5
	View.Update
	delay (5)
	cls
    end for
    loop
	Draw.FillBox (0, 0, maxx, maxy, 7)     %sets a black background
	%-----------------------------------------------------------------------------------
	Draw.FillBox (0, 60, 1260, 80, 0) %bottom
	Draw.FillBox (0, 820, 1260, 840, 0) %top                           %Borders for game
	%----------------------------------------------------------------------------------
	Font.Draw ("Esc = Exit During Gameplay", 460, 860, font, 0)
	Font.Draw ("Computer", 435 + xIncrease2, 725, font4, 0)
	Draw.FillBox (585 + xIncrease2, 250, 665 + xIncrease2, 680, 0)      %Now the text and paddle is at the centre (Redraws it)
	Font.Draw ("Choose Your Colour:", 400 + xIncrease2, 200, font3, 0)
	Font.Draw ("Choose an integer between 0 to 99", 400, 20, font, 0)
	%----------------------------------------------------------------------------------
	View.Set ("nooffscreenonly")
	locate (47, 80)
	get colourforrightpaddle
	View.Set ("offscreenonly")           %Gets the colour for the right paddle (Player 2's)
	exit when colourforrightpaddle >= 0 and colourforrightpaddle <= 99 and colourforrightpaddle not= 7 and colourforrightpaddle not= 16 %Checking to see the value of what the user puts
    end loop
    cls
    %-----------------------------------------------------------------------------------
    for i4 : 1 .. 180
	Draw.FillBox (0, 0, maxx, maxy, 7)     %sets a black background
	%-----------------------------------------------------------------------------------
	Draw.FillBox (0, 60, 1260, 80, 0) %bottom
	Draw.FillBox (0, 820, 1260, 840, 0) %top                           %Borders for game
	%----------------------------------------------------------------------------------
	Font.Draw ("Esc = Exit During Gameplay", 460, 860, font, 0)
	Font.Draw ("Computer", 435 + xIncrease2, 725, font4, 0)
	Draw.FillBox (585 + xIncrease2, 250, 665 + xIncrease2, 680, colourforrightpaddle)
	Font.Draw ("Choose Your Colour:", 400 + xIncrease2, 200, font3, 0)                    %Moves text and player 2's paddle from center to far left
	Font.Draw ("Choose an integer between 0 to 99", 400, 20, font, 0)
	Font.Draw (intstr (colourforrightpaddle), 585 + xIncrease2, 115, font4, 0)
	xIncrease2 := xIncrease2 - 5
	View.Update
	delay (5)
	cls
    end for
    %----------------------------------------------------------------------------------
    for i5 : 1 .. 140
	Draw.FillBox (0, 0, maxx, maxy, 7)     %sets a black background
	%-----------------------------------------------------------------------------------
	Draw.FillBox (0, 60, 1260, 80, 0) %bottom
	Draw.FillBox (0, 820, 1260, 840, 0) %top                           %Borders for game
	%----------------------------------------------------------------------------------
	Font.Draw ("Esc = Exit During Gameplay", 460, 860, font, 0)
	Font.Draw ("Ball", 530 + xIncrease3, 725, font4, 0)
	Draw.FillOval (620 + xIncrease3, 475, 150, 150, 0)
	Font.Draw ("Choose Your Colour:", 390 + xIncrease3, 200, font3, 0)
	Font.Draw ("Choose an integer between 0 to 99", 400, 20, font, 0)
	xIncrease3 := xIncrease3 - 5                                        %Moves text and ball from far right to center
	View.Update
	delay (5)
	cls
    end for
    %------------------------------------------------------------------------------------------------------
    loop
	Draw.FillBox (0, 0, maxx, maxy, 7)     %sets a black background
	%-----------------------------------------------------------------------------------
	Draw.FillBox (0, 60, 1260, 80, 0) %bottom
	Draw.FillBox (0, 820, 1260, 840, 0) %top                           %Borders for game
	%----------------------------------------------------------------------------------
	Font.Draw ("Esc = Exit During Gameplay", 460, 860, font, 0)
	Font.Draw ("Ball", 530 + xIncrease3, 725, font4, 0)
	Draw.FillOval (620 + xIncrease3, 475, 150, 150, 0)      %Now the text and ball is at the centre (Redraws it)
	Font.Draw ("Choose Your Colour:", 390 + xIncrease3, 200, font3, 0)
	Font.Draw ("Choose an integer between 0 to 99", 400, 20, font, 0)
	%----------------------------------------------------------------------------------
	View.Set ("nooffscreenonly")
	locate (47, 80)
	get colourforball       %Gets the colour for the ball
	View.Set ("offscreenonly")
	exit when colourforball >= 0 and colourforball <= 99 and colourforball not= 7 and colourforball not= 16 %Checking to see the value of what the user puts
    end loop
    cls
    %-----------------------------------------------------------------------------------
    for i6 : 1 .. 180
	Draw.FillBox (0, 0, maxx, maxy, 7)     %sets a black background
	%-----------------------------------------------------------------------------------
	Draw.FillBox (0, 60, 1260, 80, 0) %bottom
	Draw.FillBox (0, 820, 1260, 840, 0) %top                           %Borders for game
	%----------------------------------------------------------------------------------
	Font.Draw ("Esc = Exit During Gameplay", 460, 860, font, 0)
	Font.Draw ("Ball", 530 + xIncrease3, 725, font4, 0)
	Draw.FillOval (620 + xIncrease3, 475, 150, 150, colourforball)
	Font.Draw ("Choose Your Colour:", 400 + xIncrease3, 200, font3, 0)                    %Moves text and ball from center to far left
	Font.Draw ("Choose an integer between 0 to 99", 400, 20, font, 0)
	Font.Draw (intstr (colourforball), 585 + xIncrease3, 115, font4, 0)
	xIncrease3 := xIncrease3 - 5
	View.Update
	delay (5)
	cls
    end for
    %----------------------------------------------------------------------------------
    loop
	BallMoveX := BallMoveX + directionx  %Changes the direction of ball when it hits the paddle
	BallMoveY := BallMoveY + directiony %Changes direction of teh paddle when it hits the top and bottom border
	%---------------------------------------------------------------------------------
	Draw.FillBox (0, 0, maxx, maxy, 7) %sets a black background
	%---------------------------------------------------------------------------------
	Font.Draw ("Instructions:", 560, 35, font, 0)
	Font.Draw ("Up: W", 0, 5, font, 0)
	Font.Draw ("<--- Player 1 --->", 125, 5, font, 0)
	Font.Draw ("Down: S", 400, 5, font, 0)                     %Draws instuctions on the bottom
	Font.Draw ("Computer", 905, 7, font, 0)
	%----------------------------------------------------------------------------------
	Font.Draw (intstr (scoreleft), 300, 845, font1, 10)         %Draws left score on top left
	Font.Draw (intstr (scoreright), 900, 845, font1, 10)         %Draws right score on top right
	%-----------------------------------------------------------------------------------
	Draw.FillBox (0, 60, 1260, 80, 0) %Bottom
	Draw.FillBox (0, 820, 1260, 840, 0)
	Draw.FillBox (620, 900, 635, 835, 0)
	Draw.FillBox (620, 810, 635, 785, 0)
	Draw.FillBox (620, 775, 635, 750, 0)
	Draw.FillBox (620, 740, 635, 715, 0)
	Draw.FillBox (620, 705, 635, 680, 0)
	Draw.FillBox (620, 670, 635, 645, 0)
	Draw.FillBox (620, 635, 635, 610, 0)
	Draw.FillBox (620, 600, 635, 575, 0)
	Draw.FillBox (620, 565, 635, 540, 0)
	Draw.FillBox (620, 530, 635, 505, 0) %to           %Dotted Lines In the middle
	Draw.FillBox (620, 495, 635, 470, 0)
	Draw.FillBox (620, 460, 635, 435, 0)
	Draw.FillBox (620, 425, 635, 400, 0)
	Draw.FillBox (620, 390, 635, 365, 0)
	Draw.FillBox (620, 355, 635, 330, 0)
	Draw.FillBox (620, 320, 635, 295, 0)
	Draw.FillBox (620, 285, 635, 260, 0)
	Draw.FillBox (620, 250, 635, 225, 0)
	Draw.FillBox (620, 215, 635, 190, 0)
	Draw.FillBox (620, 180, 635, 155, 0)
	Draw.FillBox (620, 145, 635, 120, 0)
	Draw.FillBox (620, 110, 635, 85, 0) %top
	%-----------------------------------------------------------------------------------
	Draw.FillBox (30, 90 + LeftPaddleMove, 40, 260 + LeftPaddleMove, colourforleftpaddle)      %Left Paddle colouring
	Draw.FillBox (1220, BallMoveY + 10, 1230, BallMoveY - 10, colourforrightpaddle) %Right Paddle colouring
	%-----------------------------------------------------------------------------------
	Input.KeyDown (chars)
	if chars ('w') then
	    LeftPaddleMove := LeftPaddleMove + 3 %W moves paddle up
	end if
	if chars ('s') then                                                           %Left Paddle Movement
	    LeftPaddleMove := LeftPaddleMove - 3 %S moves paddle down
	end if
	%-----------------------------------------------------------------------------------
	if LeftPaddleMove > 555 then %Stops left paddle from passing top border
	    LeftPaddleMove := 555
	end if
	if LeftPaddleMove < -5 then %Stops left paddle from passing bottom border       %Paddle Boarder
	    LeftPaddleMove := -5
	end if
	%-----------------------------------------------------------------------------------
	if BallMoveY > 810 then     %Restrics ball from passing upper border
	    BallMoveY := 810
	end if
	if BallMoveY < 90 then     %Restrics ball from passing lower border           %Ball Restrictions
	    BallMoveY := 90
	end if
	%-----------------------------------------------------------------------------------
	if BallMoveX < -11 then     %if ball passes left side goal then (Side Note Ball Will Never Pass Right Side so we didnt add an if BallMoveX > 1260
	    fork goal
	    View.Set ("offscreenonly")
	    goalorblocktext := -400
	    for i8 : 1 .. 350
		Draw.FillBox (0, 0, maxx, maxy, 7) %sets a black background
		%---------------------------------------------------------------------------------
		Font.Draw ("Instructions:", 560, 35, font, 0)
		Font.Draw ("Up: W", 0, 5, font, 0)
		Font.Draw ("<--- Player 1 --->", 125, 5, font, 0)
		Font.Draw ("Down: S", 400, 5, font, 0)            %Draws instuctions on the bottom
		Font.Draw ("Computer", 905, 7, font, 0)
		%----------------------------------------------------------------------------------
		Font.Draw (intstr (scoreleft), 300, 845, font1, 10) %Draws left score on top left
		Font.Draw (intstr (scoreright), 900, 845, font1, 10) %Draws right score on top right
		%-----------------------------------------------------------------------------------
		Draw.FillBox (0, 60, 1260, 80, 0) %Bottom
		Draw.FillBox (0, 820, 1260, 840, 0)
		Draw.FillBox (620, 900, 635, 835, 0)
		Draw.FillBox (620, 810, 635, 785, 0)
		Draw.FillBox (620, 775, 635, 750, 0)
		Draw.FillBox (620, 740, 635, 715, 0)
		Draw.FillBox (620, 705, 635, 680, 0)
		Draw.FillBox (620, 670, 635, 645, 0)
		Draw.FillBox (620, 635, 635, 610, 0)
		Draw.FillBox (620, 600, 635, 575, 0)
		Draw.FillBox (620, 565, 635, 540, 0)
		Draw.FillBox (620, 530, 635, 505, 0) %to           %Dotted Lines In the middle
		Draw.FillBox (620, 495, 635, 470, 0)
		Draw.FillBox (620, 460, 635, 435, 0)
		Draw.FillBox (620, 425, 635, 400, 0)
		Draw.FillBox (620, 390, 635, 365, 0)
		Draw.FillBox (620, 355, 635, 330, 0)
		Draw.FillBox (620, 320, 635, 295, 0)
		Draw.FillBox (620, 285, 635, 260, 0)
		Draw.FillBox (620, 250, 635, 225, 0)
		Draw.FillBox (620, 215, 635, 190, 0)
		Draw.FillBox (620, 180, 635, 155, 0)
		Draw.FillBox (620, 145, 635, 120, 0)
		Draw.FillBox (620, 110, 635, 85, 0) %top
		%-----------------------------------------------------------------------------------
		Draw.FillBox (30, 90 + LeftPaddleMove, 40, 260 + LeftPaddleMove, colourforleftpaddle) %Left Paddle colouring
		Draw.FillBox (1220, BallMoveY + 10, 1230, BallMoveY - 10, colourforrightpaddle) %Right Paddle colouring
		%-----------------------------------------------------------------------------------
		Font.Draw ("GOAL!!!", 400 + goalorblocktext, 650, font5, colourforrightpaddle) %Prints goal on screen
		goalorblocktext := goalorblocktext + 5 %moves goal onscreen to offscreen
		View.Update
		delay (10)
		cls
	    end for
	    %----------------------------------------------------------------
	    BallMoveX := 630
	    BallMoveY := 450      %resets variables
	    directionx := -1
	    directiony := 0
	    scoreright := scoreright + 1
	    %----------------------------------------------------------------
	end if
	%-----------------------------------------------------------------------------------
	if BallMoveX > 1205 and BallMoveX < 1240 then %If the ball touches the paddle the direction of the ball will change and it will go steap
	    directionx := -3
	    directiony := 3
	end if
	if BallMoveX < 48 and BallMoveX > 38 and BallMoveY >= 90 + LeftPaddleMove and BallMoveY <= 124 + LeftPaddleMove then
	    %If the ball hits bottom quadrent of left paddle ball direction of ball changes and steapness increases a lot
	    directionx := 3
	    directiony := 3
	end if
	if BallMoveX < 48 and BallMoveX > 38 and BallMoveY > 124 + LeftPaddleMove and BallMoveY <= 158 + LeftPaddleMove then
	    %If the ball hits middle bottom quadrent of left paddle ball direction of ball changes and steapness increases
	    directionx := 3
	    directiony := 2
	end if
	if BallMoveX < 48 and BallMoveX > 38 and BallMoveY > 158 + LeftPaddleMove and BallMoveY <= 192 + LeftPaddleMove then
	    %If the ball hits middle quadrent of left paddle ball direction of ball changes and steapness increases a little
	    directionx := 3
	    directiony := -1
	end if
	if BallMoveX < 48 and BallMoveX > 38 and BallMoveY > 192 + LeftPaddleMove and BallMoveY <= 226 + LeftPaddleMove then
	    %If the ball hits middle top quadrent of left paddle ball direction of ball changes and steapness increases
	    directionx := 3
	    directiony := -2
	end if
	if BallMoveX < 48 and BallMoveX > 38 and BallMoveY > 226 + LeftPaddleMove and BallMoveY <= 260 + LeftPaddleMove then
	    %If the ball hits top quadrent of left paddle ball direction of ball changes and steapness increases a lot
	    directionx := 3
	    directiony := -3
	end if
	if BallMoveY = 810 then %If the ball hits the top border it bounces down
	    directiony := -1
	end if
	if BallMoveY = 90 then %If the ball hits the bottom border it bounces up
	    directiony := 1
	end if
	%----------------------------------------------------------------------------------
	Draw.ThickLine (BallMoveX, BallMoveY, BallMoveX, BallMoveY, 20, colourforball)         %The Ball
	%----------------------------------------------------------------------------------
	if chars (KEY_ESC) then %If the esc key is pressed it will exit to the menu
	    exit
	end if
	View.Update
	cls
    end loop
    BallMoveX := 200 %Moves ball to the side
    BallMoveY := 700 %Moves ball to the side
    scoreleft := 0 %Resets score
    scoreright := 0 %Resets score
    LeftPaddleMove := 0 %Resets paddle
    RightPaddleMove := 0 %Resets paddle
end PracticeMode

%==========================================================================================================================================
procedure BallControl
    View.Set ("offscreenonly")
    cls
    %Setting certain values in order to begin the game
    scoreright := 0
    scoreleft := 0
    xIncrease3 := 700
    xIncrease2 := 700
    RightPaddleMove := 0
    BallMoveX := 200
    BallMoveY := 700
    %----------------------------------------------------------------------------------
    for i5 : 1 .. 140
	Draw.FillBox (0, 0, maxx, maxy, 7)     %sets a black background
	%-----------------------------------------------------------------------------------
	Draw.FillBox (0, 60, 1260, 80, 0)
	Draw.FillBox (0, 820, 1260, 840, 0)     %Borders for game
	%----------------------------------------------------------------------------------
	Font.Draw ("Esc = Exit During Gameplay", 460, 860, font, 0)
	Font.Draw ("Player 1", 475 + xIncrease3, 725, font4, 0)
	Draw.FillOval (620 + xIncrease3, 475, 150, 150, 0)
	Font.Draw ("Choose Your Colour:", 390 + xIncrease3, 200, font3, 0)
	Font.Draw ("Choose an integer between 0 to 99", 400, 20, font, 0)
	xIncrease3 := xIncrease3 - 5                                        %Moves text and ball from far right to center
	View.Update
	delay (5)
	cls
    end for
    %------------------------------------------------------------------------------------------------------
    loop
	Draw.FillBox (0, 0, maxx, maxy, 7)     %sets a black background
	%-----------------------------------------------------------------------------------
	Draw.FillBox (0, 60, 1260, 80, 0)
	Draw.FillBox (0, 820, 1260, 840, 0)     %Borders for game
	%----------------------------------------------------------------------------------
	Font.Draw ("Esc = Exit During Gameplay", 460, 860, font, 0)
	Font.Draw ("Player 1", 475 + xIncrease3, 725, font4, 0)
	Draw.FillOval (620 + xIncrease3, 475, 150, 150, 0)      %Now the text and ball is at the centre (Redraws it)
	Font.Draw ("Choose Your Colour:", 390 + xIncrease3, 200, font3, 0)
	Font.Draw ("Choose an integer between 0 to 99", 400, 20, font, 0)
	%----------------------------------------------------------------------------------
	View.Set ("nooffscreenonly")
	locate (47, 80)
	get colourforball                      %Gets the colour for the ball
	View.Set ("offscreenonly")
	exit when colourforball >= 0 and colourforball <= 99 and colourforball not= 7 and colourforball not= 16 %Checking to see the value of what the user puts
    end loop
    cls
    %-----------------------------------------------------------------------------------
    for i6 : 1 .. 180
	Draw.FillBox (0, 0, maxx, maxy, 7)     %sets a black background
	%-----------------------------------------------------------------------------------
	Draw.FillBox (0, 60, 1260, 80, 0)
	Draw.FillBox (0, 820, 1260, 840, 0)     %Borders for game
	%----------------------------------------------------------------------------------
	Font.Draw ("Esc = Exit During Gameplay", 460, 860, font, 0)
	Font.Draw ("Player 1", 475 + xIncrease3, 725, font4, 0)
	Draw.FillOval (620 + xIncrease3, 475, 150, 150, colourforball)
	Font.Draw ("Choose Your Colour:", 400 + xIncrease3, 200, font3, 0)
	Font.Draw ("Choose an integer between 0 to 99", 400, 20, font, 0)
	Font.Draw (intstr (colourforball), 585 + xIncrease3, 115, font4, 0)            %Moves text and ball from center to far left
	xIncrease3 := xIncrease3 - 5
	View.Update
	delay (5)
	cls
    end for
    %----------------------------------------------------------------------------------
    for i3 : 1 .. 140 %This is for moving the paddle and text from right to left until it reaches the center
	Draw.FillBox (0, 0, maxx, maxy, 7)     %sets a black background
	%-----------------------------------------------------------------------------------
	Draw.FillBox (0, 60, 1260, 80, 0)
	Draw.FillBox (0, 820, 1260, 840, 0)     %Borders for game
	%----------------------------------------------------------------------------------
	Font.Draw ("Esc = Exit During Gameplay", 460, 860, font, 0)
	Font.Draw ("Player 2", 475 + xIncrease2, 725, font4, 0)
	Draw.FillBox (585 + xIncrease2, 250, 665 + xIncrease2, 680, 0)              %Moves text and player 2's paddle from far right to center
	Font.Draw ("Choose Your Colour:", 400 + xIncrease2, 200, font3, 0)
	Font.Draw ("Choose an integer between 0 to 99", 400, 20, font, 0)
	xIncrease2 := xIncrease2 - 5
	View.Update
	delay (5)
	cls
    end for
    loop
	Draw.FillBox (0, 0, maxx, maxy, 7)     %sets a black background
	%-----------------------------------------------------------------------------------
	Draw.FillBox (0, 60, 1260, 80, 0)
	Draw.FillBox (0, 820, 1260, 840, 0)      %Borders for game
	%----------------------------------------------------------------------------------
	Font.Draw ("Esc = Exit During Gameplay", 460, 860, font, 0)
	Font.Draw ("Player 2", 475 + xIncrease2, 725, font4, 0)
	Draw.FillBox (585 + xIncrease2, 250, 665 + xIncrease2, 680, 0)      %Now the text and paddle is at the centre (Redraws it)
	Font.Draw ("Choose Your Colour:", 400 + xIncrease2, 200, font3, 0)
	Font.Draw ("Choose an integer between 0 to 99", 400, 20, font, 0)
	%----------------------------------------------------------------------------------
	View.Set ("nooffscreenonly")
	locate (47, 80)
	get colourforrightpaddle
	View.Set ("offscreenonly")           %Gets the colour for the right paddle (Player 2's)
	exit when colourforrightpaddle >= 0 and colourforrightpaddle <= 99 and colourforrightpaddle not= 7 and colourforrightpaddle not= 16  %Checking to see the value of what the user puts
    end loop
    cls
    %-----------------------------------------------------------------------------------
    for i4 : 1 .. 180
	Draw.FillBox (0, 0, maxx, maxy, 7)     %sets a black background
	%-----------------------------------------------------------------------------------
	Draw.FillBox (0, 60, 1260, 80, 0)
	Draw.FillBox (0, 820, 1260, 840, 0)     %Borders for game
	%----------------------------------------------------------------------------------
	Font.Draw ("Esc = Exit During Gameplay", 460, 860, font, 0)
	Font.Draw ("Player 2", 475 + xIncrease2, 725, font4, 0)
	Draw.FillBox (585 + xIncrease2, 250, 665 + xIncrease2, 680, colourforrightpaddle)
	Font.Draw ("Choose Your Colour:", 400 + xIncrease2, 200, font3, 0)                 %Moves text and player 2's paddle from center to far left
	Font.Draw ("Choose an integer between 0 to 99", 400, 20, font, 0)
	Font.Draw (intstr (colourforrightpaddle), 585 + xIncrease2, 115, font4, 0)
	xIncrease2 := xIncrease2 - 5
	View.Update
	delay (5)
	cls
    end for

    loop
	Draw.FillBox (0, 0, maxx, maxy, 7)         %sets a black background
	Draw.ThickLine (BallMoveX, BallMoveY, BallMoveX, BallMoveY, 20, colourforball)         %The Ball
	%-----------------------------------------------------------------------------------
	Draw.FillBox (0, 60, 1260, 80, 0)
	Draw.FillBox (0, 820, 1260, 840, 0)          %Borders for the game
	Draw.FillBox (620, 900, 635, 835, 0)
	%----------------------------------------------------------------------------------
	Font.Draw ("Instructions:", 560, 35, font, 0)
	Font.Draw ("W and S", 1, 5, font, 0)
	Font.Draw ("<--- Player 1 ---> ", 150, 5, font, 0)
	Font.Draw ("A and D", 400, 5, font, 0)
	Font.Draw ("Up Key ", 720, 5, font, 0)                                  %Draws instuctions on the bottom
	Font.Draw ("<--- Player 2 --->", 862, 5, font, 0)
	Font.Draw ("Down Key", 1100, 5, font, 0)
	%-----------------------------------------------------------------------------------
	Draw.FillBox (1220, 90 + RightPaddleMove, 1230, 260 + RightPaddleMove, colourforrightpaddle)         %Right Paddle colouring
	%-----------------------------------------------------------------------------------
	Input.KeyDown (chars)
	if chars (KEY_UP_ARROW) then
	    RightPaddleMove := RightPaddleMove + 3
	end if                                                                %Right Paddle Movement
	if chars (KEY_DOWN_ARROW) then
	    RightPaddleMove := RightPaddleMove - 3
	end if
	%----------------------------------------------------------------------------------
	Input.KeyDown (chars)
	if chars ('w') then
	    BallMoveY := BallMoveY + 1
	end if
	if chars ('a') then
	    BallMoveX := BallMoveX - 1                             %Ball controls
	end if
	if chars ('s') then
	    BallMoveY := BallMoveY - 1
	end if
	if chars ('d') then
	    BallMoveX := BallMoveX + 1
	end if
	%-----------------------------------------------------------------------------------
	if RightPaddleMove < -5 then
	    RightPaddleMove := -5
	end if
	if RightPaddleMove > 555 then             %Paddle Restrictions
	    RightPaddleMove := 555
	end if
	%-----------------------------------------------------------------------------------
	if BallMoveY > 810 then     %Restrics ball from passing upper line
	    BallMoveY := 810
	end if
	if BallMoveY < 90 then     %Restrics ball from passing lower line           %Ball Restrictions
	    BallMoveY := 90
	end if
	if BallMoveX < 10 then     %Restrics line from passing left side screen
	    BallMoveX := 10
	end if
	%-----------------------------------------------------------------------------------
	Font.Draw (intstr (scoreleft), 300, 845, font1, 10) %Draws left score on top left
	Font.Draw (intstr (scoreright), 900, 845, font1, 10) %Draws right score on top right
	%------------------------------------------------------------------------------------
	if BallMoveX > 1210 and BallMoveX < 1240 and BallMoveY > 90 + RightPaddleMove and BallMoveY < 260 + RightPaddleMove then %If the ball hits the paddle
	    fork block %Plays block sound
	    View.Set ("offscreenonly")
	    goalorblocktext := +400       %Sets text far right
	    for i5 : 1 .. 350
		Draw.FillBox (0, 0, maxx, maxy, 7)         %sets a black background
		Font.Draw ("Instructions:", 560, 35, font, 0)
		Font.Draw ("W and S", 1, 5, font, 0)
		Font.Draw ("<--- Player 1 ---> ", 150, 5, font, 0)
		Font.Draw ("A and D", 400, 5, font, 0)                     %Draws instuctions on the bottom
		Font.Draw ("Up Key ", 720, 5, font, 0)
		Font.Draw ("<--- Player 2 --->", 862, 5, font, 0)
		Font.Draw ("Down Key", 1100, 5, font, 0)
		Font.Draw (intstr (scoreleft), 300, 845, font1, 10) %Draws left score
		Font.Draw (intstr (scoreright), 900, 845, font1, 10) %Draws right score
		%-----------------------------------------------------------------------------------
		Draw.FillBox (0, 60, 1260, 80, 0)
		Draw.FillBox (0, 820, 1260, 840, 0)              %Borders for game
		Draw.FillBox (620, 900, 635, 835, 0)
		%-----------------------------------------------------------------------------------
		Draw.FillBox (1220, 90 + RightPaddleMove, 1230, 260 + RightPaddleMove, colourforrightpaddle)         %Right Paddle colouring
		%-----------------------------------------------------------------------------------
		Font.Draw ("BLOCK!!!", 400 + goalorblocktext, 650, font5, colourforrightpaddle) %Text for block
		goalorblocktext := goalorblocktext - 5
		View.Update
		delay (10)
		cls
	    end for
	    BallMoveX := BallMoveX - 900     %Sets ball back to original spot
	    scoreright := scoreright + 1                      %Ball Movement if touches paddle
	end if

	if scoreright = 7 then %if the right side has 7 points
	    cls
	    BallMoveX := 1000 %Sets ball offscreen
	    BallMoveY := 1000 %Sets ball offscreen
	    for i6 : 1 .. 3
		for i7 : 31 .. 103
		    Draw.FillBox (0, 0, maxx, maxy, 7) %sets a black background
		    Font.Draw ("Player 2 Wins", 50, 730, font5, i7)
		    %--------------------------------------------------------------------------------------
		    Draw.FillBox (0, 650, 1260, 670, 0)
		    Draw.FillBox (0, 870, 1260, 890, 0) %Borders
		    Draw.FillBox (620, 0, 635, 655, 0)
		    %--------------------------------------------------------------------------------------
		    Font.Draw (intstr (scoreleft), 225, 200, font7, colourforball) %Draws left score
		    Font.Draw (intstr (scoreright), 875, 200, font7, colourforrightpaddle)  %Draws right score
		    Font.Draw ("Player 2", 725, 550, font6, colourforrightpaddle) %Puts player 2 ontop of score
		    Font.Draw ("Player 1", 75, 550, font6, colourforball) %Puts player 1 ontop of score
		    View.Update
		    delay (10)
		end for
	    end for
	    exit
	end if
	%-----------------------------------------------------------------------------------
	if BallMoveX > 1260 then %If the ball gets a point
	    fork goal %Plays goal sound
	    View.Set ("offscreenonly")
	    goalorblocktext := +400
	    for i8 : 1 .. 350
		Draw.FillBox (0, 0, maxx, maxy, 7)         %sets a black background
		%-----------------------------------------------------------------------------------
		Font.Draw ("Instructions:", 560, 35, font, 0)
		Font.Draw ("W and S", 1, 5, font, 0)
		Font.Draw ("<--- Player 1 ---> ", 150, 5, font, 0) %Instructions for the bottom
		Font.Draw ("A and D", 400, 5, font, 0)
		Font.Draw ("Up Key ", 720, 5, font, 0)
		Font.Draw ("<--- Player 2 --->", 862, 5, font, 0)
		Font.Draw ("Down Key", 1100, 5, font, 0)
		%-----------------------------------------------------------------------------------
		Font.Draw (intstr (scoreleft), 300, 845, font1, 10) %Draws left score
		Font.Draw (intstr (scoreright), 900, 845, font1, 10) %Draws right score
		%-----------------------------------------------------------------------------------
		Draw.FillBox (0, 60, 1260, 80, 0)
		Draw.FillBox (0, 820, 1260, 840, 0) %Borders for game
		Draw.FillBox (620, 900, 635, 835, 0)
		%-----------------------------------------------------------------------------------
		Draw.FillBox (1220, 90 + RightPaddleMove, 1230, 260 + RightPaddleMove, colourforrightpaddle)         %Right Paddle colouring
		%-----------------------------------------------------------------------------------
		Font.Draw ("GOAL!!!", 400 + goalorblocktext, 650, font5, colourforball) %Draws text for goal
		goalorblocktext := goalorblocktext - 5
		View.Update
		delay (10)
		cls
	    end for
	    BallMoveX := 300 %Sets ball back to original spot
	    scoreleft := scoreleft + 1         %Score
	end if
	if scoreleft = 7 then
	    cls
	    BallMoveX := 1000 %Sets ball offscreen
	    BallMoveY := 1000 %Sets ball offscreen
	    for i9 : 1 .. 3
		for i10 : 31 .. 103
		    Draw.FillBox (0, 0, maxx, maxy, 7) %sets a black background
		    Font.Draw ("Player 1 Wins", 50, 730, font5, i10)
		    %-----------------------------------------------------------------------------------
		    Draw.FillBox (0, 650, 1260, 670, 0)
		    Draw.FillBox (0, 870, 1260, 890, 0)          %Borders for game
		    Draw.FillBox (620, 0, 635, 655, 0)
		    %-----------------------------------------------------------------------------------
		    Font.Draw (intstr (scoreleft), 225, 200, font7, colourforball) %Draws left score
		    Font.Draw (intstr (scoreright), 875, 200, font7, colourforrightpaddle) %Draws right score
		    %-----------------------------------------------------------------------------------
		    Font.Draw ("Player 2", 725, 550, font6, colourforrightpaddle) %Puts player 2 ontop of score
		    Font.Draw ("Player 1", 75, 550, font6, colourforball) %Puts player 1 ontop of score
		    View.Update
		    delay (10)
		end for
	    end for
	    exit
	end if
	%------------------------------------------------------------------------------------
	if chars (KEY_ESC) then  %If someone presses esc key, the game mode quits to menu
	    exit
	end if
	View.Update
	cls
    end loop
    %Sets to orginal values prior to the beginning of the game
    RightPaddleMove := 0
    LeftPaddleMove := 0
    BallMoveX := 200
    BallMoveY := 700
    scoreleft := 0
    scoreright := 0
end BallControl
%==========================================================================================================================================
procedure Physics
    var mypic : int := Pic.FileNew ("Physics.jpg")
    Draw.FillBox (0, 0, maxx, maxy, 7)         %sets a black background
    Pic.Draw (mypic, -30, 10, picMerge)
    Font.Draw ("To Exit Move Arrow Key", 510, 35, font, 0)
end Physics
%==========================================================================================================================================
%Menu
View.Set ("offscreenonly")
%Setting ball to a specific point everytime the menu opens
BallMoveX := 200
BallMoveY := 700

loop
    Draw.FillBox (0, 0, maxx, maxy, 7)         %sets a black background
    Draw.ThickLine (BallMoveX, BallMoveY, BallMoveX, BallMoveY, 20, 0)         %The Ball
    %-----------------------------------------------------------------------------------
    %Wordings in the menu
    Font.Draw ("Made by ~ Ahmed and Thanushon", 440, 860, font, 0)
    Font.Draw ("PONG", 400, 650, font2, 0)
    Font.Draw ("User VS User", 475, 540, font3, 0)
    Draw.Box (600, 460, 670, 510, 0)
    Font.Draw ("Practice Mode", 480, 400, font3, 0)
    Draw.Box (600, 320, 670, 370, 0)
    Font.Draw ("User VS User Ball", 435, 260, font3, 0)
    Draw.Box (600, 180, 670, 230, 0)
    Font.Draw ("?", 605, 95, font4, 0)
    Font.Draw ("Use Arrow Keys to move the ball to a box in order to play a specific game mode ", 130, 20, font, 0)
    %-----------------------------------------------------------------------------------
    Draw.FillBox (0, 60, 1260, 80, 0)
    Draw.FillBox (0, 820, 1260, 840, 0)   %Borders for game
    %----------------------------------------------------------------------------------
    Draw.FillBox (30, 90 + LeftPaddleMove, 40, 260 + LeftPaddleMove, 0)          %Left Paddle colouring
    Draw.FillBox (1220, 640 + RightPaddleMove, 1230, 810 + RightPaddleMove, 0)         %Right Paddle colouring
    %----------------------------------------------------------------------------------
    Input.KeyDown (chars)
    if chars (KEY_UP_ARROW) then
	BallMoveY := BallMoveY + 2
    end if
    if chars (KEY_LEFT_ARROW) then
	BallMoveX := BallMoveX - 2                                 %Ball controls
    end if
    if chars (KEY_DOWN_ARROW) then
	BallMoveY := BallMoveY - 2
    end if
    if chars (KEY_RIGHT_ARROW) then
	BallMoveX := BallMoveX + 2
    end if
    %-----------------------------------------------------------------------------------
    if BallMoveX > 600 and BallMoveX < 670 and BallMoveY > 460 and BallMoveY < 510 then
	UserVSUser
    elsif BallMoveX > 600 and BallMoveX < 670 and BallMoveY > 320 and BallMoveY < 370 then  %If the ball goes to a certain box, it will go to a specific game mode based on what box the ball when to
	PracticeMode
    elsif BallMoveX > 600 and BallMoveX < 670 and BallMoveY > 180 and BallMoveY < 230 then
	BallControl
    elsif BallMoveX > 630 and BallMoveX < 650 and BallMoveY > 110 and BallMoveY < 180 then
	Physics
    end if

    %-----------------------------------------------------------------------------------
    if BallMoveY > 810 then         %Restrics ball from passing upper line
	BallMoveY := 810
    end if
    if BallMoveY < 90 then         %Restrics ball from passing lower line           %Ball Restrictions
	BallMoveY := 90
    end if
    if BallMoveX < 10 then         %Restrics line from passing left side screen
	BallMoveX := 10
    end if
    if BallMoveX > 1250 then      %Restrics line from passing right side screen
	BallMoveX := 1250
    end if
    %-----------------------------------------------------------------------------------
    if directionleftpaddle = "up" and LeftPaddleMove = 555 then  %if the left paddle hits the top of the border it will then go down
	directionleftpaddle := "down"
    end if

    if directionleftpaddle = "down" and LeftPaddleMove = -8 then  %if the left paddle hits the bottom of the border it will then go up
	directionleftpaddle := "up"
    end if
    if directionleftpaddle = "up" then  %this variable is for if left paddle is going up
	LeftPaddleMove := LeftPaddleMove + 1 %Moves left paddle up
    end if

    if directionleftpaddle = "down" then  %this variable is for if left paddle is going down
	LeftPaddleMove := LeftPaddleMove - 1 %Moves left paddle down
    end if
    %--------------------------------------------------
    if directionrightpaddle = "down" and RightPaddleMove = -555 then  %if the right paddle hits the bottom of the border it will then go up
	directionrightpaddle := "up"
    end if

    if directionrightpaddle = "up" and RightPaddleMove = 8 then %if the right paddle hits the top of the border it will then go down
	directionrightpaddle := "down"
    end if
    if directionrightpaddle = "down" then %this variable is for if right paddle is going down
	RightPaddleMove := RightPaddleMove - 1 %Moves right paddle down
    end if

    if directionrightpaddle = "up" then %this variable is for if right paddle is going up
	RightPaddleMove := RightPaddleMove + 1 %Moves right paddle up
    end if
    View.Update
    cls
end loop
