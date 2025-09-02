function BINIT()
	BALL_X = 1
	BALL_Y = 40
	BALL_DX = 1.3
	BALL_DY = 1.3
	BALL_R = 2
	BALL_DR = 0.5
end

function BUPDATE()
	local nextx, nexty

	nextx = BALL_X + BALL_DX
	nexty = BALL_Y + BALL_DY

	-- Make ball bouce when it hits edge of screen
	if nextx > 127 or nextx < 0 then
		nextx = mid(0, nextx, 127)
		BALL_DX = -BALL_DX
		sfx(0)
	end
	if nexty > 127 or nexty < 0 then
		nexty = mid(0, nexty, 127)
		BALL_DY = -BALL_DY
		sfx(0)
	end

	-- Check if the ball collides with the pad
	if BALL_BOX(nextx, nexty, PAD_X, PAD_Y, PAD_W, PAD_H) then
		-- Deal with collision
		-- Find out direction to deflect
		if deflx_ballbox(BALL_X, BALL_Y, BALL_DX, BALL_DY, PAD_X, PAD_Y, PAD_W, PAD_H) then
			BALL_DX = -BALL_DX
		else
			BALL_DY = -BALL_DY
		end
		sfx(1)
	end

	BALL_X = nextx
	BALL_Y = nexty
end

function BDRAW()
	circfill(BALL_X, BALL_Y, BALL_R, 10)
end

-- ============================================================================================= --

function BALL_BOX(bx, by, BOX_X, BOX_Y, BOX_W, BOX_H)
	-- Checks for a collision of the ball with a rectangle
	if by - BALL_R > BOX_Y + BOX_H then
		return false
	end
	if by + BALL_R < BOX_Y then
		return false
	end
	if bx - BALL_R > BOX_X + BOX_W then
		return false
	end
	if bx + BALL_R < BOX_X then
		return false
	end
	return true
end

function deflx_ballbox(bx, by, bdx, bdy, tx, ty, tw, th)
	-- calculate wether to deflect the ball
	-- horizontally or vertically when it hits a box
	if bdx == 0 then
		-- moving vertically
		return false
	elseif bdy == 0 then
		-- moving horizontally
		return true
	else
		-- moving diagonally
		-- calculate slope
		local slp = bdy / bdx
		local cx, cy
		-- check variants
		if slp > 0 and bdx > 0 then
			-- moving down right
			debug1 = "q1"
			cx = tx - bx
			cy = ty - by
			if cx <= 0 then
				return false
			elseif cy / cx < slp then
				return true
			else
				return false
			end
		elseif slp < 0 and bdx > 0 then
			debug1 = "q2"
			-- moving up right
			cx = tx - bx
			cy = ty + th - by
			if cx <= 0 then
				return false
			elseif cy / cx < slp then
				return false
			else
				return true
			end
		elseif slp > 0 and bdx < 0 then
			debug1 = "q3"
			-- moving left up
			cx = tx + tw - bx
			cy = ty + th - by
			if cx >= 0 then
				return false
			elseif cy / cx > slp then
				return false
			else
				return true
			end
		else
			-- moving left down
			debug1 = "q4"
			cx = tx + tw - bx
			cy = ty - by
			if cx >= 0 then
				return false
			elseif cy / cx < slp then
				return false
			else
				return true
			end
		end
	end
	return false
end
