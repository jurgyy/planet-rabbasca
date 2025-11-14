
local bunnyhop_engine = data.raw["item"]["bunnyhop-engine-equipment"]
local console = data.raw["furnace"]["rabbasca-vault-console"]
console.result_inventory_size = 0 -- castra compatibility; not required but looks nicer
console.crafting_speed_quality_multiplier = { }
for _, quality in pairs(data.raw["quality"]) do
  console.crafting_speed_quality_multiplier[quality.name] = 1
  bunnyhop_engine.custom_tooltip_fields[1].quality_values[quality.name] = {"tooltip-value.bunnyhop-engine-weight-multiplier", tostring((quality.default_multiplier or 1) * 100)}
end

require("__planet-rabbasca__.compatibility.muluna-final-fixes")