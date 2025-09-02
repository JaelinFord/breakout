-- Defines the function to initialize and start the game
function UPDATE_START()
	-- Checks if the player has pressed the 'X' button (button 5)
	if btn(5) then
		-- If the button is pressed, start the game
		STARTGAME()
	end

	-- Defines the function to initialize and start the game
	function STARTGAME()
		-- Changes the game mode to "game"
		MODE = "game"
		-- Initializes the ball and paddle
		BINIT()
		PINIT()
		LIVES = 3
		POINTS = 0
	end
end

-- Draws the start screen graphics
function DRAW_START()
	-- Clears the screen
	cls()
	-- Prints the game title and instructions to start the game
	print("pico-8 breakout!", 33, 60, 7)
	print("press ❎ to start", 30, 68, 11)
end
