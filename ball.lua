BALL_X = 1
BALL_Y = 40
BALL_DX = 2
BALL_DY = 2
BALL_R = 2
BALL_DR = 0.5

function BINIT() end

function BUPDATE()
	-- Make ball bouce when it hits edge of screen
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

function BDRAW()
	circfill(BALL_X, BALL_Y, BALL_R, 10)
end
