function brick_init()
	BRICK_X = 60
	BRICK_Y = 20
	BRICK_W = 10
	BRICK_H = 4
	BRICK_C = 14
	BRICK_V = true
end

function brick_update()
	local nextx, nexty

	nextx = BALL_X + BALL_DX
	nexty = BALL_Y + BALL_DY

	if BRICK_V and ball_box(nextx, nexty, BRICK_X, BRICK_Y, BRICK_W, BRICK_H) then
		if deflx_ballbox(BALL_X, BALL_Y, BALL_DX, BALL_DY, BRICK_X, BRICK_Y, BRICK_W, BRICK_H) then
			BALL_DX = -BALL_DX
		else
			BALL_DY = -BALL_DY
		end
		sfx(3)
		BRICK_V = false
		POINTS += 100
	end
end

function brick_draw()
	if BRICK_V then
		rectfill(BRICK_X, BRICK_Y, BRICK_X + BRICK_W, BRICK_Y + BRICK_H, BRICK_C)
	end
end
