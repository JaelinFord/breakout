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
