function love.load()
    
end

function love.update(dt)
    -- updates everyframe via deltatime



end

function love.draw()
    -- this is used to draw a rectangle.
    -- parameters(mode, x-pos, y-pos, width, height)
    love.graphics.rectangle("fill", 200, 400, 400, 100)
    love.graphics.circle("fill", 300, 300, 50, 100)
end