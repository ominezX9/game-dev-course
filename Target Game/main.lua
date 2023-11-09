function love.load()
    -- executes at the start of the game
    target = {}
    -- target position
    target.x = 300
    target.y = 300
    target.radius = 50

    -- track these
    score = 0 
    timer = 0

    -- set game font and size
    gameFont = love.graphics.newFont(40)

end

function love.update(dt)

end

function love.draw()
    -- draw target 
    love.graphics.setColor(1,0,0)
    love.graphics.circle("fill", target.x, target.y, target.radius)

    -- print text and set color to white
    -- using the mouse : lesson 23
    love.graphics.setColor(1, 1, 1) -- color white
    love.graphics.setFont(gameFont)
    love.graphics.print(score, 0, 0)
end
