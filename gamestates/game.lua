function game_init()
	LIVES = 3
	POINTS = 0
end

function game_update()
	bupdate()
	pupdate()
	brick_update()
end

function game_draw()
	cls(1)
	bdraw()
	pdraw()
	brick_draw()

	rectfill(0, 0, 128, 7, 0)
	print("lives:" .. LIVES, 1, 1, 7)
	print("points:" .. POINTS, 40, 1, 7)
end
