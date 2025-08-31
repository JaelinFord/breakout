-- Runs at the start only
function _init()
	cls()
	BINIT()
	PINIT()
end

-- Updates every frame
function _update()
	BUPDATE()
	PUPDATE()
end

-- TBA
function _draw()
	rectfill(0, 0, 127, 127, 1) -- Draws background
	BDRAW()
	PDRAW()
end
