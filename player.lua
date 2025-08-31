BALL_X = 1
BALL_Y = 1

BALL_DX = 1
BALL_DY = 1

BALL_R = 2

function _init()
	cls()
end

function _update()
	BALL_X = BALL_X + BALL_DX
	BALL_Y = BALL_Y + BALL_DY
end

function _draw()
	cls()
	circfill(BALL_X, BALL_Y, BALL_R, 10)
end
