if mods["any-planet-start"] then
  APS.add_choice("rabbasca")
end

data:extend{
  {
    type = "bool-setting",
    name = "rabbasca-cap-bunnyhop-research",
    setting_type = "startup",
    default_value = false,
    allow_blank = false
  },
  {
    type = "bool-setting",
    name = "rabbasca-bunnyhop-force-naked",
    setting_type = "startup",
    default_value = false,
    allow_blank = false
  },
  {
    type = "bool-setting",
    name = "rabbasca-bunnyhop-rabbasca-only",
    setting_type = "startup",
    default_value = false,
    allow_blank = false
  },
  {
    type = "string-setting",
    name = "rabbasca-orbits",
    setting_type = "startup",
    default_value = "gleba",
    allowed_values = {
      "gleba",
      "nauvis",
      "fulgora",
      "vulcanus"
    },
    allow_blank = false
  },
}