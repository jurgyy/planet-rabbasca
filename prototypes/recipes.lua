local recycling = require("__quality__.prototypes.recycling")

function create_duplication_recipe(item, input, output)
    local icons = table.deepcopy(data.raw["item"]["harene-copy-core"].icons)
    if data.raw["item"][item].icon then
        table.insert(icons, { icon = data.raw["item"][item].icon, scale = 0.7 })
    elseif data.raw["item"][item].icons then
        for _, icon in pairs(table.deepcopy(data.raw["item"][item].icons)) do
            icon.scale = (icon.scale or 1) * 0.7
            table.insert(icons, icon)
        end
    end
    data:extend {
    {
        type = "item",
        name = "rabbasca-"..item.."-duplicate",
        icons = icons,
        spoil_ticks = 60 * second,
        spoil_result = item,
        stack_size = data.raw["item"][item].stack_size,
        subgroup = "rabbasca-matter-printer",
    },
    {
        type = "recipe",
        name = "rabbasca-"..item.."-duplicate",
        enabled = false,
        energy_required = 30,
        ingredients = {
            { type = "item", name = "harene-copy-core", amount = 1 },
            { type = "fluid", name = "energetic-residue", amount = 10},
            { type = "item", name = item, amount = input},
        },
        results = { { type = "item", name = "rabbasca-"..item.."-duplicate", amount = output } },
        main_product = "rabbasca-"..item.."-duplicate",
        category = "crafting-with-fluid",
        reset_freshness_on_craft = true,
        result_is_always_fresh = true,
        auto_recycle = false,
    },
}
end

function create_vault_recipe(reward, amount, cost, has_no_prequisite)
data:extend{
  {
      type = "recipe",
      name = reward,
      preserve_products_in_machine_output = false,
      enabled = has_no_prequisite,
      hide_from_player_crafting = true,
      allow_decomposition = false,
      always_show_products = true,
      energy_required = cost,
      results = { { type = "item", name = reward, amount = amount, percent_spoiled = 0 } },
      reset_freshness_on_craft = true,
      result_is_always_fresh = true,
      main_product = reward,
      category = "rabbasca-vault-extraction",
      subgroup = "rabbasca-vault-extraction",
      auto_recycle = false,
      overload_multiplier = 1,
  }
}
end

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
            {type = "item", name = "harene-solvent", amount = 1 },
        },
        results = { { type = "item", name = "smart-solution", amount = 5 } },
        main_product = "smart-solution",
        category = "organic-or-chemistry",
    },
    {
        type = "recipe",
        name = "power-solution",
        energy_required = 5.0,
        ingredients = { 
            {type = "fluid", name = "energetic-residue", amount = 5 },
            {type = "fluid", name = "beta-carotene", amount = 20 },
            {type = "item", name = "harene-solvent", amount = 1 },
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
            {type = "fluid", name = "harene-gas", amount = 50 },
            {type = "item",  name = "rabbasca-moonstone", amount = 5 },
            {type = "item",  name = "power-solution", amount = 1 },
        },
        results = { 
            { type = "item", name = "haronite", amount = 6  },
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
        name = "rabbasca-moonstone",
        enabled = false,
        energy_required = 2,
        ingredients = { 
            {type = "item",  name = "haronite", amount = 1 },
        },
        results = { 
            { type = "item", name = "rabbasca-moonstone", amount = 1  },
            { type = "fluid", name = "energetic-residue", amount = 25  },
        },
        main_product = "rabbasca-moonstone",
        category = "organic-or-chemistry",
        hide_from_player_crafting = true,
    },
    {
        type = "recipe",
        name = "energetic-residue",
        enabled = false,
        energy_required = 2,
        ingredients = { 
            {type = "fluid",  name = "harenic-sludge", amount = 40 },
        },
        results = { 
            { type = "fluid", name = "harene-gas", amount = 1 },
            { type = "fluid", name = "energetic-residue", amount = 10  },
            -- { type = "item", name = "rabbasca-moonstone", amount = 1, probability = 0.08  },
        },
        main_product = "energetic-residue",
        category = "organic-or-chemistry",
        hide_from_player_crafting = true,
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
        name = "harene-enrichment-center",
        enabled = false,
        energy_required = 10,
        ingredients = { 
            {type = "item", name = "harene-ears-core", amount = 1 },
            {type = "item", name = "advanced-circuit", amount = 10 },
            {type = "item", name = "pipe", amount = 5 },
        },
        results = { 
            { type = "item", name = "harene-enrichment-center", amount = 1 },
        },
        main_product = "harene-enrichment-center",
        category = "crafting"
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
    {
        type = "recipe",
        name = "supercharged-jellynut-seed",
        enabled = false,
        energy_required = 5,
        ingredients = { 
            {type = "item", name = "jellynut-seed", amount = 5 },
            {type = "fluid", name = "energetic-residue", amount = 100 },
        },
        results = { 
            { type = "item", name = "supercharged-jellynut-seed", amount = 5 },
        },
        main_product = "supercharged-jellynut-seed",
        category = "organic",
    },
    {
        type = "recipe",
        name = "bunnyhop-engine",
        enabled = false,
        energy_required = 15,
        ingredients = { 
            {type = "item", name = "harene-ears-core", amount = 1 },
            {type = "item", name = "harene-glob-core", amount = 1 },
            {type = "item", name = "smart-solution", amount = 20 },
            {type = "item", name = "infused-haronite-plate", amount = 20 },
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
        energy_required = 2,
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
        name = "rabbascan-security-key-a",
        enabled = false,
        energy_required = 1,
        ingredients = { 
            {type = "item", name = "infused-haronite-plate", amount = 1 },
            {type = "item", name = "rabbasca-turbofin", amount = 2 },
        },
        results = { {type = "item", name = "rabbascan-security-key-a", amount = 6} },
        main_product = "rabbascan-security-key-a",
        category = "crafting",
    },
    {
        type = "recipe",
        name = "rabbascan-security-key-e",
        enabled = false,
        energy_required = 1,
        ingredients = { 
            {type = "item", name = "infused-haronite-plate", amount = 1 },
            {type = "item", name = "rabbasca-turbofin", amount = 1 },
            {type = "item", name = "rabbasca-carotene-powder", amount = 20 },
        },
        results = { {type = "item", name = "rabbascan-security-key-e", amount = 4} },
        main_product = "rabbascan-security-key-e",
        category = "crafting",
    },
    {
        type = "recipe",
        name = "rabbascan-security-key-p",
        enabled = false,
        energy_required = 1,
        ingredients = { 
            {type = "item", name = "infused-haronite-plate", amount = 1 },
            {type = "item", name = "rabbasca-turbofin", amount = 1 },
        },
        results = { {type = "item", name = "rabbascan-security-key-p", amount = 2} },
        main_product = "rabbascan-security-key-p",
        category = "crafting",
    },
}

create_vault_recipe("harene-ears-core",  1, 20,  false)
create_vault_recipe("harene-glob-core",  3, 12,  false)
create_vault_recipe("harene-copy-core",  1, 8,   false)
create_vault_recipe("harene-solvent",    5, 2.5, false)
create_vault_recipe("rabbascan-encrypted-vault-data", 5, 3, true)
-- create_vault_recipe("harene-cubic-core", 1, 10, false)

create_duplication_recipe("iron-plate", 1, 100)
create_duplication_recipe("steel-plate", 1, 20)
create_duplication_recipe("rabbasca-carotene-powder", 1, 200)
create_duplication_recipe("electronic-circuit", 1, 150)
create_duplication_recipe("advanced-circuit",   1, 25)

recycling.generate_self_recycling_recipe(data.raw["item"]["rabbasca-console-scrap"])
local recipe = data.raw["recipe"]["rabbasca-console-scrap-recycling"]
recipe.enabled = false
recipe.hidden = false
recipe.category = "recycling-or-hand-crafting"
recipe.energy_required = 0.5
recipe.results = {
    { type = "item", name = "iron-plate", amount = 1, probability = 0.18 },
    { type = "item", name = "electronic-circuit", amount = 1, probability = 0.1 },
    { type = "item", name = "steel-plate", amount = 1, probability = 0.05 },
    { type = "item", name = "advanced-circuit",  amount = 1, probability = 0.01 },
}
data:extend { recipe }

data:extend {
    {
        type = "recipe",
        name = "hack-rabbascan-vault-extraction",
        icon = "__Krastorio2Assets__/icons/cards/utility-tech-card.png",
        -- enabled = false,
        -- hidden = true,
        energy_required = 5,
        ingredients = { 
            {type = "item", name = "rabbascan-security-key-e", amount = 1 },
        },
        results = { 
            { type = "item", name = "rabbasca-vault-access-protocol", amount = 1  },
        },
        category = "rabbasca-vault-hacking",
        auto_recycle = false,
        reset_freshness_on_craft = true,
        result_is_always_fresh = true,
        overload_multiplier = 1,
        allow_inserter_overload = false,
        hide_from_player_crafting = true
    },
    {
        type = "recipe",
        name = "hack-rabbascan-vault-research",
        icon = "__Krastorio2Assets__/icons/cards/matter-tech-card.png",
        -- enabled = false,
        -- hidden = true,
        energy_required = 5,
        ingredients = { 
            {type = "item", name = "rabbascan-security-key-a", amount = 1 },
        },
        results = { 
            { type = "item", name = "rabbasca-vault-access-protocol", amount = 1  },
        },
        category = "rabbasca-vault-hacking",
        auto_recycle = false,
        reset_freshness_on_craft = true,
        result_is_always_fresh = true,
        overload_multiplier = 1,
        allow_inserter_overload = false,
        hide_from_player_crafting = true
    },
    {
        type = "recipe",
        name = "hack-rabbascan-vault-power",
        icon = "__Krastorio2Assets__/icons/cards/production-tech-card.png",
        -- enabled = false,
        -- hidden = true,
        energy_required = 5,
        ingredients = { 
            {type = "item", name = "rabbascan-security-key-p", amount = 1 },
        },
        results = { 
            { type = "item", name = "rabbasca-vault-access-protocol", amount = 1  },
        },
        category = "rabbasca-vault-hacking",
        auto_recycle = false,
        reset_freshness_on_craft = true,
        result_is_always_fresh = true,
        overload_multiplier = 1,
        allow_inserter_overload = false,
        hide_from_player_crafting = true
    },
    {
        type = "recipe",
        name = "rabbasca-sabotage-console",
        -- enabled = false,
        -- hidden = true,
        energy_required = 7,
        ingredients = { 
            {type = "item", name = "rabbasca-moonstone", amount = 1 },
        },
        results = { 
            { type = "item", name = "rabbasca-vault-access-protocol", amount = 1  },
            { type = "item", name = "rabbasca-console-scrap", amount = 35  },
            { type = "item", name = "infused-haronite-plate", amount = 3  },
        },
        main_product = "rabbasca-console-scrap",
        category = "rabbasca-vault-hacking",
        auto_recycle = false,
        reset_freshness_on_craft = true,
        result_is_always_fresh = true,
        overload_multiplier = 1,
        allow_inserter_overload = false,
        hide_from_player_crafting = true
    },
}