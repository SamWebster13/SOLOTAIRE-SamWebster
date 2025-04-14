local Card = require "card"

local testCard

function love.load()
    local front = love.graphics.newImage("assets/sprites/10H.png")
    local back = love.graphics.newImage("assets/sprites/back.png")
    testCard = Card:new(10, "hearts", false, 100, 100, front, back)
end

function love.update(dt)
end

function love.draw()
    testCard:draw()
end

function love.mousepressed(x, y, button)
    if button == 1 and testCard:contains(x, y) then
        testCard:flip()
    end
end
