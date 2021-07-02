local ACCEPTED_FUELS = {
    "minecraft:coal_block",
    "minecraft:coal"
}

function Mine()
    for i = 1, 4, 1 do
        turtle.dig()
        turtle.forward()
    end
end

function Turn()
    turtle.forward()
    turtle.turnLeft()
    turtle.forward()
    turtle.forward()
    turtle.turnLeft()
end

function checkFuel()
    local currentFuellevel = turtle.getFuelLevel()

    if (currentFuellevel <= 0) then
        print("Need Fuel")
        for i = 1, 16 do
            local currentItem = turtle.getItemDetail(i)
            if (currentItem ~= nil) then
                for n = 1, #ACCEPTED_FUELS do
                    if currentItem.name == ACCEPTED_FUELS[n] then
                        turtle.select(i)
                        turtle.refuel()
                    end
                end
            end
        end
    end
end

function Farm()
    checkFuel()
    Mine()
    Turn()
    Mine()
    Turn()
end

while true do
    Farm()
    print("Sleeping to save fuel.")
    sleep(1200)
end