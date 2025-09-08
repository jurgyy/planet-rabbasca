local utils = require("__any-planet-start__.utils")

utils.remove_tech("electronics", true, true)
utils.add_recipes("automation-science-pack", { "rabbasca-automation-science-pack" })

data:extend {
    {
        type = "recipe",
        name = "rabbasca-automation-science-pack",
        icons = {
            { icon = data.raw["item"]["carotene-powder"].icon, scale = 0.3, shift = { 12, -12 } },
            { icon = data.raw["item"]["automation-science-pack"].icon },
        }
        enabled = false,
        energy_required = 10,
        ingredients = { 
            {type = "item", name = "rabbasca-carotene-powder", amount = 20 },
            {type = "item", name = "iron-gear-wheel", amount = 1 },
        },
        results = { { type = "item", name = "automation-science-pack", amount = 2 } },
        main_product = "automation-science-pack",
        category = "crafting",
    },
}