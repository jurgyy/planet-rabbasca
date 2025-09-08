local output = {}

function output.restrict_to_harene_pool(bbox)
    return 
    { 
        area = bbox, 
        required_tiles = { layers = { harene = true } },
        colliding_tiles = { layers = { is_object = true } }, -- must not be empty??
        remove_on_collision = true 
    }
end

function output.harene_burner()
    return 
    {  
        type = "burner",
        fuel_inventory_size = 1,
        burnt_inventory_size = 1,
        fuel_categories = {"rabbasca-infused-core-fuel"},
        initial_fuel = "rabbasca-infused-haronite-core",
        initial_fuel_percent = 1,
    } 
end

return output