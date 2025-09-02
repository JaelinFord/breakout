function update_gameover()
	if btn(5) then
		startgame()
	end
end

-- Draws the game over screen graphics
function draw_gameover()
	-- Prints the "game over" message and highscore
	rectfill(0, 53, 128, 79, 0)
	print("game over!", 43, 56, 7)
	print("highscore: " .. POINTS, 34, 64, 7)
	print("press ❎ to restart", 26, 72, 6)
end

function gameover()
	MODE = "gameover"
end
