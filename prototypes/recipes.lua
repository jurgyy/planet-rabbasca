local recycling = require("__quality__.prototypes.recycling")

function recycle_core(name, retrieved_name) 
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
        type = "recipe",
        name = "harene-transmute-copper",
        energy_required = 10.0,
        results = { { type = "item", name = "copper-plate", amount = 100 } },
        main_product = "copper-plate",
        category = "harene-transmutation",
    },
    {
        type = "recipe",
        name = "harene-transmute-iron",
        energy_required = 10.0,
        results = { { type = "item", name = "iron-plate", amount = 100 } },
        main_product = "iron-plate",
        category = "harene-transmutation",
    },

    {
        type = "recipe",
        name = "harene-engine",
        energy_required = 25.0,
        ingredients = { 
            {type = "item", name = "steel-plate", amount = 200 },
            -- {type = "item", name = "harene-ears-core", amount = 1 },
            {type = "fluid", name = "fluorine", amount = 150 },
            {type = "item", name = "crystallized-harene", amount = 120 },
        },
        results = { { type = "item", name = "harene-engine", amount = 1 } },
        main_product = "harene-engine",
        category = "smelting",
    },
    {
        type = "recipe",
        name = "crystallized-harene",
        energy_required = 17.0,
        ingredients = { 
            {type = "fluid", name = "harene", amount = 1000 },
            {type = "fluid", name = "sulfuric-acid", amount = 10 },
            {type = "item", name = "carbon-fiber", amount = 3 },
        },
        results = { { type = "item", name = "crystallized-harene", amount = 500 } },
        main_product = "crystallized-harene",
        category = "cryogenics",
    },
    {
        type = "recipe",
        name = "haronite-plate",
        energy_required = 9.0,
        ingredients = { 
            {type = "item", name = "crystallized-harene", amount = 1000 },
            {type = "item", name = "tungsten-ore", amount = 11 },
            {type = "fluid", name = "molten-copper", amount = 200 },
        },
        results = { { type = "item", name = "haronite-plate", amount = 1 } },
        main_product = "haronite-plate",
        category = "smelting",
    },
    {
        type = "recipe",
        name = "harene-thruster",
        energy_required = 20.0,
        ingredients = { 
            {type = "item", name = "haronite-plate", amount = 10 },
            {type = "fluid", name = "lubricant", amount = 200 },
            {type = "item", name = "harene-engine", amount = 1 },
        },
        results = { { type = "item", name = "harene-thruster", amount = 1 } },
        main_product = "harene-thruster",
        category = "crafting-with-fluid",
    },
    {
        type = "recipe",
        name = "harene-synthesis",
        energy_required = 30.0,
        ingredients = { 
            {type = "fluid", name = "beta-carotene", amount = 500 },
            {type = "item", name = "harene-engine", amount = 1 },
        },
        results = { 
            { type = "fluid", name = "harene", amount = 100 },
            { type = "item", name = "harene-engine", amount = 1 },
        },
        main_product = "harene",
        category = "harene-synthesis",
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
        category = "crafting",
        auto_recycle = false
    },
    {
        type = "recipe",
        name = "harene-extractor",
        enabled = false,
        energy_required = 10,
        ingredients = { 
            {type = "item", name = "harene-ears-core", amount = 1 },
            {type = "item", name = "moonstone-pipe",   amount = 10 },
        },
        results = { 
            { type = "item", name = "harene-extractor", amount = 1 },
        },
        main_product = "harene-extractor",
        category = "crafting",
        auto_recycle = false
    }, 
    {
        type = "recipe",
        name = "harene-assembler",
        enabled = false,
        energy_required = 10,
        ingredients = { 
            {type = "item", name = "harene-ears-core", amount = 1 },
            {type = "item", name = "moonstone-pipe", amount = 1 },
            {type = "item", name = "assembling-machine-1", amount = 1 },
        },
        results = { 
            { type = "item", name = "harene-assembler", amount = 1 },
        },
        main_product = "harene-assembler",
        category = "crafting",
        auto_recycle = false
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
            { type = "item", name = "moonstone-pipe", amount = 50 },
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
        name = "rabbasca-turbofish",
        enabled = false,
        energy_required = 5,
        ingredients = { 
            {type = "item", name = "raw-fish", amount = 10 },
            {type = "item", name = "harene-infused-moonstone", amount = 1 },
            {type = "item", name = "rabbasca-carotene-powder", amount = 100 },
        },
        results = { 
            { type = "item", name = "rabbasca-turbofish", amount = 10 },
        },
        main_product = "rabbasca-turbofish",
        category = "crafting",
    },
    {
        type = "recipe",
        name = "harene-infused-vitamins",
        enabled = false,
        energy_required = 5,
        ingredients = { 
            {type = "item", name = "rabbasca-carotene-powder", amount = 100 },
        },
        results = { 
            { type = "item", name = "harene-infused-vitamins", amount = 20 },
        },
        main_product = "harene-infused-vitamins",
        category = "harene-transmutation",
    },
    {
        type = "recipe",
        name = "archonic-science-pack",
        enabled = false,
        energy_required = 17,
        ingredients = { 
            {type = "item", name = "harene-infused-vitamins", amount = 80 },
            {type = "item", name = "harene-infused-moonstone", amount = 1 },
            {type = "item", name = "metallurgic-science-pack", amount = 10 },
            {type = "item", name = "electromagnetic-science-pack", amount = 10 },
            {type = "item", name = "agricultural-science-pack", amount = 10 },
        },
        results = { 
            { type = "item", name = "archonic-science-pack", amount = 200 },
        },
        main_product = "archonic-science-pack",
        category = "crafting",
    },
    {
        type = "recipe",
        name = "moonstone-chest",
        enabled = false,
        energy_required = 3,
        ingredients = { 
            {type = "item", name = "harene-glob-core", amount = 1 },
            {type = "item", name = "harene-infused-moonstone", amount = 2 },
        },
        results = { 
            { type = "item", name = "moonstone-chest", amount = 1 },
        },
        main_product = "moonstone-chest",
        category = "crafting",
    },
}

recycle_core("harene-assembler", "harene-ears-core")
recycle_core("harene-transmuter", "harene-ears-core")
recycle_core("harene-extractor", "harene-ears-core")
recycle_core("moonstone-chest", "harene-glob-core")