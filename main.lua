-- Runs at the start only
function _init()
	-- Clears the screen to a default color
	cls()
	-- Sets the initial mode of the game to "start"
	MODE = "start"
end

-- Updates game every frame (at 60 FPS)
function _update60()
	-- Checks the current game mode and calls the appropriate update function
	if MODE == "game" then
		-- Updates game logic
		UPDATE_GAME()
	elseif MODE == "start" then
		-- Updates logic for the start screen
		UPDATE_START()
	elseif MODE == "gameover" then
		-- Updates logic for the game over screen
		UPDATE_GAMEOVER()
	end
end

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
		SERVEBALL()
	end
end

function UPDATE_GAMEOVER()
	if btn(5) then
		STARTGAME()
	end
end

-- Initializes and updates the ball and paddle
function UPDATE_GAME()
	BUPDATE()
	PUPDATE()
end

-- Draws the current frame based on the game mode
function _draw()
	-- Checks the current game mode and calls the appropriate draw function
	if MODE == "game" then
		-- Draws all game elements
		DRAW_GAME()
	elseif MODE == "start" then
		-- Draws the start screen
		DRAW_START()
	elseif MODE == "gameover" then
		--Draws the game over screen
		DRAW_GAMEOVER()
	end
end

-- Draws the start screen graphics
function DRAW_START()
	-- Clears the screen
	cls()
	-- Prints the game title and instructions to start the game
	print("pico-8 breakout!", 36, 40, 7)
	print("press ❎ to start!", 32, 50, 11)
end

-- Draws the game over screen graphics
function DRAW_GAMEOVER()
	-- Prints the "game over" message and highscore
	print("game over!", 43, 40, 7)
	print("highscore: 1000", 34, 50, 7)
	print("press ❎ to restart", 26, 60, 6)
end

-- Draws the main game graphics
function DRAW_GAME()
	-- Draws a solid-color background for the game
	cls(1)
	-- Draws the ball
	BDRAW()
	-- Draws the paddle
	PDRAW()

	rectfill(0, 0, 128, 6, 0)
	print("lives:" .. LIVES, 1, 1, 7)
	print("points:" .. POINTS, 40, 1, 7)
end

-- ============================================================================================= --
function GAMEOVER()
	MODE = "gameover"
end
