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
		update_game()
	elseif MODE == "start" then
		update_start()
	elseif MODE == "gameover" then
		update_gameover()
	end
end

-- Draws the current frame based on the game mode
function _draw()
	-- Checks the current game mode and calls the appropriate draw function
	if MODE == "game" then
		draw_game()
	elseif MODE == "start" then
		draw_start()
	elseif MODE == "gameover" then
		draw_gameover()
	end
end
