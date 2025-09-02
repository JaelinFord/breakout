-- Runs at the start only
function _init()
	cls()
	MODE = "start"
end

-- Updates every frame
function _update60()
	if MODE == "game" then
		update_game()
	elseif MODE == "start" then
		update_start()
	elseif MODE == "gameover" then
		update_gameover()
	end
end

function update_start()
	if btn(5) then
		startgame()
	end

	function startgame()
		MODE = "game"
		BINIT()
		PINIT()
	end
end

function update_gameover() end

function update_game()
	BUPDATE()
	PUPDATE()
end

-- TBA
function _draw()
	if MODE == "game" then
		draw_game()
	elseif MODE == "start" then
		draw_start()
	elseif MODE == "gameover" then
		draw_gameover()
	end
end

function draw_start()
	cls()
	print("pico-8 breakout!", 36, 40, 7)
	print("press ❎ to start!", 32, 50, 11)
end

function draw_gameover()
	cls()
	print("game over!")
end

function draw_game()
	rectfill(0, 0, 127, 127, 1) -- Draws background
	BDRAW()
	PDRAW()
end
