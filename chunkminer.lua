function mine()
    for i = 1, 15 do 
        turtle.dig()
        turtle.forward()
    end
end

io.write('Which direction is the chunk(left or right)\n')
input = io.read()

if (input == "left") then
    test = 1 -- odd is left and even is right
    for i = 1, 16 do
        mine()
        if ((test % 2) == 0) then -- if even
            turtle.turnRight()
            turtle.forward()
            turtle.turnRight()
            test = test + 1
        else
            turtle.turnLeft()
            turtle.forward()
            turtle.turnLeft()
            test = test + 1
        end
    end
elseif (input == "right") then
    test = 1 -- odd is left and even is right
    for i = 1, 16 do
        mine()
        if ((test % 2) == 0) then -- if even
            turtle.turnRight()
            turtle.forward()
            turtle.turnRight()
            test = test + 1
        else
            turtle.turnLeft()
            turtle.forward()
            turtle.turnLeft()
            test = test + 1
        end
    end
end