function binit()
	BALL_R = 2
	BALL_DR = 0.5
	serveball()
end

function bupdate()
	local nextx, nexty

	nextx = BALL_X + BALL_DX
	nexty = BALL_Y + BALL_DY

	if nextx > (128 - BALL_R) or nextx < BALL_R then
		nextx = mid(BALL_R, nextx, 128 - BALL_R)
		BALL_DX = -BALL_DX
		sfx(0)
	end
	if nexty < (7 + BALL_R) then
		nexty = 7 + BALL_R
		BALL_DY = -BALL_DY
		sfx(0)
	end

	if ball_box(nextx, nexty, PAD_X, PAD_Y, PAD_W, PAD_H) then
		if deflx_ballbox(BALL_X, BALL_Y, BALL_DX, BALL_DY, PAD_X, PAD_Y, PAD_W, PAD_H) then
			BALL_DX = -BALL_DX
		else
			BALL_DY = -BALL_DY
		end
		sfx(1)
		POINTS += 10
	end

	BALL_X = nextx
	BALL_Y = nexty

	if nexty > 127 then
		sfx(2)
		LIVES -= 1
		if LIVES == 0 then
			gameover()
		else
			serveball()
		end
	end
end

function bdraw()
	circfill(BALL_X, BALL_Y, BALL_R, 10)
end

-- ============================================================================================= --
function serveball()
	BALL_X = 5
	BALL_Y = 40
	BALL_DX = 1.3
	BALL_DY = 1.3
end

function ball_box(bx, by, BOX_X, BOX_Y, BOX_W, BOX_H)
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
	if bdx == 0 then
		return false
	elseif bdy == 0 then
		return true
	else
		local slp = bdy / bdx
		local cx, cy
		if slp > 0 and bdx > 0 then
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
