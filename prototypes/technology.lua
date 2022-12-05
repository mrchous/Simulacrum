data:extend({
  {
    type = "technology",
    name = "computer-5-zone",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__simulacrum__/graphics/technology/radar.png",
    -- prerequisites = {"bit-handling"},
    unit =
    {
      count_formula = "500 * L",
      ingredients =
      {
        {"bit-science-pack", 1},
      },
      time = 10 
    },
    max_level = "infinite",
    effects =
    {
      {
        type = "nothing",
        effect_description={"strings.computer-5-size"}
      }
    },
    order = "a-a"
  },
    {
        type = "technology",
        name = "bit-handling",
        icon_size = 256, icon_mipmaps = 4,
        icon = "__simulacrum__/graphics/technology/automation-2.png",
        prerequisites = {},
        unit =
        {
          count = 32,
          ingredients =
          {
            {"bit-science-pack", 1},
          },
          time = 10
        },
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "bit-assembler"
          },
          {
            type = "unlock-recipe",
            recipe = "byte-belt"
          },
          {
            type = "unlock-recipe",
            recipe = "byte-underground-belt"
          },
          {
            type = "unlock-recipe",
            recipe = "bit-inserter"
          },
          {
            type = "unlock-recipe",
            recipe = "bit-drill"
          },
        },
        order = "a-a"
      },
    {
    type = "technology",
    name = "bit-mixer",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__simulacrum__/graphics/technology/rocket-fuel.png",
    prerequisites = {"bit-handling"},
    unit =
    {
      count = 128,
      ingredients =
      {
        {"bit-science-pack", 1},
      },
      time = 10
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "bit-mixer"
      }
    },
    order = "a-a"
  },
  {
    type = "technology",
    name = "bit-combinator",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__simulacrum__/graphics/technology/circuit-network.png",
    prerequisites = {"bit-handling"},
    unit =
    {
      count = 128,
      ingredients =
      {
        {"bit-science-pack", 1},
      },
      time = 10
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "bit-combinator"
      }
    },
    order = "a-a"
  },
})