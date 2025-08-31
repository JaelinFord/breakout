BALL_X = 1
BALL_Y = 40
BALL_DX = 2
BALL_DY = 2
BALL_R = 2
BALL_DR = 0.5

PAD_X = 52
PAD_Y = 120
PAD_DX = 0
PAD_W = 24
PAD_H = 3

-- Runs at the start only
function _init()
	cls()
end

-- Updates every frame
function _update()
	BUTTPRESS = false

	-- Left
	if btn(0) then
		PAD_DX = -5
		BUTTPRESS = true
		-- PAD_X -= 5
	end
	-- Right
	if btn(1) then
		PAD_DX = 5
		BUTTPRESS = true
		-- PAD_X += 5
	end

	-- Floatyness of the pad
	if not BUTTPRESS then
		PAD_DX = PAD_DX / 1.65
	end
	PAD_X += PAD_DX

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

function _draw()
	-- Draws background
	rectfill(0, 0, 127, 127, 1)
	-- Create ball
	circfill(BALL_X, BALL_Y, BALL_R, 10)
	-- Create pad
	rectfill(PAD_X, PAD_Y, PAD_X + PAD_W, PAD_Y + PAD_H, 6)
end
