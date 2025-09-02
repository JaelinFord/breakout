function pinit()
	PAD_X = 52
	PAD_Y = 120
	PAD_DX = 0
	PAD_W = 24
	PAD_H = 3
	PAD_C = 6
end

function pupdate()
	local buttpress = false
	if btn(0) then
		PAD_DX = -1.7
		buttpress = true
	end
	if btn(1) then
		PAD_DX = 1.7
		buttpress = true
	end
	if not buttpress then
		PAD_DX = PAD_DX / 1.2
	end
	PAD_X += PAD_DX
	PAD_X = mid(0, PAD_X, 127 - PAD_W)
end

function pdraw()
	rectfill(PAD_X, PAD_Y, PAD_X + PAD_W, PAD_Y + PAD_H, PAD_C)
end
