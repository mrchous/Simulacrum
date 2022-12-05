local noise = require("noise")
local tne = noise.to_noise_expression
local resource_autoplace = require("resource-autoplace")
local sounds = require ("__base__/prototypes/entity/sounds.lua")

data:extend({
	{
    type = "autoplace-control",
    category = "resource",
    name = "bit-ore",
    richness = true,
    
    order = "za[bit-ore]"
	},
	{
    type = "noise-layer",
    name = "bit-ore"
	},
	{
    type = "resource",
    icon_size = 64, icon_mipmaps = 3,
    name = "bit-ore",
    category = "simulation-solid",
    icon = "__simulacrum__/graphics/icons/bit-ore.png",
    flags = {"placeable-neutral"},
    order="aa",
    minable =
    {
      hardness = 1,
      mining_time = 0.5,
      result = "bit-ore"
    },
    collision_box = {{ -0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},

    autoplace = resource_autoplace.resource_autoplace_settings{
      name = "bit-ore",
      order = "ab",
      base_density = 6,
      base_spots_per_km2 = 30,
      random_spot_size_minimum = 1,
      random_spot_size_maximum = 3,
      has_starting_area_placement = true,
    },

    stage_counts = {15000, 9500, 5500, 2900, 1300, 400, 150, 80},
    stages =
    {
      sheet =
      {
      filename = "__simulacrum__/graphics/entity/ores/bit-ore.png",
      priority = "extra-high",
      size = 64,
      frame_count = 8,
      variation_count = 8,
      hr_version =
      {
        filename = "__simulacrum__/graphics/entity/ores/hr-bit-ore.png",
        priority = "extra-high",
        size = 128,
        frame_count = 8,
        variation_count = 8,
        scale = 0.5
      }
      }
    },
    stages_effect =
    {
      sheet =
      {
        filename = "__simulacrum__/graphics/entity/ores/bit-ore-glow.png",
        priority = "extra-high",
        width = 64,
        height = 64,
        frame_count = 8,
        variation_count = 8,
        blend_mode = "additive",
        flags = {"light"},
        hr_version =
        {
          filename = "__simulacrum__/graphics/entity/ores/hr-bit-ore-glow.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          frame_count = 8,
          variation_count = 8,
          scale = 0.5,
          blend_mode = "additive",
          flags = {"light"}
        }
      }
    },
    effect_animation_period = 5,
    effect_animation_period_deviation = 1,
    effect_darkness_multiplier = 3.6,
    min_effect_alpha = 0.2,
    max_effect_alpha = 0.3,
    mining_visualisation_tint = {0, 0.7, 0.6},
    map_color = {0, 0.7, 0.6}

    },
    {
        type = "item",
        name = "bit-ore",
        icon_size = 64, icon_mipmaps = 3,
        icon = "__simulacrum__/graphics/icons/bit-ore.png",
        pictures = {
          {filename="__simulacrum__/graphics/icons/bit-ore.png", size=64, scale=0.25},
          {filename="__simulacrum__/graphics/icons/bit-ore-1.png", size=64, scale=0.25},
          {filename="__simulacrum__/graphics/icons/bit-ore-2.png", size=64, scale=0.25},
          {filename="__simulacrum__/graphics/icons/bit-ore-3.png", size=64, scale=0.25},
        },
        subgroup = "simulacrum-raw-resource",
        order = "ab[bit-ore]",
        stack_size = 64
    },

    {
      type = "autoplace-control",
      category = "resource",
      name = "simulation-error-ore",
      richness = true,
      
      order = "zb[simulation-error-ore]"
    },
    {
      type = "noise-layer",
      name = "simulation-error-ore"
    },
    {
      type = "resource",
      icon_size = 64, icon_mipmaps = 3,
      name = "simulation-error-ore",
      category = "simulation-solid",
      icon = "__simulacrum__/graphics/icons/simulation-error-ore.png",
      flags = {"placeable-neutral"},
      order="aa",
      minable =
      {
        hardness = 1,
        mining_time = 1,
        result = "simulation-error-ore"
      },
      collision_box = {{ -0.1, -0.1}, {0.1, 0.1}},
      selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
  
      autoplace = resource_autoplace.resource_autoplace_settings{
        name = "simulation-error-ore",
        order = "ab",
        base_density = 0.5,
        base_spots_per_km2 = 20,
        random_spot_size_minimum = 1,
        random_spot_size_maximum = 2,
        has_starting_area_placement = true,
      },
  
      stage_counts = {15000, 9500, 5500, 2900, 1300, 400, 150, 80},
      stages =
      {
        sheet =
        {
        filename = "__simulacrum__/graphics/entity/ores/simulation-error-ore.png",
        priority = "extra-high",
        size = 64,
        frame_count = 8,
        variation_count = 8,
        hr_version =
        {
          filename = "__simulacrum__/graphics/entity/ores/hr-simulation-error-ore.png",
          priority = "extra-high",
          size = 128,
          frame_count = 8,
          variation_count = 8,
          scale = 0.5
        }
        }
      },
      stages_effect =
    {
      sheet =
      {
        filename = "__simulacrum__/graphics/entity/ores/simulation-error-ore-glow.png",
        priority = "extra-high",
        width = 64,
        height = 64,
        frame_count = 8,
        variation_count = 8,
        blend_mode = "additive",
        flags = {"light"},
        hr_version =
        {
          filename = "__simulacrum__/graphics/entity/ores/hr-simulation-error-ore-glow.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          frame_count = 8,
          variation_count = 8,
          scale = 0.5,
          blend_mode = "additive",
          flags = {"light"}
        }
      }
    },
    effect_animation_period = 5,
    effect_animation_period_deviation = 1,
    effect_darkness_multiplier = 8,
    min_effect_alpha = 0.2,
    max_effect_alpha = 0.3,
    mining_visualisation_tint = {1, 0, 0},
    map_color = {1, 0, 0}
      },
      {
          type = "item",
          name = "simulation-error-ore",
          icon_size = 64, icon_mipmaps = 3,
          icon = "__simulacrum__/graphics/icons/simulation-error-ore.png",
          pictures = {
            {filename="__simulacrum__/graphics/icons/simulation-error-ore.png", size=64, scale=0.25},
            {filename="__simulacrum__/graphics/icons/simulation-error-ore-1.png", size=64, scale=0.25},
            {filename="__simulacrum__/graphics/icons/simulation-error-ore-2.png", size=64, scale=0.25},
            {filename="__simulacrum__/graphics/icons/simulation-error-ore-3.png", size=64, scale=0.25},
          },
          subgroup = "simulacrum-raw-resource",
          order = "ab[simulation-error-ore]",
          fuel_category = "simulation-fuel",
          fuel_value = "32MJ",
          stack_size = 64,
          fuel_glow_color = {1, 0, 0}
      },

      {
        type = "autoplace-control",
        category = "resource",
        name = "pointer-ore",
        richness = true,
        
        order = "za[pointer-ore]"
      },
      {
        type = "noise-layer",
        name = "pointer-ore"
      },
      {
        type = "resource",
        icon_size = 64, icon_mipmaps = 3,
        name = "pointer-ore",
        category = "simulation-solid",
        icon = "__simulacrum__/graphics/icons/pointer-ore.png",
        flags = {"placeable-neutral"},
        order="aa",
        minable =
        {
          hardness = 1,
          mining_time = 1,
          result = "pointer-ore"
        },
        collision_box = {{ -0.1, -0.1}, {0.1, 0.1}},
        selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
    
        autoplace = resource_autoplace.resource_autoplace_settings{
          name = "pointer-ore",
          order = "ab",
          base_density = 1,
          base_spots_per_km2 = 10,
          random_spot_size_minimum = 2,
          random_spot_size_maximum = 3,
          has_starting_area_placement = true,
        },
    
        stage_counts = {15000, 9500, 5500, 2900, 1300, 400, 150, 80},
        stages =
        {
          sheet =
          {
          filename = "__simulacrum__/graphics/entity/ores/pointer-ore.png",
          priority = "extra-high",
          size = 64,
          frame_count = 8,
          variation_count = 8,
          hr_version =
          {
            filename = "__simulacrum__/graphics/entity/ores/hr-pointer-ore.png",
            priority = "extra-high",
            size = 128,
            frame_count = 8,
            variation_count = 8,
            scale = 0.5
          }
          }
        },
        mining_visualisation_tint = {1, 1, 1},
        map_color = {1, 1, 1}
    
        },
        {
            type = "item",
            name = "pointer-ore",
            icon_size = 64, icon_mipmaps = 3,
            icon = "__simulacrum__/graphics/icons/pointer-ore.png",
            pictures = {
              {filename="__simulacrum__/graphics/icons/pointer-ore.png", size=64, scale=0.25},
              {filename="__simulacrum__/graphics/icons/pointer-ore-1.png", size=64, scale=0.25},
              {filename="__simulacrum__/graphics/icons/pointer-ore-2.png", size=64, scale=0.25},
              {filename="__simulacrum__/graphics/icons/pointer-ore-3.png", size=64, scale=0.25},
            },
            subgroup = "simulacrum-raw-resource",
            order = "ab[pointer-ore]",
            stack_size = 64
        },

  {
    type = "fluid",
    name = "bit-stream",
    default_temperature = 0,
    max_temperature = 64,
    heat_capacity = "1KJ",
    base_color = {r=0, g=1, b=0},
    flow_color = {r=0, g=1, b=0},
    icon = "__simulacrum__/graphics/icons/bit-stream.png",
    icon_size = 64, icon_mipmaps = 4,
    order = "z[bit-stream]"
  },
  {
    type = "fluid",
    name = "cooling-liquid",
    default_temperature = -100,
    max_temperature = 0,
    heat_capacity = "32KJ",
    base_color = {r=0, g=0, b=1},
    flow_color = {r=0, g=0, b=1},
    icon = "__simulacrum__/graphics/icons/bit-stream.png",
    icon_size = 64, icon_mipmaps = 4,
    order = "z[bit-stream]"
  },
  {
    type = "fluid",
    name = "byte-stream",
    default_temperature = 0,
    max_temperature = 255,
    heat_capacity = "255KJ",
    base_color = {r=0, g=1, b=1},
    flow_color = {r=0, g=1, b=1},
    icon = "__simulacrum__/graphics/icons/byte-stream.png",
    icon_size = 64, icon_mipmaps = 4,
    order = "z[byte-stream]"
  },
  {
    type = "fluid",
    name = "data-leak",
    default_temperature = 1024,
    max_temperature = 1024,
    heat_capacity = "1024KJ",
    base_color = {r=1, g=0, b=1},
    flow_color = {r=1, g=0, b=1},
    icon = "__simulacrum__/graphics/icons/data-leak.png",
    icon_size = 64, icon_mipmaps = 4,
    order = "z[data-leak]"
  },
  {
    type = "autoplace-control",
    name = "data-leak",
    richness = true,
    order = "zz[data-leak]",
    category = "resource"
  },
  {
    type = "resource",
    name = "data-leak",
    icon = "__simulacrum__/graphics/icons/data-leak.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral"},
    category = "simulation-fluid",
    subgroup = "raw-resource",
    order="a-b-a",
    infinite = true,
    highlight = true,
    minimum = 4096,
    normal = 8192,
    infinite_depletion_amount = 16,
    resource_patch_search_radius = 12,
    tree_removal_probability = 0.7,
    tree_removal_max_distance = 32 * 32,
    minable =
    {
      mining_time = 8,
      results =
      {
        {
          type = "fluid",
          name = "data-leak",
          amount_min = 8,
          amount_max = 8,
          probability = 1
        }
      }
    },
    walking_sound = sounds.oil,
    collision_box = { { -3.4, -3.4 }, { 3.4, 3.4 } },
    selection_box = { { -3.5, -3.5 }, { 3.5, 3.5 } },
    autoplace = resource_autoplace.resource_autoplace_settings
    {
      name = "data-leak",
      order = "c", -- Other resources are "b"; oil won't get placed if something else is already there.
      base_density = 8.2,
      base_spots_per_km2 = 5,
      random_probability = 1/48,
      random_spot_size_minimum = 1,
      random_spot_size_maximum = 1, -- don't randomize spot size
      additional_richness = 10000, -- this increases the total everywhere, so base_density needs to be decreased to compensate
      has_starting_area_placement = false,
      regular_rq_factor_multiplier = 1
    },
    stage_counts = { 0 },
    stages = {
      sheet = {
        filename = "__simulacrum__/graphics/entity/ores/data-leak/imersite-rift.png",
        priority = "extra-high",
        width = 250,
        height = 250,
        frame_count = 6,
        variation_count = 1,
        scale = 0.8,
        hr_version = {
          filename = "__simulacrum__/graphics/entity/ores/data-leak/hr-imersite-rift.png",
          priority = "extra-high",
          width = 500,
          height = 500,
          frame_count = 6,
          variation_count = 1,
          scale = 0.4,
        },
      },
    },
    stages_effect = {
      sheets = {
        {
          filename = "__simulacrum__/graphics/entity/ores/data-leak/imersite-rift-glow.png",
          priority = "extra-high",
          width = 250,
          height = 250,
          frame_count = 6,
          variation_count = 1,
          draw_as_glow = true,
          scale = 0.8,
          hr_version = {
            filename = "__simulacrum__/graphics/entity/ores/data-leak/hr-imersite-rift-glow.png",
            priority = "extra-high",
            width = 500,
            height = 500,
            frame_count = 6,
            variation_count = 1,
            scale = 0.4,
            draw_as_glow = true,
          },
        },
      },
    },
    effect_animation_period = 5,
    effect_animation_period_deviation = 1,
    effect_darkness_multiplier = 3.5,
    min_effect_alpha = 0.2,
    max_effect_alpha = 0.3,
    map_color = { r = 1, g = 0.5, b = 1 },
    mining_visualisation_tint = { r = 0.792, g = 0.050, b = 0.858 },
    map_grid = false,
  },
  {
    type = "item",
    name = "structurized-data",
    icon_size = 64, icon_mipmaps = 3,
    icon = "__simulacrum__/graphics/icons/structurized-data.png",
    pictures = {
      {filename="__simulacrum__/graphics/icons/structurized-data.png", size=64, scale=0.25},
    },
    subgroup = "simulacrum-raw-resource",
    order = "ab[structurized-data]",
    stack_size = 64
  },
})

