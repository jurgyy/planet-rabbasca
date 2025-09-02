

data:extend { 
{
    type = "technology",
    name = "planet-discovery-rabbasca",
    icon = "__space-age__/graphics/technology/gleba.png",
    prerequisites = { "agriculture" },
    unit = {
        count = 1000,
        time = 60,
        ingredients = {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1},
            {"space-science-pack", 1},
        }
    }
},
{
    type = "technology",
    name = "harene-infusions",
    icon = "__space-age__/graphics/technology/gleba.png",
    prerequisites = { "harene-infusions", "vitaminic-studies" },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "archonic-science-pack"
      }
    },
    research_trigger =
    {
      type = "craft-item",
      entity = "harene-infused-vitamins"
    }
},
{
    type = "technology",
    name = "harene-infusions",
    icon = "__space-age__/graphics/technology/gleba.png",
    prerequisites = { "planet-discovery-rabbasca" },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "moonstone-pipe"
      }
    },
    research_trigger =
    {
      type = "mine-entity",
      entity = "rabbasca-infused-moonstone-rock"
    }
},
{
    type = "technology",
    name = "vitaminic-studies",
    icon = "__space-age__/graphics/technology/gleba.png",
    prerequisites = { "planet-discovery-rabbasca" },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "carotene-inserter"
      }
    },
    research_trigger =
    {
      type = "mine-entity",
      entity = "carotenoid"
    }
},
{
    type = "technology",
    name = "moonstone-ears-technology",
    icon = "__space-age__/graphics/technology/gleba.png",
    prerequisites = { "planet-discovery-rabbasca" },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "harene-extractor"
      },
      {
        type = "unlock-recipe",
        recipe = "harene-transmuter"
      },
      {
        type = "unlock-recipe",
        recipe = "harene-assembler",
      },
      {
          type = "unlock-recipe",
          recipe = "harene-extractor-recycling"
        },
        {
            type = "unlock-recipe",
            recipe = "harene-transmuter-recycling"
        },
        {
          type = "unlock-recipe",
          recipe = "harene-assembler-recycling"
        },
    },
    research_trigger =
    {
      type = "mine-entity",
      entity = "harene-extractor"
    }
},
{
    type = "technology",
    name = "moonstone-glob-technology",
    icon = "__space-age__/graphics/technology/gleba.png",
    prerequisites = { "planet-discovery-rabbasca" },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "moonstone-chest"
      },
      {
        type = "unlock-recipe",
        recipe = "moonstone-chest-recycling"
      },
    },
    research_trigger =
    {
      type = "mine-entity",
      entity = "moonstone-chest"
    }
},
{
    type = "technology",
    name = "harene-infused-foundations",
    icon = "__space-age__/graphics/technology/foundation.png",
    prerequisites = { "foundation", "planet-discovery-rabbasca" },
    unit = {
        count = 2000,
        time = 60,
        ingredients = {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1},
            {"space-science-pack", 1},
        }
    },
    effects =
    {
    {
        type = "unlock-recipe",
        recipe = "harene-infused-foundation"
    },
      {
        type = "unlock-recipe",
        recipe = "harene-infused-space-platform"
      },
    },
}
}