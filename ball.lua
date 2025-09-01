function BINIT()
	BALL_X = 1
	BALL_Y = 40
	BALL_DX = 2
	BALL_DY = 2
	BALL_R = 2
	BALL_DR = 0.5
end

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

	PAD_C = 7
	-- Check if the ball collides with the pad
	if BALL_BOX(PAD_X, PAD_Y, PAD_W, PAD_H) then
		-- Deal with collision
		PAD_C = 8
	end
end

function BDRAW()
	circfill(BALL_X, BALL_Y, BALL_R, 10)
end

function BALL_BOX(BOX_X, BOX_Y, BOX_W, BOX_H)
	-- Checks for a collision of the ball with a rectangle
	if BALL_Y - BALL_R > BOX_Y + BOX_H then
		return false
	end
	if BALL_Y + BALL_R < BOX_Y then
		return false
	end
	if BALL_X - BALL_R > BOX_X + BOX_W then
		return false
	end
	if BALL_X + BALL_R < BOX_X then
		return false
	end
	return true
end
