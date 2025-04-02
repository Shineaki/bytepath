Object = require 'libs/classic'
-- local love = require 'love'

function love.load()
    local object_files = {}
    recursiveEnumerate('objects', object_files)
    requireFiles(object_files)
    circle = HyperCircle(400, 300, 50, 5, 100)
end

function requireFiles(files)
    for _, filePath in ipairs(files) do
        local file = filePath:sub(1, -5) -- remove .lua
        require(file)
    end
end

function recursiveEnumerate(folder, file_list)
    local items = love.filesystem.getDirectoryItems(folder)
    for _, item in ipairs(items) do
        local file = folder .. '/' .. item
        if love.filesystem.getInfo(file).type == "file" then
            table.insert(file_list, file)
        elseif love.filesystem.getInfo(file).type == "directory" then
            recursiveEnumerate(file, file_list)
        end
    end
end

function love.update(dt)
    circle:update(dt)
end

function love.draw()
    circle:draw()
end

function love.keypressed(key)
    print(key)
end

function love.keyreleased(key)
    print(key)
end

function love.mousepressed(x, y, button)
    print(x, y, button)
end

function love.mousereleased(x, y, button)
    print(x, y, button)
end
