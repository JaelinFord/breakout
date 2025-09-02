function _init()
	cls()
	MODE = "start"
end

function _update60()
	if MODE == "game" then
		game_update()
	elseif MODE == "start" then
		start_update()
	elseif MODE == "gameover" then
		gameover_update()
	end
end

function _draw()
	if MODE == "game" then
		game_draw()
	elseif MODE == "start" then
		start_draw()
	elseif MODE == "gameover" then
		gameover_draw()
	end
end
