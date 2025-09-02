-- Initialize player
function pinit()
	-- Set the initial X position of the paddle
	PAD_X = 52
	-- Set the initial Y position of the paddle
	PAD_Y = 120
	-- Set the initial horizontal velocity (dx) of the paddle
	PAD_DX = 0
	-- Set the width of the paddle
	PAD_W = 24
	-- Set the height of the paddle
	PAD_H = 3
	-- Set the color of the paddle
	PAD_C = 6
end

-- Update player logic
function pupdate()
	-- A flag to check if any button is currently being pressed
	local buttpress = false
	-- Check for left button press
	if btn(0) then
		-- Set the paddle's horizontal velocity to a negative value for left movement
		PAD_DX = -1.7
		-- Set the flag to true
		buttpress = true
	end
	-- Check for right button press
	if btn(1) then
		-- Set the paddle's horizontal velocity to a positive value for right movement
		PAD_DX = 1.7
		-- Set the flag to true
		buttpress = true
	end
	-- Apply "floatiness" to the paddle's movement
	if not buttpress then
		-- Decrease the paddle's velocity over time, creating a gradual stop
		PAD_DX = PAD_DX / 1.2
	end
	-- Update the paddle's X position based on its velocity
	PAD_X += PAD_DX
end

-- Draw the paddle
function pdraw()
	-- Draw a filled rectangle for the paddle using its properties
	rectfill(PAD_X, PAD_Y, PAD_X + PAD_W, PAD_Y + PAD_H, PAD_C)
end
