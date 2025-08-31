BALL_X = 1
BALL_Y = 40

BALL_DX = 2
BALL_DY = 2

BALL_R = 2

FRAME = 0

function _init()
	cls()
end

function _update()
	FRAME = FRAME + 1
	BALL_X = BALL_X + BALL_DX
	BALL_Y = BALL_Y + BALL_DY

	if BALL_R > 3 or BALL_R < 2 then
		BALL_DR = -BALL_DR
	end

	if BALL_X > 127 or BALL_X < 0 then
		BALL_DX = -BALL_DX
		sfx(0)
	end

	if BALL_Y > 127 or BALL_Y < 0 then
		BALL_DY = -BALL_DY
		sfx(0)
	end
end

function _draw()
	rectfill(0, 0, 127, 127, 1)
	circfill(BALL_X, BALL_Y, BALL_R, 10)
end
