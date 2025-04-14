-- card.lua
local Card = {}
Card.__index = Card

function Card:new(rank, suit, faceUp, x, y, frontImage, backImage)
    local card = {
        rank = rank,       -- 1-13 (1 = Ace, 11 = Jack, etc.)
        suit = suit,       -- "hearts", "spades", etc.
        faceUp = faceUp or false,
        x = x or 0,
        y = y or 0,
        width = 72,        -- Set this to match your image dimensions
        height = 96,
        frontImage = frontImage,  -- love.graphics.newImage("assets/sprites/AS.png")
        backImage = backImage
    }
    setmetatable(card, Card)
    return card
end

function Card:isRed()
    return self.suit == "hearts" or self.suit == "diamonds"
end

function Card:isBlack()
    return self.suit == "spades" or self.suit == "clubs"
end

function Card:draw()
    if self.faceUp then
        love.graphics.draw(self.frontImage, self.x, self.y)
    else
        love.graphics.draw(self.backImage, self.x, self.y)
    end
end

function Card:flip()
    self.faceUp = not self.faceUp
end

function Card:contains(mx, my)
    return mx >= self.x and mx <= self.x + self.width and
           my >= self.y and my <= self.y + self.height
end

function Card:getName()
    local ranks = {"A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"}
    return ranks[self.rank] .. " of " .. self.suit
end

return Card
