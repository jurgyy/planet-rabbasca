local recycling = require("__quality__.prototypes.recycling")
local r = require("__planet-rabbasca__.util")

data:extend {
    {
        type = "item-subgroup",
        name = "rabbasca",
        group = "production"
    },
    util.merge {
        table.deepcopy(data.raw["item-subgroup"]["production-machine"]),
        { name = "production-machine-infused" }
    },
    {
        type = "item-subgroup",
        name = "rabbasca-vault-extraction",
        group = "intermediate-products"
    },
    {
        type = "item-subgroup",
        name = "rabbasca-matter-printer",
        group = "intermediate-products"
    },
    {
        type = "item-subgroup",
        name = "rabbasca-matter-printer-unpack",
        group = "intermediate-products"
    },
    {
        type = "recipe-category",
        name = "rabbasca-matter-printer-unpack",
    },
    {
        type = "recipe-category",
        name = "complex-machinery",
    },
    {
        type = "recipe-category",
        name = "harene-infusion"
    },
    {
        type = "recipe-category",
        name = "harene-synthesis"
    },
    {
        type = "recipe-category",
        name = "rabbasca-vault-extraction",
    },
    {
        type = "recipe-category",
        name = "rabbasca-vault-hacking",
    },
    {
        type = "recipe",
        name = "smart-solution",
        enabled = false,
        energy_required = 5.0,
        ingredients = { 
            {type = "fluid", name = "beta-carotene", amount = 30 },
            {type = "item", name = "protein-powder", amount = 3 },
            {type = "item", name = "megabrain", amount = 1 },
        },
        results = { { type = "item", name = "smart-solution", amount = 5 } },
        main_product = "smart-solution",
        category = "organic-or-chemistry",
    },
    {
        type = "recipe",
        name = "power-solution",
        energy_required = 5.0,
        enabled = false,
        ingredients = { 
            {type = "fluid", name = "harene-gas",    amount = 5 },
            {type = "fluid", name = "beta-carotene", amount = 40 },
            {type = "item", name = "iron-plate",     amount = 1 },
        },
        results = { 
            { type = "item", name = "power-solution", amount = 3 },
        },
        hide_from_player_crafting = true,
        main_product = "power-solution",
        category = "organic-or-chemistry",
    },
    {
        type = "recipe",
        name = "beta-carotene",
        energy_required = 5.0,
        enabled = false,
        ingredients = { 
            {type = "fluid", name = "energetic-residue", amount = 30 },
            {type = "item", name = "rabbasca-carotene-powder", amount = 100 },
        },
        results = { { type = "fluid", name = "beta-carotene", amount = 60 } },
        main_product = "beta-carotene",
        hide_from_player_crafting = true,
        category = "organic-or-chemistry",
    },
    {
        type = "recipe",
        name = "haronite",
        -- enabled = false,
        energy_required = 20,
        ingredients = { 
            {type = "fluid", name = "harene-gas", amount = 100 },
            {type = "item",  name = "stone", amount = 5 },
            {type = "item",  name = "power-solution", amount = 1 },
        },
        results = { 
            { type = "item", name = "haronite", amount = 5  },
        },
        main_product = "haronite",
        category = "harene-infusion",
        hide_from_player_crafting = true,
        result_is_always_fresh = true,
        reset_freshness_on_craft = true,
        preserve_products_in_machine_output = true
    },
    {
        type = "recipe",
        name = "haronite-catalyst",
        enabled = false,
        energy_required = 3,
        ingredients = { 
            {type = "fluid", name = "energetic-residue", amount = 50 },
            {type = "fluid", name = "harene-gas", amount = 50 },
            {type = "item",  name = "calcite", amount = 10 },
            {type = "item",  name = "smart-solution", amount = 2 },
        },
        results = { 
            { type = "item", name = "haronite-catalyst", amount = 10  },
        },
        main_product = "haronite-catalyst",
        category = "harene-infusion",
        hide_from_player_crafting = true,
    },
    {
        type = "recipe",
        name = "harene",
        enabled = false,
        energy_required = 80,
        ingredients = { 
            {type = "item",  name = "haronite-catalyst", amount = 10 },
            {type = "item",  name = "haronite", amount = 50 },
        },
        results = { 
            { type = "fluid", name = "harene", amount =  5   },
            { type = "item",  name = "calcite", amount = 12  },
            { type = "item",  name = "stone",   amount = 20  },
        },
        main_product = "harene",
        category = "metallurgy",
    },
    {
        type = "recipe",
        name = "infused-haronite-plate",
        enabled = false,
        energy_required = 8,
        ingredients = { 
            {type = "fluid", name = "harene", amount = 20 },
        },
        results = { 
            { type = "item", name = "infused-haronite-plate", amount = 50  },
        },
        main_product = "infused-haronite-plate",
        category = "harene-infusion",
    },
    {
        type = "recipe",
        name = "lubricant-from-copyslop",
        icons = { 
            { icon = data.raw["fluid"]["rabbasca-copyslop"].icon, scale = 0.7, shift = { 0, -6 } },
            { icon = data.raw["fluid"]["lubricant"].icon, scale = 0.7, shift = { 0, 6 } },
        },
        enabled = false,
        energy_required = 5.0,
        ingredients = { 
            {type = "fluid", name = "rabbasca-copyslop", amount = 50 },
        },
        results = { { type = "fluid", name = "lubricant", amount = 10 } },
        main_product = "lubricant",
        category = "crafting-with-fluid",
    },
    {
        type = "recipe",
        name = "machining-assembler",
        enabled = false,
        energy_required = 20.0,
        ingredients = { 
            -- {type = "item", name = "infused-haronite-plate", amount = 10 },
            {type = "item", name = "steel-plate", amount = 200 },
            {type = "item", name = "tungsten-plate", amount = 20 },
            {type = "item", name = "iron-gear-wheel", amount = 69 },
            {type = "item", name = "refined-concrete", amount = 50 },
            {type = "item", name = "advanced-circuit", amount = 50 },
            {type = "fluid", name = "lubricant", amount = 200 },
        },
        results = { { type = "item", name = "machining-assembler", amount = 1 } },
        surface_conditions = {{property = "harenic-energy-signatures", min = 0.5}},
        main_product = "machining-assembler",
        category = "crafting-with-fluid",
    },
    {
        type = "recipe",
        name = "harene-enrichment-center",
        enabled = false,
        energy_required = 10,
        ingredients = { 
            {type = "item", name = "iron-plate", amount = 80 },
            {type = "item", name = "steel-plate", amount = 20 },
            {type = "item", name = "advanced-circuit", amount = 20 },
            {type = "item", name = "pipe", amount = 10 },
        },
        results = { 
            { type = "item", name = "harene-enrichment-center", amount = 1 },
        },
        main_product = "harene-enrichment-center",
        category = "crafting"
    },
    {
        type = "recipe",
        name = "rabbasca-copy-unpacker",
        enabled = false,
        energy_required = 5,
        ingredients = { 
            {type = "item", name = "iron-plate", amount = 7 },
            {type = "item", name = "iron-gear-wheel", amount = 2 },
            {type = "item", name = "electronic-circuit", amount = 5 },
        },
        results = { 
            { type = "item", name = "rabbasca-copy-unpacker", amount = 1 },
        },
        main_product = "rabbasca-copy-unpacker",
        category = "crafting"
    },
    {
        type = "recipe",
        name = "rabbasca-remote-receiver",
        enabled = false,
        energy_required = 5,
        ingredients = { 
            {type = "item", name = "harene-ears-core", amount = 1 },
            {type = "item", name = "vision-circuit",  amount = 20 },
            {type = "item", name = "iron-gear-wheel",   amount = 30 },
            {type = "item", name = "tungsten-plate",   amount = 2 },
            {type = "item", name = "radar",   amount = 1 },
        },
        results = { 
            { type = "item", name = "rabbasca-remote-receiver", amount = 1 },
        },
        surface_conditions = {{property = "harenic-energy-signatures", min = 0.5}},
        main_product = "rabbasca-remote-receiver",
        category = "crafting"
    },
        {
        type = "recipe",
        name = "rabbasca-remote-builder",
        enabled = false,
        energy_required = 5,
        ingredients = { 
            {type = "item", name = "vision-circuit",  amount = 20 },
            {type = "item", name = "iron-gear-wheel",   amount = 30 },
            {type = "item", name = "superconductor",   amount = 5 },
        },
        results = { 
            { type = "item", name = "rabbasca-remote-builder", amount = 1 },
        },
        surface_conditions = {{property = "harenic-energy-signatures", min = 0.5}},
        main_product = "rabbasca-remote-builder",
        category = "crafting"
    },
    {
        type = "recipe",
        name = "megabrain",
        enabled = false,
        energy_required = 5,
        ingredients = { 
            {type = "item", name = "jellynut", amount = 1 },
            {type = "fluid", name = "harene-gas", amount = 100 },
            {type = "fluid", name = "beta-carotene", amount = 100 },
        },
        results = { 
            { type = "item", name = "megabrain", amount = 1 },
        },
        main_product = "megabrain",
        category = "organic",
    },
    {
        type = "recipe",
        name = "vision-circuit",
        enabled = false,
        energy_required = 7,
        ingredients = {
            {type = "item", name = "electronic-circuit", amount = 5 }, 
            {type = "item", name = "advanced-circuit", amount = 1 },
            {type = "fluid", name = "beta-carotene", amount = 10  },

        },
        results = { 
            { type = "item", name = "vision-circuit", amount = 1 },
        },
        main_product = "vision-circuit",
        category = "electronics-with-fluid",
    },
    {
        type = "recipe",
        name = "bunnyhop-engine",
        enabled = false,
        energy_required = 15,
        ingredients = { 
            {type = "item", name = "harene-ears-core", amount = 1 },
            -- {type = "item", name = "harene-glob-core", amount = 1 },
            {type = "item", name = "power-solution", amount = 20 },
            {type = "item", name = "engine-unit", amount = 5 },
            {type = "item", name = "rabbasca-turbofin", amount = 100 },
        },
        results = { 
            { type = "item", name = "bunnyhop-engine", amount = 1 },
        },
        main_product = "bunnyhop-engine",
        category = "crafting",
    },
    {
        type = "recipe",
        name = "rabbasca-turbofish",
        enabled = false,
        energy_required = 15,
        ingredients = { 
            {type = "item", name = "rabbasca-turbofish", amount = 2 },
            {type = "item", name = "protein-powder", amount = 5  },
            {type = "fluid", name = "beta-carotene", amount = 50 },
        },
        results = { 
            { type = "item", name = "rabbasca-turbofish", amount = 3, ignored_by_productivity = 2 },
        },
        main_product = "rabbasca-turbofish",
        category = "organic",
    },
    {
        type = "recipe",
        name = "ultranutritious-science-pack",
        enabled = false,
        energy_required = 17,
        ingredients = { 
            {type = "item", name = "smart-solution", amount = 2 },
            {type = "item", name = "power-solution", amount = 3 },
        },
        results = { 
            { type = "item", name = "ultranutritious-science-pack", amount = 6 },
        },
        main_product = "ultranutritious-science-pack",
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
    {
        type = "recipe",
        name = "rabbasca-turbofin",
        enabled = false,
        energy_required = 1,
        ingredients = { 
            {type = "item", name = "rabbasca-turbofish", amount = 1 },
        },
        results = { {type = "item", name = "rabbasca-turbofin", amount = 2} },
        main_product = "rabbasca-turbofin",
        category = "crafting",
    },
    {
        type = "recipe",
        name = "harene-copy-core",
        enabled = false,
        energy_required = 8,
        ingredients = { 
            {type = "fluid", name = "rabbasca-copyslop", amount = 50 },
            -- {type = "fluid", name = "energetic-residue", amount = 5 },
        },
        results = { {type = "item", name = "harene-copy-core", amount = 1, ignored_by_productivity = 1} },
        main_product = "harene-copy-core",
        category = "crafting-with-fluid",
        surface_conditions = {{property = "harenic-energy-signatures", min = 0.5}}
    },
    {
        type = "recipe",
        name = "rabbasca-copyslop",
        enabled = false,
        energy_required = 3,
        ingredients = { 
            { type = "item", name = "harene-copy-core-recharging", amount = 1 }
        },
        
        results = { {type = "fluid", name = "rabbasca-copyslop", amount = 50, ignored_by_productivity = 50 } },
        main_product = "rabbasca-copyslop",
        category = "crafting-with-fluid",
    },
    {
        type = "recipe",
        name = "blank-vault-key",
        enabled = false,
        energy_required = 3,
        ingredients = { 
            {type = "item", name = "advanced-circuit", amount = 2 },
            {type = "item", name = "rabbasca-turbofin", amount = 1 },
            {type = "fluid", name = "beta-carotene", amount = 20 },
        },
        results = { {type = "item", name = "blank-vault-key", amount = 1} },
        main_product = "blank-vault-key",
        category = "crafting-with-fluid",
    },
    {
        type = "recipe",
        name = "harene-powered-space-platform-starter-pack",
        enabled = false,
        energy_required = 30,
        ingredients = { 
            {type = "item", name = "harene-ears-core", amount = 1 },
            {type = "item", name = "space-platform-starter-pack", amount = 1 },
        },
        results = { {type = "item", name = "harene-powered-space-platform-starter-pack", amount = 1} },
        main_product = "harene-powered-space-platform-starter-pack",
        category = "crafting",
    }
}

r.create_vault_recipe("harene-ears-core-protocol", 1, 120,  true)
r.create_vault_recipe("harene-glob-core",  3, 35,  false)
r.create_vault_recipe("harene-copy-core-recharging",  1, 18,  true)
-- r.create_vault_recipe("harene-solvent",    1, 2.5, false)
-- create_vault_recipe("rabbascan-encrypted-vault-data", 10, 3, true)
-- create_vault_recipe("harene-cubic-core", 1, 10, false)

r.create_duplication_recipe("iron-plate", 1, 100)
r.create_duplication_recipe("steel-plate", 1, 20)
r.create_duplication_recipe("rabbasca-carotene-powder", 1, 200)
r.create_duplication_recipe("electronic-circuit", 1, 150)
r.create_duplication_recipe("advanced-circuit",   1, 25)
-- create_duplication_recipe("blank-vault-key",    1, 2)

-- r.create_duplication_recipe_triggered("uranium-rounds-magazine")
-- r.create_duplication_recipe("uranium-rounds-magazine", 1, 10)
-- r.create_duplication_recipe_triggered("plastic")
-- r.create_duplication_recipe("plastic", 1, 35)
-- r.create_duplication_recipe_triggered("explosives")
-- r.create_duplication_recipe("explosives", 1, 10)

recycling.generate_self_recycling_recipe(data.raw["item"]["rabbasca-console-scrap"])
local recipe = data.raw["recipe"]["rabbasca-console-scrap-recycling"]
recipe.enabled = false
recipe.hidden = false
recipe.category = "recycling-or-hand-crafting"
recipe.energy_required = 0.25
recipe.results = {
    { type = "item", name = "iron-plate", amount = 1, probability = 0.25 },
    { type = "item", name = "electronic-circuit", amount = 1, probability = 0.14 },
    { type = "item", name = "steel-plate", amount = 1, probability = 0.04 },
    { type = "item", name = "advanced-circuit",  amount = 1, probability = 0.01 },
    { type = "item", name = "blank-vault-key",  amount = 1, probability = 0.01 },
}
data:extend { recipe }

data:extend {
    {
        type = "recipe",
        name = "harene-infused-brick",
        main_product = "harene-infused-brick",
        category = "harene-infusion",
        reset_freshness_on_craft = true,
        result_is_always_fresh = true,
        hide_from_player_crafting = true,
        energy_required = 10,
        results = {{type = "item", name = "harene-infused-brick", amount = 2 }},
        ingredients = {
            { type = "item", name = "stone", amount = 10 },
            { type = "fluid", name = "harene-gas", amount = 10 },
            { type = "fluid", name = "beta-carotene", amount = 200 },
        }
    },
    {
        type = "recipe",
        name = "rabbasca-energetic-concrete",
        main_product = "rabbasca-energetic-concrete",
        category = "harene-infusion",
        hide_from_player_crafting = true,
        energy_required = 5,
        results = {{type = "item", name = "rabbasca-energetic-concrete", amount = 10 }},
        ingredients = {
            { type = "item", name = "harene-infused-brick", amount = 5 },
            { type = "item", name = "rabbasca-turbofin", amount = 5 },
            { type = "item", name = "iron-stick", amount = 16 },
            { type = "fluid", name = "energetic-residue", amount = 50 },
        }
    },
    {
        type = "recipe",
        name = "harene-infused-foundation",
        energy_required = 20,
        enabled = false,
        ingredients = { 
            {type = "item", name = "harene-glob-core", amount = 1 },
            {type = "item", name = "infused-haronite-plate", amount = 4 },
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
        energy_required = 20,
        ingredients = { 
            {type = "item", name = "harene-glob-core", amount = 1 },
            {type = "item", name = "infused-haronite-plate", amount = 4 },
            {type = "item", name = "space-platform-foundation", amount = 1 },
        },
        results = { 
            { type = "item", name = "harene-infused-space-platform", amount = 1 },
        },
        main_product = "harene-infused-space-platform",
        category = "crafting-with-fluid",
    },
}

data:extend {
    {
        type = "recipe",
        name = "rabbasca-vault-activate",
        -- enabled = true,
        -- hidden = true,
        energy_required = 3,
        -- ingredients = {{ type = "item", name = "blank-vault-key", amount = 1 }},
        results = {{ type = "item", name = "rabbasca-vault-access-protocol", amount = 1 }},
        main_product = "rabbasca-vault-access-protocol",
        category = "rabbasca-vault-hacking",
        auto_recycle = false,
        overload_multiplier = 1,
        result_is_always_fresh = true,
        allow_inserter_overload = false,
        hide_from_player_crafting = true
    },
    {
        type = "recipe",
        name = "rabbasca-vault-deactivate",
        -- enabled = true,
        -- hidden = true,
        energy_required = 3,
        ingredients = { },
        results = {{ type = "item", name = "rabbasca-vault-access-protocol", amount = 1 }},
        main_product = "rabbasca-vault-access-protocol",
        category = "rabbasca-vault-extraction",
        subgroup = "rabbasca-vault-extraction",
        order = "z[vault]-z[shutdown]",
        auto_recycle = false,
        overload_multiplier = 1,
        result_is_always_fresh = true,
        allow_inserter_overload = false,
        hide_from_player_crafting = true
    },
    {
        type = "recipe",
        name = "rabbasca-vault-regenerate-ears-core",
        icon = "__base__/graphics/icons/stone.png",
        enabled = true,
        hidden = true,
        energy_required = 3600,
        ingredients = { },
        results = { {type = "item", name = "rabbasca-vault-access-protocol", amount = 1} },
        category = "rabbasca-vault-hacking",
        auto_recycle = false,
        overload_multiplier = 1,
        result_is_always_fresh = true,
        allow_inserter_overload = false,
        hide_from_player_crafting = true
    }
}