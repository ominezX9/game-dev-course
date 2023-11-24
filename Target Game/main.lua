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

    -- setup to import sprites
    sprites = {}
    -- load images
    sprites.sky = love.graphics.newImage('sprites/sky.png')
    sprites.target = love.graphics.newImage('sprites/target.png')
    sprites.crosshairs = love.graphics.newImage('sprites/crosshairs.png')

    -- set mouse to be invisible
    love.mouse.setVisible(false)

end

function love.update(dt)
    -- introduction to the dt(delta time)
    if timer > 0 then 
        timer = timer - dt
    end

    if timer < 0 then
        timer = 0 
    end
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
    -- rounding up to the next int -> math.ceil
    -- rounding down to the next int -> math.floor
    love.graphics.print(math.ceil(timer), 300, 0) 

    -- draw the sprites
    -- love.mouse.getX() --> gets the position of the mouse cursor on X axis
    love.graphics.draw(sprites.crosshairs, love.mouse.getX()-20, love.mouse.getY()-20)

    --drawing the target 
    -- move to target location.
    love.graphics.draw(sprites.target, target.x - target.radius, target.y - target.radius)
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
            target.y = math.random(target.radius, love.graphics.getHeight() - target.radius)
            -- basically (50, windowWidth-50)
            
        end
    end
    

end

-- time to shoot the target :: 🫂
function distanceBetween(x1, y1, x2, y2)
    return math.sqrt( (x2 - x1)^2 + (y2-y1)^2 )
end