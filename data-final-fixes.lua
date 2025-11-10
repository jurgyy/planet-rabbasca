
local console = data.raw["furnace"]["rabbasca-vault-console"]
console.result_inventory_size = 0
console.crafting_speed_quality_multiplier = { }
for _, quality in pairs(data.raw["quality"]) do
  console.crafting_speed_quality_multiplier[quality.name] = 1
end

require("__planet-rabbasca__.compatibility.muluna-final-fixes")