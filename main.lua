Object = require 'libs/classic'
Input = require 'libs/input'
Timer = require 'libs/enhancedtimer'
-- local love = require 'love'

function love.load()
    -- Load the libraries
    local object_files = {}
    recursiveEnumerate('objects', object_files)
    requireFiles(object_files)
    -- Test draw
    circle = { radius = 24 }
    -- Input
    input = Input()
    input:bind('mouse1', 'test')
    -- Timer
    timer = Timer()
    timer:after(2, function()
        timer:tween(6, circle, { radius = 96 }, 'in-out-cubic', function()
            timer:tween(6, circle, { radius = 24 }, 'in-out-cubic')
        end)
    end)
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
    -- circle:update(dt)
    timer:update(dt)
end

function love.draw()
    -- circle:draw()
    love.graphics.circle('fill', 400, 300, circle.radius)
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
