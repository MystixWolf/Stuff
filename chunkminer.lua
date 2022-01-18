function mine()
    for i = 1, 15 do 
        turtle.dig()
        turtle.forward()
    end
end

function chunkminer(direction)
    if (direction == "left") then
        test = 1 -- odd is left and even is right
        for i = 1, 15 do
            mine()
            if ((test % 2) == 0) then -- if even
                turtle.turnRight()
                turtle.dig()
                turtle.forward()
                turtle.turnRight()
                test = test + 1
            else
                turtle.turnLeft()
                turtle.dig()
                turtle.forward()
                turtle.turnLeft()
                test = test + 1
            end
        end
        mine()
        turtle.digDown()
        turtle.down()
        turtle.turnLeft()
    elseif (direction == "right") then
        test = 1 -- odd is left and even is right
        for i = 1, 15 do
            mine()
            if ((test % 2) == 0) then -- if even
                turtle.turnRight()
                turtle.dig()
                turtle.forward()
                turtle.turnRight()
                test = test + 1
            else
                turtle.turnLeft()
                turtle.dig()
                turtle.forward()
                turtle.turnLeft()
                test = test + 1
            end
        end
        mine()
        turtle.digDown()
        turtle.down()
        turtle.turnRight()
    end
end

-- Getting the direction of the chunk
io.write('Which direction is the chunk(left or right)\n')
input = io.read()

while true do
    chunkminer(input)
end