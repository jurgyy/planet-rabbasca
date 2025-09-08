local color = {r=0.73, g=0.42, b=1}

local harene_resource = {
  type = "resource",
  name = "harene-vent",
  icons = {{ icon = "__space-age__/graphics/icons/fluorine-vent.png", tint = color }},
  flags = {"placeable-neutral"},
  category = "basic-fluid",
  order="a-b-f",
  infinite = true,
  highlight = true,
  minimum = 20000,
  normal = 100000,
  infinite_depletion_amount = 10,
  resource_patch_search_radius = 5,
  tree_removal_probability = 1.0,
  cliff_removal_probability = 1.0,
  tree_removal_max_distance = 64 * 64,
  minable =
  {
    mining_time = 1,
    results =
    {
      {
        type = "fluid",
        name = "harenic-sludge",
        amount_min = 1,
        amount_max = 1,
      }
    }
  },
  collision_mask = { layers = { resource = true } },
  tile_buildability_rules = {{ 
    area = {{-2.4, -2.4}, {2.4, 2.4}}, 
    required_tiles = { layers = { harene = true } },
    colliding_tiles = { layers = { is_object = true } },
    remove_on_collision = true 
  }},
  collision_box = {{ -1.5, -1.5}, {1.5, 1.5}},
  selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
  map_generator_bounding_box = {{-5, -5}, {5, 5}},
  autoplace = {
    tile_restriction = { "rabbasca-harene" },
    probability_expression = "rabbasca_harene_pools",
    richness_expression = "rabbasca_harene_richness",
  },
  stage_counts = {0},
  stages =
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/fluorine-vent/fluorine-vent",
      {
        priority = "extra-high",
        frame_count = 4,
        scale = 1.0,
        tint = color
      })
    }
  },

  draw_stateless_visualisation_under_building = false,
  stateless_visualisation =
  {
    {
      count = 1,
      render_layer = "smoke",
      animation = util.sprite_load("__space-age__/graphics/entity/lithium-brine/smoke-1",
      {
        priority = "extra-high",
        frame_count = 64,
        animation_speed = 0.35,
        tint = color,
        scale = 1.0,
        --shift = util.by_pixel( 0.5, -54.0)
      })
    },
    {
      count = 1,
      render_layer = "smoke",
      animation = util.sprite_load("__space-age__/graphics/entity/lithium-brine/smoke-2",
      {
        priority = "extra-high",
        frame_count = 64,
        animation_speed = 0.35,
        tint = util.multiply_color(color, 0.5),
        scale = 1.0,
        --shift = util.by_pixel( 0.5, -54.0)
      })
    },
    {
      count = 1,
      render_layer = "smoke",
      animation = {
        filename = "__space-age__/graphics/entity/fluorine-vent/fluorine-vent-gas-outer.png",
        frame_count = 47,
        line_length = 16,
        width = 90,
        height = 188,
        animation_speed = 0.5,
        shift = util.by_pixel(-2, -40),
        scale = 1.0,
        tint = util.multiply_color(color, 0.2)
      }
    },
    {
      count = 1,
      render_layer = "smoke",
      animation = {
        filename = "__space-age__/graphics/entity/fluorine-vent/fluorine-vent-gas-inner.png",
        frame_count = 47,
        line_length = 16,
        width = 40,
        height = 84,
        animation_speed = 0.5,
        shift = util.by_pixel(0, -14),
        scale = 1.0,
        tint = util.multiply_color(color, 0.1),
      }
    }
  },
  map_color = color,
  map_grid = false
}
data:extend{ harene_resource }

data:extend{ {
    type = "resource-category",
    name = "harene"
},
}