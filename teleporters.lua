-- Initialize shared table if it doesn't exist
teleporter_targets = teleporter_targets or {
    ["nauvis"] = {},
    ["vulcanus"] = {extra_inputs = {{type = "item", name = "steel-plate", amount = 5}}},
    ["gleba"] = {extra_inputs = {{type = "item", name = "landfill", amount = 1}}},
    ["fulgora"] = {},
    ["rabbasca"] = {},
    ["aquilo"] = {unlocked_by = "cryogenic-science-pack", extra_inputs = {{type = "item", name = "ice", amount = 10}}}
}

-- Provide a helper API for other mods
-- Other mods can require() this file in their data stage to add targets
local M = {}

function M.add_target(name, settings)
  teleporter_targets[name] = settings or {  }
end

function M.remove_target(name)
  teleporter_targets[name] = nil
end

function M.get_planets()
    return teleporter_targets
end

return M