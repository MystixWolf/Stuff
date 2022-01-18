function mine()
    for i = 1, 15 do 
        turtle.dig()
        turtle.forward()
    end
end

function inspect(direction)
    if (direction == "left") then
        turtle.turnLeft()
        result = turtle.inspect()
        turtle.turnRight()
        return result
    elseif (direction == "right") then
        turtle.turnRight()
        result = turtle.inspect()
        turtle.turnLeft()
        return result
    end
    
end

--for i = 1, 16 do
--    mine()
--end

io.write('Which direction is to mine (left or right)\n')
input = io.read()
io.write('\n', input)