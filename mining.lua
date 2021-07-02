local ACCEPTED_FUELS = {
    "minecraft:coal_block",
    "minecraft:coal"
}

local PLACEABLE_ITEMS = {
    "minecraft:torch",
}

local torchPlacement = 0
local torch_slot = 1

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
    turtle.digUp()
    turtle.digDown()
    placeTorch()
    turtle.turnLeft()
    turtle.dig()
    turtle.forward()
    turtle.digUp()
    turtle.digDown()
    turtle.turnRight()
    turtle.turnRight()
    turtle.forward()
    turtle.dig()
    turtle.forward()
    turtle.digUp()
    turtle.digDown()
    turtle.turnLeft()
    turtle.turnLeft()
    turtle.forward()
    turtle.turnRight()
    turtle.dig()
    turtle.forward()
end

function findTorchslot()
    for i = 1, 16 do
        local currentItem = turtle.getItemDetail()
        for n = 1, #PLACEABLE_ITEMS do
            if (currentItem.name == PLACEABLE_ITEMS[n]) then
                torch_slot = i
            end
        end
    end
end

function placeTorch()
    if (torchPlacement == 1) then
        turtle.select(torch_slot)
        turtle.placeDown()
        torchPlacement = 0
    end
end

while true do
    checkFuel()                  
    Mine()
    torchPlacement = torchPlacement + 1
end