local ACCEPTED_FUELS = {
    "minecraft:coal_block",
    "minecraft:coal"
}

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

function Mine()
    turtle.dig()
    turtle.digUp()
    turtle.digDown()
    turtle.forward()
end
while true do
    checkFuel()
    Mine()
end