function start_update()
	if btn(5) then
		startgame()
	end
end

function start_draw()
	print("pico-8 breakout!", 33, 60, 7)
	print("press ❎ to start", 30, 68, 11)
end

function startgame()
	MODE = "game"
	game_init()
	binit()
	pinit()
	brick_init()
end
