if mods["any-planet-start"] then
  APS.add_choice("rabbasca")
end

data:extend({
  {
      type = "bool-setting",
      name = "moonstone-inventory-created",
      setting_type = "runtime-global",
      hidden = true,
      default_value = false
  }
})