-- Defines the function to initialize and start the game
function update_start()
	-- Checks if the player has pressed the 'X' button (button 5)
	if btn(5) then
		-- If the button is pressed, start the game
		startgame()
	end
end

-- Draws the start screen graphics
function draw_start()
	-- Prints the game title and instructions to start the game
	print("pico-8 breakout!", 33, 60, 7)
	print("press ❎ to start", 30, 68, 11)
end

-- Defines the function to initialize and start the game
function startgame()
	-- Changes the game mode to "game"
	MODE = "game"
	-- Initializes the ball and paddle
	binit()
	pinit()
	LIVES = 3
	POINTS = 0
end
