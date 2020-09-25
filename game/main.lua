local state = require "lib/stager"

function love.load()
    state:switch("society")
end

function love.update(dt)
    state:update(dt)
end

function love.draw()
    state:draw()
end