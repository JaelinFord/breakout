-- Initialize ball
function BINIT()
	-- Set the radius of the ball
	BALL_R = 2
	-- Set the change in radius per update (not currently used in this code)
	BALL_DR = 0.5
	SERVEBALL()
end

-- Update ball logic
function BUPDATE()
	-- Declare variables for the ball's next position
	local nextx, nexty

	-- Calculate the ball's potential next position based on its velocity
	nextx = BALL_X + BALL_DX
	nexty = BALL_Y + BALL_DY

	-- Make ball bounce when it hits the edge of the screen
	-- Check for horizontal collision with the screen edges (left and right)
	if nextx > 125 or nextx < 3 then
		-- Clamp the ball's x-position to stay within the screen bounds
		nextx = mid(0, nextx, 127)
		-- Reverse the horizontal velocity to make the ball bounce
		BALL_DX = -BALL_DX
		-- Play sound effect 0 for a wall bounce
		sfx(0)
	end
	-- Check for vertical collision with the screen edges (top and bottom)
	if nexty < 9 then
		-- Clamp the ball's y-position to stay within the screen bounds
		nexty = mid(0, nexty, 127)
		-- Reverse the vertical velocity to make the ball bounce
		BALL_DY = -BALL_DY
		-- Play sound effect 0 for a wall bounce
		sfx(0)
	end

	-- Check if the ball collides with the paddle using a bounding box check
	if BALL_BOX(nextx, nexty, PAD_X, PAD_Y, PAD_W, PAD_H) then
		-- If a collision is detected, handle the deflection
		-- Find out the direction to deflect the ball (horizontal or vertical)
		if deflx_ballbox(BALL_X, BALL_Y, BALL_DX, BALL_DY, PAD_X, PAD_Y, PAD_W, PAD_H) then
			-- If the deflection is horizontal, reverse the horizontal velocity
			BALL_DX = -BALL_DX
		else
			-- Otherwise, the deflection is vertical, so reverse the vertical velocity
			BALL_DY = -BALL_DY
		end
		-- Play sound effect 1 for a paddle hit
		sfx(1)
		POINTS += 10
	end

	-- Update the ball's actual position with the calculated next position
	BALL_X = nextx
	BALL_Y = nexty

	if nexty > 127 then
		sfx(2)
		LIVES -= 1
		if LIVES == 0 then
			GAMEOVER()
		else
			SERVEBALL()
		end
	end
end

-- Draw ball
function BDRAW()
	-- Draw a filled circle for the ball at its current position
	circfill(BALL_X, BALL_Y, BALL_R, 10)
end

-- ============================================================================================= --
function SERVEBALL()
	-- Set the initial x-coordinate of the ball
	BALL_X = 5
	-- Set the initial y-coordinate of the ball
	BALL_Y = 40
	-- Set the horizontal velocity (dx) of the ball
	BALL_DX = 1.3
	-- Set the vertical velocity (dy) of the ball
	BALL_DY = 1.3
end

-- Bounding box collision check
function BALL_BOX(bx, by, BOX_X, BOX_Y, BOX_W, BOX_H)
	-- Checks for a collision of the ball with a rectangle
	-- These are separation axis tests. If any of these conditions are true, there is no collision.
	-- Check if the ball is below the box
	if by - BALL_R > BOX_Y + BOX_H then
		return false
	end
	-- Check if the ball is above the box
	if by + BALL_R < BOX_Y then
		return false
	end
	-- Check if the ball is to the right of the box
	if bx - BALL_R > BOX_X + BOX_W then
		return false
	end
	-- Check if the ball is to the left of the box
	if bx + BALL_R < BOX_X then
		return false
	end
	-- If none of the separation conditions are met, a collision has occurred
	return true
end

-- deflx_ballbox() - Determine deflection axis
function deflx_ballbox(bx, by, bdx, bdy, tx, ty, tw, th)
	-- Calculate whether to deflect the ball horizontally or vertically when it hits a box.
	-- This helps prevent the ball from getting "stuck" inside an object.
	if bdx == 0 then
		-- If the ball is moving purely vertically, deflect it vertically
		return false
	elseif bdy == 0 then
		-- If the ball is moving purely horizontally, deflect it horizontally
		return true
	else
		-- The ball is moving diagonally; calculate which side it hit
		-- Calculate the slope of the ball's trajectory
		local slp = bdy / bdx
		local cx, cy
		-- Check the ball's trajectory and the corner it will hit to determine the deflection axis.
		if slp > 0 and bdx > 0 then
			-- Ball is moving down and to the right (quadrant 1)
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
			-- Ball is moving up and to the right (quadrant 2)
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
			-- Ball is moving left and up (quadrant 3)
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
			-- Ball is moving left and down (quadrant 4)
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
	-- Default return value if no other conditions are met
	return false
end
