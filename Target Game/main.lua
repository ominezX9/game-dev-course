function love.load()
    -- executes at the start of the game
    target = {}
    -- target position
    target.x = 300
    target.y = 300
    target.radius = 50

    -- track these
    score = 0 
    timer = 10

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


--add mousepressed function: lesson 23
function love.mousepressed(x, y, button, istouch, presses )
    -- x -> mouse coordinate x-axis
    -- y - mouse coprdinate y-axis
    -- button -> which button is clicked
    -- istouched, presses -> mobile touch

    if button == 1 then
        -- score = score + 1 -- no yet
        local mouseToTarget = distanceBetween(x, y, target.x, target.y)
        if mouseToTarget < target.radius then 
            score = score + 1

            -- change location after click 
            target.x = math.random(target.radius, love.graphics.getWidth() - target.radius)
            target.y = math. random(target.radius, love.graphics.getHeight() - target.radius)
        end
    end
    

end

-- time to shoot the target :: 🫂
function distanceBetween(x1, y1, x2, y2)
    return math.sqrt( (x2 - x1)^2 + (y2-y1)^2 )
end