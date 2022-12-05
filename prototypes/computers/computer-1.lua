local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")

-- energy-storage

data:extend({
    {
        type = "item",
        name = "simulacrum-computer-1",
        icon = "__simulacrum__/graphics/icons/simulacrum-computer-1.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "simulacrum-computers",
        order = "ab",
        stack_size = 16,
        place_result = "simulacrum-computer-1"
    },
    {
      type = "furnace",
      name = "simulacrum-computer-1",
      icon = "__simulacrum__/graphics/icons/simulacrum-computer-1.png",
      icon_size = 64,
      icon_mipmaps = 4,
      minable = {mining_time = 1, result = "simulacrum-computer-1"},
      max_health = 750,
      corpse = "big-remnants",
      dying_explosion = "big-explosion",
      damaged_trigger_effect = hit_effects.entity(),
      collision_box = { { -2.75, -2.75 }, { 2.75, 2.75 } },
      selection_box = { { -3, -3 }, { 3, 3 } },
      drawing_box = { { -3, -3 }, { 3, 3 } },
      resistances = {
        { type = "physical", percent = 25 },
        { type = "fire", percent = 25 },
        { type = "impact", percent = 50 },
      },
      animation = {
        layers = {
          {
            filename = "__simulacrum__/graphics/entity/computer-1/energy-storage.png",
            width = 190,
            height = 190,
            frame_count = 1,
            scale = 1.1,
            shift = { 0, -0.4 },
            hr_version = {
              filename = "__simulacrum__/graphics/entity/computer-1/hr-energy-storage.png",
              width = 380,
              height = 380,
              scale = 0.55,
              frame_count = 1,
              shift = { 0, -0.4 },
            },
          },
          {
            filename = "__simulacrum__/graphics/entity/computer-1/energy-storage-sh.png",
            width = 207,
            height = 135,
            frame_count = 1,
            draw_as_shadow = true,
            scale = 1.1,
            shift = { 0.72, 0.56 },
            hr_version = {
              filename = "__simulacrum__/graphics/entity/computer-1/hr-energy-storage-sh.png",
              width = 414,
              height = 270,
              scale = 0.55,
              frame_count = 1,
              draw_as_shadow = true,
              shift = { 0.72, 0.56 },
            },
          },
        },
      },
      vehicle_impact_sound = sounds.generic_impact,
      working_sound = {
        sound = {
          filename = "__simulacrum__/graphics/entity/computer-1/energy-storage-working.ogg",
          volume = 0.9,
        },
        idle_sound = {
          filename = "__base__/sound/accumulator-idle.ogg",
          volume = 0.8,
        },
        max_sounds_per_type = 2,
        fade_in_ticks = 10,
        fade_out_ticks = 30,
      },
      
      water_reflection = {
        pictures = {
          filename = "__simulacrum__/graphics/entity/computer-1/energy-storage-reflection.png",
          priority = "extra-high",
          width = 44,
          height = 44,
          shift = util.by_pixel(0, 40),
          variation_count = 1,
          scale = 5,
        },
        rotate = false,
        orientation_to_variation = false,
      },
        allowed_effects = {"pollution"},
        crafting_categories = {"harddrives-consume-none"},
        result_inventory_size = 1,
        crafting_speed = 1.5,
        energy_usage = "2MW",
        source_inventory_size = 1,
        energy_source =
        {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = 2,
        drain = "100kW",
        buffer_capacity = "20J"   
        },
        return_ingredients_on_change = false,
        show_recipe_icon = false,
        module_specification = { module_slots = 1 },
        flags = {
          "not-rotatable",
          "placeable-player",
          "placeable-neutral",
          "player-creation",
          "not-blueprintable",
          "no-copy-paste",
          "not-upgradable",
          },
    },
  })
  