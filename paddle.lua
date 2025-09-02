function PINIT()
	PAD_X = 52
	PAD_Y = 120
	PAD_DX = 0
	PAD_W = 24
	PAD_H = 3
	PAD_C = 6
end

function PUPDATE()
	local buttpress = false
	-- Left
	if btn(0) then
		PAD_DX = -3.5
		buttpress = true
	end
	-- Right
	if btn(1) then
		PAD_DX = 3.5
		buttpress = true
	end
	-- Floatyness of the pad
	if not buttpress then
		PAD_DX = PAD_DX / 1.65
	end
	PAD_X += PAD_DX
end

function PDRAW()
	rectfill(PAD_X, PAD_Y, PAD_X + PAD_W, PAD_Y + PAD_H, PAD_C)
end
