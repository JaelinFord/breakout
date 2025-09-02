-- Initializes and updates the ball and paddle
function UPDATE_GAME()
	BUPDATE()
	PUPDATE()
end

-- Draws the main game graphics
function DRAW_GAME()
	-- Draws a solid-color background for the game
	cls(1)
	-- Draws the ball
	BDRAW()
	-- Draws the paddle
	PDRAW()

	rectfill(0, 0, 128, 7, 0)
	print("lives:" .. LIVES, 1, 1, 7)
	print("points:" .. POINTS, 40, 1, 7)
end
