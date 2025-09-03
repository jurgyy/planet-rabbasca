local recycling = require("__quality__.prototypes.recycling")

function recycle_core(name, retrieved_name)
  local rec  = data.raw["recipe"][name]
  if rec then
    rec.auto_recycle = false
  end 
  local item  = data.raw["item"][name]
  if not item then return end
  recycling.generate_self_recycling_recipe(item)
  local recipe = data.raw["recipe"][item.name.."-recycling"]
  recipe.hidden = false
  recipe.enabled = false
  recipe.category = "recycling-or-hand-crafting"
  recipe.results = {{type = "item", name = retrieved_name, amount = 1, probability = 1, ignored_by_stats = 1}}
  recipe.energy_required = (data.raw.recipe[item.name] and data.raw.recipe[item.name].energy_required or 0.5 )/2
end

function offering_ears_core(level, input_item, input_amount)
    return {
        type = "recipe",
        name = "rabbasca-offering-"..level,
        enabled = false,
        hidden = true,
        hidden_in_factoriopedia = true,
        energy_required = 5,
        ingredients = { { type = "item", name = input_item, amount = input_amount } },
        results = { { type = "item", name = "ears-core-offering-dummy", amount = 1, percent_spoiled = 0 } },
        reset_freshness_on_craft = true,
        result_is_always_fresh = true,
        main_product = "ears-core-offering-dummy",
        category = "harene-offering",
        auto_recycle = false
    }
end

data:extend {
    {
        type = "recipe-category",
        name = "harene-transmutation"
    },
    {
        type = "recipe-category",
        name = "harene-synthesis"
    },
    {
        type = "recipe-category",
        name = "harene-offering"
    },
    {
        type = "recipe",
        name = "harene-transmute-copper",
        enabled = false,
        energy_required = 10.0,
        results = { { type = "item", name = "copper-plate", amount = 100 } },
        main_product = "copper-plate",
        category = "harene-transmutation",
    },
    {
        type = "recipe",
        name = "harene-transmute-iron",
        enabled = false,
        energy_required = 10.0,
        results = { { type = "item", name = "iron-plate", amount = 100 } },
        main_product = "iron-plate",
        category = "harene-transmutation",
    },
    {
        type = "recipe",
        name = "smart-solution",
        enabled = false,
        energy_required = 10.0,
        ingredients = { 
            {type = "fluid", name = "beta-carotene", amount = 50 },
            {type = "item", name = "protein-powder", amount = 3 },
        },
        results = { { type = "item", name = "smart-solution", amount = 5 } },
        main_product = "smart-solution",
        category = "organic-or-chemistry",
    },
    {
        type = "recipe",
        name = "energetic-residue",
        energy_required = 5.0,
        ingredients = { 
            {type = "item", name = "harene-infused-moonstone", amount = 1 },
        },
        results = { 
            { type = "fluid", name = "energetic-residue", amount = 50 },
            { type = "item", name = "rabbasca-moonstone", amount = 1 } 
        },
        main_product = "energetic-residue",
        category = "organic-or-chemistry",
    },
    {
        type = "recipe",
        name = "beta-carotene",
        enabled = false,
        energy_required = 5.0,
        ingredients = { 
            {type = "fluid", name = "energetic-residue", amount = 10 },
            {type = "item", name = "rabbasca-carotene-powder", amount = 200 },
        },
        results = { { type = "fluid", name = "beta-carotene", amount = 200 } },
        main_product = "beta-carotene",
        category = "organic-or-chemistry",
    },
    {
        type = "recipe",
        name = "harene-infused-moonstone",
        enabled = false,
        energy_required = 44,
        ingredients = { 
            {type = "item", name = "rabbasca-moonstone", amount = 1 },
            {type = "fluid", name = "harene", amount = 10 },
        },
        results = { { type = "item", name = "harene-infused-moonstone", amount = 1 } },
        main_product = "harene-infused-moonstone",
        category = "harene-transmutation",
    },
    {
        type = "recipe",
        name = "haronite",
        enabled = false,
        energy_required = 5.5,
        ingredients = { 
            {type = "item", name = "rabbasca-moonstone", amount = 1 },
            {type = "item", name = "rabbasca-carotene-powder", amount = 200 },
            {type = "fluid", name = "energetic-residue", amount = 30 },
        },
        results = { 
            { type = "item", name = "haronite", amount = 20  },
        },
        main_product = "haronite",
        category = "organic-or-chemistry",
    },
    {
        type = "recipe",
        name = "infused-haronite-plate",
        enabled = false,
        energy_required = 4.7,
        ingredients = { 
            {type = "item", name = "haronite", amount = 75 },
            {type = "fluid", name = "harene", amount = 100 },
        },
        results = { 
            { type = "item", name = "infused-haronite-plate", amount = 50  },
        },
        main_product = "infused-haronite-plate",
        category = "harene-transmutation",
    },
    {
        type = "recipe",
        name = "harene-thruster",
        enabled = false,
        energy_required = 20.0,
        ingredients = { 
            {type = "item", name = "infused-haronite-plate", amount = 10 },
            {type = "fluid", name = "lubricant", amount = 200 },
            -- {type = "item", name = "harene-engine", amount = 1 },
        },
        results = { { type = "item", name = "harene-thruster", amount = 1 } },
        main_product = "harene-thruster",
        category = "crafting-with-fluid",
    },
    {
        type = "recipe",
        name = "carotene-inserter",
        enabled = false,
        energy_required = 0.5,
        ingredients = { 
            {type = "item", name = "rabbasca-carotene-powder", amount = 10 },
            {type = "item", name = "rabbasca-moonstone", amount = 5 },
            {type = "item", name = "burner-inserter", amount = 1 },
        },
        results = { 
            { type = "item", name = "carotene-inserter", amount = 1 },
        },
        main_product = "carotene-inserter",
        category = "crafting",
    },
    {
        type = "recipe",
        name = "harene-transmuter",
        enabled = false,
        energy_required = 10,
        ingredients = { 
            {type = "item", name = "harene-ears-core", amount = 1 },
            {type = "item", name = "moonstone-pipe",   amount = 1 },
        },
        results = { 
            { type = "item", name = "harene-transmuter", amount = 1 },
        },
        main_product = "harene-transmuter",
        category = "crafting"
    },
    {
        type = "recipe",
        name = "harene-extractor",
        enabled = false,
        energy_required = 10,
        ingredients = { 
            {type = "item", name = "harene-cubic-core", amount = 1 },
            {type = "item", name = "moonstone-pipe",   amount = 10 },
        },
        results = { 
            { type = "item", name = "harene-extractor", amount = 1 },
        },
        main_product = "harene-extractor",
        category = "crafting"
    }, 
    {
        type = "recipe",
        name = "harenic-chemical-plant",
        enabled = false,
        energy_required = 10,
        ingredients = { 
            {type = "item", name = "harene-ears-core", amount = 1 },
            {type = "item", name = "moonstone-pipe", amount = 1 },
        },
        results = { 
            { type = "item", name = "harenic-chemical-plant", amount = 1 },
        },
        main_product = "harenic-chemical-plant",
        category = "crafting"
    },
    {
        type = "recipe",
        name = "moonstone-pipe",
        enabled = false,
        energy_required = 5,
        ingredients = { 
            {type = "item", name = "harene-infused-moonstone", amount = 1 },
            {type = "item", name = "rabbasca-carotene-powder",   amount = 200 },
        },
        results = { 
            { type = "item", name = "moonstone-pipe", amount = 20 },
        },
        main_product = "moonstone-pipe",
        category = "crafting",
    },
    {
        type = "recipe",
        name = "harene-infused-foundation",
        energy_required = 60,
        enabled = false,
        ingredients = { 
            {type = "item", name = "rabbasca-carotene-powder", amount = 100 },
            {type = "item", name = "foundation", amount = 1 },
        },
        results = { 
            { type = "item", name = "harene-infused-foundation", amount = 1 },
        },
        main_product = "harene-infused-foundation",
        category = "crafting",
    },
    {
        type = "recipe",
        name = "harene-infused-space-platform",
        enabled = false,
        energy_required = 10,
        ingredients = { 
            {type = "item", name = "rabbasca-moonstone", amount = 5 },
            {type = "item", name = "harene-infused-foundation", amount = 1 },
            {type = "item", name = "low-density-structure", amount = 20 },
            {type = "fluid", name = "fluorine", amount = 50 },
        },
        results = { 
            { type = "item", name = "harene-infused-space-platform", amount = 10 },
        },
        main_product = "harene-infused-space-platform",
        category = "crafting-with-fluid",
    },
    {
        type = "recipe",
        name = "bunnyhop-engine",
        enabled = false,
        energy_required = 15,
        ingredients = { 
            {type = "item", name = "harene-ears-core", amount = 1 },
            {type = "item", name = "smart-solution", amount = 20 },
            {type = "item", name = "infused-haronite-plate", amount = 3 },
        },
        results = { 
            { type = "item", name = "bunnyhop-engine", amount = 10 },
        },
        main_product = "bunnyhop-engine",
        category = "crafting",
    },
    {
        type = "recipe",
        name = "rabbasca-turbofish",
        enabled = false,
        energy_required = 5,
        ingredients = { 
            {type = "item", name = "raw-fish", amount = 10 },
            {type = "fluid", name = "harene", amount = 1 },
            {type = "fluid", name = "beta-carotene", amount = 50 },
        },
        results = { 
            { type = "item", name = "rabbasca-turbofish", amount = 10 },
        },
        main_product = "rabbasca-turbofish",
        category = "organic-or-chemistry",
    },
    {
        type = "recipe",
        name = "ultranutritious-science-pack",
        enabled = false,
        energy_required = 17,
        ingredients = { 
            {type = "item", name = "smart-solution", amount = 2 },
            {type = "item", name = "infused-haronite-plate", amount = 1 },
        },
        results = { 
            { type = "item", name = "ultranutritious-science-pack", amount = 6 },
        },
        main_product = "ultranutritious-science-pack",
        category = "crafting",
    },
    {
        type = "recipe",
        name = "moonstone-chest",
        enabled = false,
        energy_required = 3,
        ingredients = { 
            {type = "item", name = "harene-glob-core", amount = 1 },
            {type = "item", name = "infused-haronite-plate", amount = 5 },
        },
        results = { 
            { type = "item", name = "moonstone-chest", amount = 1 },
        },
        main_product = "moonstone-chest",
        category = "crafting",
    },
    {
        type = "recipe",
        name = "protein-powder",
        enabled = false,
        energy_required = 1,
        ingredients = { 
            {type = "item", name = "rabbasca-turbofish", amount = 1 },
        },
        results = { 
            { type = "item", name = "protein-powder", amount = 20 },
        },
        main_product = "protein-powder",
        category = "crafting",
    },
    -- {
    --     type = "recipe",
    --     name = "harene-ears-core",
    --     enabled = false,
    --     energy_required = 30,
    --     ingredients = { 
    --         { type = "item", name = "harene-engine", amount = 1 },
    --         { type = "item", name = "harene-cubic-core", amount = 3 },
    --     },
    --     results = { 
    --         { type = "item", name = "harene-ears-core", amount = 1 },
    --         { type = "item", name = "harene-cubic-core", amount = 1 },
    --     },
    --     main_product = "harene-ears-core",
    --     category = "crafting",
    -- },
    -- {
    --     type = "recipe",
    --     name = "harene-glob-core",
    --     enabled = false,
    --     energy_required = 30,
    --     ingredients = { 
    --         { type = "item", name = "harene-infused-moonstone", amount = 4 },
    --         { type = "item", name = "harene-cubic-core", amount = 3 },
    --     },
    --     results = { 
    --         { type = "item", name = "harene-glob-core", amount = 1 },
    --         { type = "item", name = "harene-cubic-core", amount = 1 },
    --     },
    --     main_product = "harene-glob-core",
    --     category = "crafting",
    -- },
    offering_ears_core(1, "harene-infused-moonstone", 1 ),
    offering_ears_core(2, "harene-infused-moonstone", 2 ),
    offering_ears_core(3, "harene-infused-moonstone", 4 ),
    offering_ears_core(4, "infused-haronite-plate",  10 ),
    offering_ears_core(5, "infused-haronite-plate",  100),
    offering_ears_core(6, "infused-haronite-plate", 1000),
    offering_ears_core(7, "harene-glob-core",          1),
    offering_ears_core(8, "harene-glob-core",          2),
    offering_ears_core(9, "harene-glob-core",          3),
    offering_ears_core(10, "harene-glob-core",         5),
    offering_ears_core(11,"harene-glob-core",          8),
    offering_ears_core(12,"harene-glob-core",         13),
    offering_ears_core(13,"harene-glob-core",         21),
}

recycle_core("harenic-chemical-plant", "harene-ears-core")
recycle_core("bunnyhop-engine", "harene-ears-core")
recycle_core("harene-transmuter", "harene-ears-core")
recycle_core("harene-extractor", "harene-cubic-core")
recycle_core("moonstone-chest", "harene-glob-core")
recycle_core("small-harenide-collider", "harene-cubic-core")