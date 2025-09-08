

data:extend { 
{
    type = "technology",
    name = "planet-discovery-rabbasca",
    icon = "__space-age__/graphics/technology/gleba.png",
    icon_size = 256,
    prerequisites = { "planet-discovery-gleba" },
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
    name = "leg-day-everyday",
    icon = "__space-age__/graphics/technology/fish-breeding.png",
    icon_size = 256,
    prerequisites = { "planet-discovery-rabbasca" },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "rabbasca-turbofin"
      },
      {
        type = "unlock-recipe",
        recipe = "protein-powder"
      },
      {
        type = "unlock-recipe",
        recipe = "smart-solution"
      },
    },
    research_trigger =
    {
      type = "mine-entity",
      entity = "rabbasca-turbofish",
    }
},
{
    type = "technology",
    name = "rabbascan-vault-accessibility",
    icon = "__Krastorio2Assets__/icons/cards/utility-tech-card.png",
    icon_size = 256,
    prerequisites = { "planet-discovery-rabbasca" },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "rabbascan-security-key-e"
      },
      {
        type = "unlock-recipe",
        recipe = "rabbasca-console-scrap-recycling"
      }
    },
    research_trigger =
    {
      type = "mine-entity",
      entity = "moonstone-rock"
    }
},
{
    type = "technology",
    name = "rabbascan-lost-technologies",
    icon = "__Krastorio2Assets__/icons/cards/matter-tech-card.png",
    icon_size = 256,
    prerequisites = { "rabbascan-vault-accessibility" },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "rabbascan-security-key-a"
      },
    },
    research_trigger =
    {
      type = "craft-item",
      item = "rabbascan-encrypted-vault-data"
    }
},
{
    type = "technology",
    name = "haronite-catalyst",
    icon = "__space-age__/graphics/technology/gleba.png",
    icon_size = 256,
    prerequisites = { "harene-solvent", "beta-carotene" },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "haronite-catalyst"
      }
    },
    research_trigger =
    {
      type = "craft-item",
      item = "smart-solution"
    }
},
{
    type = "technology",
    name = "beta-carotene",
    icon = "__base__/graphics/technology/automation-science-pack.png",
    icon_size = 256,
    prerequisites = { "planet-discovery-rabbasca" },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "beta-carotene",
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
    name = "harene-infused-foundations",
    icon = "__space-age__/graphics/technology/foundation.png",
    icon_size = 256,
    prerequisites = { "foundation", "harene-synthesis" },
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
},
}