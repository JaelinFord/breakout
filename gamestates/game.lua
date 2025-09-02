-- Initializes and updates the ball and paddle
function update_game()
	bupdate()
	pupdate()
end

-- Draws the main game graphics
function draw_game()
	-- Draws a solid-color background for the game
	cls(1)
	-- Draws the ball
	bdraw()
	-- Draws the paddle
	pdraw()

	rectfill(0, 0, 128, 7, 0)
	print("lives:" .. LIVES, 1, 1, 7)
	print("points:" .. POINTS, 40, 1, 7)
end
