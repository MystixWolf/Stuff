local ACCEPTED_FUELS = {
    "minecraft:coal_block",
    "minecraft:coal"
}

local TORCH = {
    "minecraft:torch",
}

local CHEST = {
    "minecraft:chest",
}

local torchPlacement = 0
local torch_slot = 1
local chest_slot = 1
local fullInventory = false

findChestslot()
findTorchslot()

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
    placeChest()
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
        for n = 1, #TORCH do
            if (currentItem.name == TORCH[n]) then
                torch_slot = i
            end
        end
    end
end

function findChestslot()
    for i = 1, 16 do
        local currentItem = turtle.getItemDetail()
        for n = 1, #CHEST do
            if (currentItem.name == CHEST[n]) then
                chest_slot = i
            end
        end
    end
end

function placeTorch()
    if (torchPlacement == 11) then
        turtle.select(torch_slot)
        turtle.placeDown()
        torchPlacement = 0
    end
end

function checkInventory()
    local currentItem = turtle.getItemDetail(16)
    if(currentItem ~= nil) then
        if(turtle.getItemCount(16) > 32) then
            fullInventory = true
        end
    end
end

function dumpInventory()
    for i = 3, 16 do
        turtle.select(i)
        turtle.dropDown()
    end
end

function placeChest()
    if (fullInventory == true) then
        if(turtle.inspectDown() == TORCH[1]) then
            turtle.turnLeft()
            turtle.turnLeft()
            turtle.forward()
            turtle.turnLeft()
            turtle.turnLeft()
            turtle.select(chest_slot)
            turtle.placeDown()
            dumpInventory()
            turtle.forward()
        end
    end
    
end

while true do
    checkFuel()
    checkInventory()                  
    Mine()
    torchPlacement = torchPlacement + 1
end