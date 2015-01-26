--main.lua - Zack H - 2014
--part of game codenamed "limitless"

--variables

charX = 0 --character coordinates (in px)
charY = 0

function love.load()
	tileW, tileH = 32, 32 --tile width and height

	texture = love.graphics.newImage('tileset.png')
	character = love.graphics.newImage('player.png')
	
	tiles = {
		love.graphics.newQuad(0, 0, tileW, tileH, texture:getDimensions()),
		love.graphics.newQuad(268, 640, tileW, tileH, texture:getDimensions()), --160, 480
		love.graphics.newQuad(128, 0, tileW, tileH, texture:getDimensions()),
		love.graphics.newQuad(160, 0, tileW, tileH, texture:getDimensions())
	}
	
	--rooms randomly chosen for certain layouts
	--2 is room, 1 is no room, 3 is beginning, 4 is end
	roomTable = {
		{3,2,1,1,2,1,4},
		{1,2,2,2,2,1,2},
		{1,2,1,2,1,2,2},
		{1,2,1,2,2,2,1},
		{1,2,1,1,1,2,2}
	}
end

function love.update(dt)
	--if person touches edge of room
		--if floor layout allows & enemies are dead
			--load next room
	--if person's coords overlap w/ an enemy
		--lower health
	--if no health
		--die
	
	if love.keyboard.isDown('w') then
		charY = charY - (150 * dt)
	end
	if love.keyboard.isDown('s') then
		charY = charY + (150 * dt)
	end
	if love.keyboard.isDown('a') then
		charX = charX - (150 * dt)
	end
	if love.keyboard.isDown('d') then
		charX = charX + (150 * dt)
	end
end

--tileTable will be global variable for each room
function love.draw()
	drawRoom()
	love.graphics.draw(character, charX, charY)
end

function drawRoom()
	for rowIndex = 1, #roomTable do
		local row = roomTable[rowIndex]
		for columnIndex = 1, #row do
			local number = row[columnIndex]
			print(number)
			local x = (columnIndex - 1) * tileW
			local y = (rowIndex - 1) * tileH
			love.graphics.draw(texture, tiles[number], x, y)
		end
	end
end

function loadRoom() --loads tile for new room when entered
	--change roomTable when called
end

function loadFloor(floor_number) --loads floor table when next floor entered
	floor_file = io.open('floor_' .. floor_number)
end










