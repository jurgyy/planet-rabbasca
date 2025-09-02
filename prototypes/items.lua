data:extend {
{
    type = "item",
    icon = "__space-age__/graphics/icons/foundry.png",
    name = "crystallized-harene",
    stack_size = 500,
    subgroup = "transport",
    order = "b[personal-transport]-c[startertron]",
},
{
    type = "item",
    icon = "__base__/graphics/icons/steel-plate.png",
    name = "haronite-plate",
    stack_size = 38,
    subgroup = "transport",
    order = "b[personal-transport]-c[startertron]",
},
{
    type = "item",
    icon = "__space-age__/graphics/icons/fusion-generator.png",
    name = "harene-ears-core",
    stack_size = 10,
    subgroup = "transport",
    order = "b[personal-transport]-c[startertron]",
},
{
    type = "item",
    icon = "__space-age__/graphics/icons/small-wriggler.png",
    name = "harene-glob-core",
    stack_size = 10,
    subgroup = "transport",
    order = "b[personal-transport]-c[startertron]",
},
{
    type = "item",
    icon = "__space-age__/graphics/icons/biolab.png",
    name = "harene-data-core",
    stack_size = 10,
    subgroup = "transport",
    order = "b[personal-transport]-c[startertron]",
},
{
    type = "item",
    icon = "__base__/graphics/icons/steam-engine.png",
    name = "harene-engine",
    stack_size = 10,
    subgroup = "transport",
    order = "b[personal-transport]-c[startertron]",
},
{
    type = "item",
    icon = "__space-age__/graphics/icons/spoilage-3.png",
    name = "rabbasca-carotene-powder",
    stack_size = 50,
    subgroup = "transport",
    order = "b[personal-transport]-c[startertron]",
},
{
    type = "item",
    icon = "__space-age__/graphics/icons/big-volcanic-rock.png",
    name = "rabbasca-moonstone",
    stack_size = 50,
    subgroup = "transport",
    order = "b[personal-transport]-c[startertron]",
},
{
    type = "item",
    icon = "__space-age__/graphics/icons/tungsten-ore.png",
    name = "harene-infused-moonstone",
    stack_size = 1,
    subgroup = "transport",
    order = "b[personal-transport]-c[startertron]",
},
{
    type = "item",
    icon = "__space-age__/graphics/icons/tesla-turret.png",
    name = "moonstone-turret",
    stack_size = 5,
    subgroup = "transport",
    order = "b[personal-transport]-c[startertron]",
},
{
    type = "item",
    icon = "__space-age__/graphics/icons/bioflux.png",
    name = "harene-infused-vitamins",
    stack_size = 200,
    subgroup = "transport",
    order = "b[personal-transport]-c[startertron]",
},
{
    type = "item",
    icon = "__space-age__/graphics/icons/metallurgic-science-pack.png",
    name = "archonic-science-pack",
    stack_size = 200,
    subgroup = "transport",
    order = "b[personal-transport]-c[startertron]",
},
{
    type = "item",
    icon = "__space-age__/graphics/icons/foundation.png",
    name = "harene-infused-foundation",
    stack_size = 20,
    subgroup = "transport",
    order = "b[personal-transport]-c[startertron]",
    place_as_tile =
    {
      result = "harene-infused-foundation",
      condition_size = 1,
      condition = {layers={water_tile=true, ground_tile = true}},
      invert = true,
    }
},
{
    type = "item",
    icon = "__space-age__/graphics/icons/space-platform-foundation.png",
    name = "harene-infused-space-platform",
    stack_size = 50,
    subgroup = "transport",
    order = "b[personal-transport]-c[startertron]",
    place_as_tile =
    {
      result = "harene-infused-space-platform",
      condition_size = 1,
      condition = {layers={empty_space=true}},
      invert = true,
    }
},
{
    type = "item",
    icon = "__space-age__/graphics/icons/nutrients.png",
    name = "harene-nutrients",
    stack_size = 1,
    subgroup = "transport",
    order = "b[personal-transport]-c[startertron]",
    fuel_category = "nutrients",
    fuel_value = "675MJ",
    spoil_ticks = 2 * minute,
    -- spoil_result = "rabbasca-carotene-powder",
    spoil_to_trigger_result =
    {
      items_per_trigger = 1,
      trigger =
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          source_effects =
          {
            {
              type = "create-entity",
              entity_name = "carotenoid",
              affects_target = true,
              show_in_tooltip = true,
              trigger_created_entity = true,
              as_enemy = false,
              find_non_colliding_position = true,
              non_colliding_search_radius = 3,
              abort_if_over_space = true,
              non_colliding_fail_result =
              {
                type = "direct",
                action_delivery =
                {
                  type = "instant",
                  source_effects =
                  {
                    {
                      type = "create-entity",
                      entity_name = "boompuff-explosion",
                      affects_target = true,
                      show_in_tooltip = false,
                      as_enemy = true,
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
},
}