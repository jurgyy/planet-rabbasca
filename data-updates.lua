local rutil = require("__planet-rabbasca__.util")

function make_capsule(proto) 
return {
    type = "capsule",
    icon = proto.icon,
    name = "bunnyhop-engine-"..proto.name,
    stack_size = 1,
    subgroup = "transport",
    order = "b[personal-transport]-c[startertron]",
    capsule_action = {
      type = "use-on-self",
      uses_stack = true,
      attack_parameters = {
        type = "projectile",
        activation_type = "consume",
        ammo_category = "capsule",
        cooldown = 1 * minute,
        range = 0,
        ammo_type =
        {
          target_type = "position",
          action =
          {
            type = "direct",
            action_delivery =
            {
              type = "instant",
              target_effects =
              {
                {
                  type = "script",
                  effect_id = "rabbasca_teleport_".. proto.name
                }
              }
            }
          }
        }
      }
    }  
  }
end

function make_recipe(proto, settings) 
   -- build ingredient list
  local ingredients = {
    {type = "item", name = "bunnyhop-engine", amount = 1},
  }
  if settings.extra_inputs then
    for _, ing in pairs(settings.extra_inputs) do
      table.insert(ingredients, table.deepcopy(ing))
    end
  end

  local recipe = {
    type = "recipe",
    name = "bunnyhop-engine-" .. proto.name,
    icon = proto.icon,
    energy_required = 180,
    enabled = settings.unlocked_by == nil,
    ingredients = ingredients,
    unlock_results = true,
    results = {{type = "item", name = "bunnyhop-engine-" .. proto.name, amount = 1}},
    category = "crafting",
  }


function get_type(crafter)
    for _, type in pairs({"assembling-machine", "lab", "rocket-silo", "furnace"}) do
        if data.raw[type][crafter] then return type end
    end
    return nil
end

function create_infused_crafter(crafter)
    local type = get_type(crafter) -- TODO: how to raise error?
    local original = data.raw[type][crafter]
    local new = table.deepcopy(original)
    local icons = {}
    if data.raw["item"][crafter].icon then
        table.insert(icons, { icon = data.raw["item"][crafter].icon, scale = 0.7 })
    elseif data.raw["item"][crafter].icons then
        for _, icon in pairs(table.deepcopy(data.raw["item"][crafter].icons)) do
            icon.scale = (icon.scale or 1) * 0.7
            table.insert(icons, icon)
        end
    end
    table.insert(icons, { icon = data.raw["item"]["haronite"].icon, scale = 0.5, shift = {16, -16} })
    local new_item = table.deepcopy(data.raw["item"][crafter])
    new_item.name = "harene-infused-"..original.name
    new_item.icons = icons
    new_item.place_result = "harene-infused-"..original.name
    new_item.subgroup = "production-machine-infused"
    new_item.factoriopedia_alternative = original.name

    new.name = "harene-infused-"..original.name
    -- new.next_upgrade =  original.name
    -- new.energy_usage = original.energy_usage / 2
    if new.crafting_speed then
      new.crafting_speed = 4 * original.crafting_speed
    else
      new.researching_speed = 4 * original.researching_speed
    end
    new.placeable_by = { item = "harene-infused-"..original.name, count = 1 }
    new.minable.result = "harene-infused-"..original.name
    new.tile_buildability_rules = { rutil.restrict_to_harene_pool(new.collision_box) }
    new.energy_source = util.merge{
        original.energy_source,
        -- rutil.harene_burner()
        { type = "void" }
    }

    data:extend {
      new,
      new_item,
      {
        type = "recipe",
        name = "harene-infused-"..original.name,
        enabled = false,
        energy_required = 30,
        ingredients = {
            { type = "item", name = "harene-ears-core", amount = 1 },
            { type = "fluid", name = "harene-gas", amount = 50 },
            { type = "item", name = original.name, amount = 1},
        },
        results = { { type = "item", name = "harene-infused-"..original.name, amount = 1 } },
        main_product = "harene-infused-"..original.name,
        category = "harene-infusion",
        maximum_productivity = 0
      }
    }
    local unlocks = data.raw["technology"]["rabbasca-ears-technology"].effects
    table.insert(unlocks,       
    {
        type = "unlock-recipe",
        recipe = "harene-infused-"..original.name
    })
end


  -- gate behind tech if specified
  local tech = data.raw.technology[settings.unlocked_by] or data.raw.technology["moonstone-glob-technology"]
  if tech then
    tech.effects = tech.effects or {}
    table.insert(tech.effects, {type = "unlock-recipe", recipe = recipe.name})
  else
    log("Warning: technology " .. settings.unlocked_by .. " not found")
  end
  if settings.unlocked_by then
    -- add unlock effect to technology
  end

  return recipe 
end

for planet, settings in pairs(require("__planet-rabbasca__.teleporters").get_planets()) do
    local proto = data.raw["planet"][planet]
    if settings ~= nil and proto ~= nil then
        data:extend{ make_capsule(proto), make_recipe(proto, settings) }
    end
end

for _, pole in pairs(data.raw["electric-pole"]) do 
  if pole.surface_conditions then
    table.insert(pole.surface_conditions, {property = "harenic-energy-signatures", max = 0.5})
  else
    pole.surface_conditions = {{property = "harenic-energy-signatures", max = 0.5}}
  end
end

for _, lab in pairs(data.raw["lab"]) do 
  if lab.inputs[1] == "automation-science-pack" then
    table.insert(lab.inputs, "ultranutritious-science-pack")
  end
end

create_infused_crafter("assembling-machine-2")
create_infused_crafter("assembling-machine-3")
create_infused_crafter("chemical-plant")
create_infused_crafter("oil-refinery")
create_infused_crafter("foundry")
create_infused_crafter("electromagnetic-plant")
create_infused_crafter("cryogenic-plant")
create_infused_crafter("lab")
create_infused_crafter("biolab")