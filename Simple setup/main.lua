function love.load()
    number = 0
end

function love.update(dt)
    -- updates everyframe via deltatime

    number = number + 1


end

function love.draw()
    love.graphics.print(number)
end