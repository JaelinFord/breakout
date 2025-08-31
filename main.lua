BALL_X = 1
BALL_Y = 40
BALL_DX = 2
BALL_DY = 2
BALL_R = 2
BALL_DR = 0.5

PAD_X = 52
PAD_Y = 120
PAD_W = 24
PAD_H = 3

function _init()
	cls()
end

function _update()
	if btn(0) then
		PAD_X -= 5 -- Left
	end
	if btn(1) then
		PAD_X += 5 -- Right
	end

	BALL_X += BALL_DX
	BALL_Y += BALL_DY

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
	rectfill(PAD_X, PAD_Y, PAD_X + PAD_W, PAD_Y + PAD_H, 6)
end
