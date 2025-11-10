local r = require("__planet-rabbasca__.util")

r.create_vault_recipe("vault-protocol-haronite", {
  icons = {
    {icon = "__Krastorio2Assets__/icons/entities/stabilizer-charging-station.png"},
    {icon = data.raw["item"]["haronite"].icon, shift = {8, 8}, scale = 0.4},
  },
  results = {{type = "item", name = "haronite", amount = 5 }}, 
  energy_required = 90,
  main_product = "haronite",
  maximum_productivity = 9,
  allow_productivity = true,
})
r.create_vault_recipe("vault-protocol-harene-ears-subcore",
{
  icons = {
    {icon = "__Krastorio2Assets__/icons/entities/stabilizer-charging-station.png"},
    {icon = data.raw["item"]["harene-ears-core"].icon, shift = {8, 8}, scale = 0.4},
  },
  results = {{type = "item", name = "harene-ears-subcore", amount = 1 }}, 
  energy_required = 900,
  main_product = "harene-ears-subcore",
  maximum_productivity = 9,
  allow_productivity = true,
})
r.create_vault_recipe("vault-protocol-iron-ore", {
  icons = {
    {icon = "__Krastorio2Assets__/icons/entities/stabilizer-charging-station.png"},
    {icon = data.raw["item"]["iron-ore"].icon, shift = {8, 8}, scale = 0.4},
  },
  results = {
    {type = "item", name = "iron-ore", amount = 75 },
  }, 
  energy_required = 25,
  maximum_productivity = 9,
  allow_productivity = true,
})
r.create_vault_recipe("vault-protocol-copper-ore", {
  icons = {
    {icon = "__Krastorio2Assets__/icons/entities/stabilizer-charging-station.png"},
    {icon = data.raw["item"]["copper-ore"].icon, shift = {8, 8}, scale = 0.4},
  },
  results = {
    {type = "item", name = "copper-ore", amount = 60 },
  }, 
  energy_required = 25,
  maximum_productivity = 9,
  allow_productivity = true,
})
r.create_vault_recipe("vault-protocol-water", {
  icons = {
    {icon = "__Krastorio2Assets__/icons/entities/stabilizer-charging-station.png"},
    {icon = data.raw["fluid"]["water"].icon, shift = {8, 8}, scale = 0.4},
  },
  results = {
    {type = "item", name = "water-barrel", amount = 10 },
  }, 
  energy_required = 40,
  maximum_productivity = 9,
  allow_productivity = true,
})
r.create_vault_recipe("vault-protocol-catalysts", {
  icons = {
    {icon = "__Krastorio2Assets__/icons/entities/stabilizer-charging-station.png"},
    {icon = data.raw["item"]["sulfur"].icon, shift = {-8, 8}, scale = 0.4},
    {icon = data.raw["item"]["calcite"].icon, shift = {8, 8}, scale = 0.4},
  },
  results = {
    {type = "item", name = "calcite", amount = 10 },
    {type = "item", name = "sulfur", amount = 7 },
  }, 
  energy_required = 20,
  maximum_productivity = 9,
  allow_productivity = true,
})