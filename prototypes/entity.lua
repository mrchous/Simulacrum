local doubleword_pump = table.deepcopy(data.raw["offshore-pump"]["offshore-pump"])
doubleword_pump.fluid = "bit-stream"
doubleword_pump.name = "doubleword-pump"
doubleword_pump.minable = {mining_time = 0.1, result = "doubleword-pump"}
doubleword_pump.fluid_box.filter="bit-stream"
doubleword_pump.pumping_speed = 128/60
doubleword_pump.icons = {
  {
    icon = "__base__/graphics/icons/offshore-pump.png",
  },
  {
  icon = "__simulacrum__/graphics/icons/micros/128.png",
  }
}
doubleword_pump.fast_replaceable_group = "simulacrum-pump"

local word_pump = table.deepcopy(doubleword_pump)
word_pump.name = "word-pump"
word_pump.minable = {mining_time = 0.1, result = "word-pump"}
word_pump.pumping_speed = 64/60
word_pump.icons = {
  {
    icon = "__base__/graphics/icons/offshore-pump.png",
  },
  {
  icon = "__simulacrum__/graphics/icons/micros/64.png",
  }
}
word_pump.fast_replaceable_group = "simulacrum-pump"
word_pump.next_upgrade = "doubleword-pump"

local bit_smelter = table.deepcopy(data.raw["furnace"]["steel-furnace"])
bit_smelter.name = "bit-smelter"
bit_smelter.crafting_categories = {"bit-operations-smelting"}
bit_smelter.minable = {mining_time = 0.2, result = "bit-smelter"}
bit_smelter.energy_usage = "128kW"
bit_smelter.crafting_speed = 1
bit_smelter.energy_source =
{
  type = "burner",
  fuel_category = "simulation-fuel",
  effectivity = 1,
  fuel_inventory_size = 1,
  emissions_per_minute = 1,
  light_flicker =
  {
    color = {1, 0, 0},
    minimum_intensity = 1,
    maximum_intensity = 1
  },
  smoke =
  {
    {
      name = "red-smoke-small",
      frequency = 10,
      position = {0.7, -1.2},
      starting_vertical_speed = 0.08,
      starting_frame_deviation = 60
    }
  }
}
bit_smelter.icons = {
  {
    icon = "__base__/graphics/icons/steel-furnace.png",
  },
  {
  icon = "__simulacrum__/graphics/icons/micros/64.png",
  }
}
bit_smelter.fast_replaceable_group = "simulacrum-furnace"

local byte_smelter = table.deepcopy(data.raw["furnace"]["electric-furnace"])
byte_smelter.name = "doublebit-smelter"
byte_smelter.crafting_categories = {"bit-operations-smelting"}
byte_smelter.minable = {mining_time = 0.2, result = "doublebit-smelter"}
byte_smelter.energy_usage = "270kW"
byte_smelter.crafting_speed = 2
byte_smelter.energy_source =
{
  type = "electric",
  usage_priority = "secondary-input",
  emissions_per_minute = 8,
  light_flicker = 
  {
    color = {1, 0, 0},
    minimum_intensity = 1,
    maximum_intensity = 1
  },
  drain = "50kW"
}
byte_smelter.icons = {
  {
    icon = "__base__/graphics/icons/electric-furnace.png",
  },
  {
  icon = "__simulacrum__/graphics/icons/micros/2.png",
  }
}
byte_smelter.fast_replaceable_group = "simulacrum-furnace"

local bit_combiner = table.deepcopy((data.raw["assembling-machine"]["assembling-machine-2"]))
bit_combiner.name = "bit-assembler"
bit_combiner.icons = {
  {
    icon = "__base__/graphics/icons/assembling-machine-2.png",
  },
  {
  icon = "__simulacrum__/graphics/icons/micros/1.png",
  }
  }
bit_combiner.minable = {mining_time = 0.2, result = "bit-assembler"}
bit_combiner.crafting_categories = {"bit-operations-assembler"}
bit_combiner.crafting_speed = 1
bit_combiner.energy_source =
{
  type = "electric",
  usage_priority = "secondary-input",
  emissions_per_minute = 1,
  drain = "50kW"
}
bit_combiner.energy_usage = "280kW"
bit_combiner.fast_replaceable_group = "simulacrum-assembler"
bit_combiner.next_upgrade = "doublebit-assembler"

local byte_combiner = table.deepcopy((data.raw["assembling-machine"]["assembling-machine-3"]))
byte_combiner.name = "doublebit-assembler"
byte_combiner.icons = {
    {
      icon = "__base__/graphics/icons/assembling-machine-3.png",
    },
    {
    icon = "__simulacrum__/graphics/icons/micros/2.png",
    }
  }
byte_combiner.minable = {mining_time = 0.2, result = "doublebit-assembler"}
byte_combiner.crafting_categories = {"bit-operations-assembler", "bit-operations-mixed-assembler"}
byte_combiner.crafting_speed = 2
byte_combiner.energy_source =
{
  type = "electric",
  usage_priority = "secondary-input",
  emissions_per_minute = 4,
  drain = "100kW"
}
byte_combiner.energy_usage = "412kW"
byte_combiner.fast_replaceable_group = "simulacrum-assembler"

local bit_mixer = table.deepcopy((data.raw["assembling-machine"]["chemical-plant"]))
bit_mixer.name = "bit-mixer"
bit_mixer.minable = {mining_time = 0.2, result = "bit-mixer"}
bit_mixer.crafting_categories = {"bit-operations-chemistry"}
bit_mixer.crafting_speed = 1
bit_mixer.energy_source =
{
  type = "electric",
  usage_priority = "secondary-input",
  emissions_per_minute = 4,
  drain = "100kW"
}
bit_mixer.energy_usage = "412kW"
bit_mixer.icons = {
  {
    icon = "__base__/graphics/icons/chemical-plant.png",
  },
  {
  icon = "__simulacrum__/graphics/icons/micros/1.png",
  }
}
bit_mixer.fast_replaceable_group = "simulacrum-mixer"
bit_mixer.next_upgrade = "doublebit-mixer"

local byte_mixer = table.deepcopy((data.raw["assembling-machine"]["chemical-plant"]))
byte_mixer.name = "doublebit-mixer"
byte_mixer.minable = {mining_time = 0.2, result = "doublebit-mixer"}
byte_mixer.crafting_categories = {"bit-operations-chemistry", "bit-operations-mixed-chemistry"}
byte_mixer.crafting_speed = 2
byte_mixer.energy_source =
{
  type = "electric",
  usage_priority = "secondary-input",
  emissions_per_minute = 5,
  drain = "300kW"
}
byte_mixer.energy_usage = "700kW"
byte_mixer.icons = {
  {
    icon = "__base__/graphics/icons/chemical-plant.png",
  },
  {
  icon = "__simulacrum__/graphics/icons/micros/2.png",
  }
}
byte_mixer.fast_replaceable_group = "simulacrum-mixer"

local error_burner = table.deepcopy((data.raw["boiler"]["boiler"]))
error_burner.name = "error-burner"
error_burner.minable = {mining_time = 0.2, result = "error-burner"}
error_burner.target_temperature = 64
error_burner.fluid_box =
{
  base_area = 1.28,
  height = 1,
  base_level = -1,
  pipe_covers = pipecoverspictures(),
  pipe_connections =
  {
    {type = "input-output", position = {-2, 0.5}},
    {type = "input-output", position = {2, 0.5}}
  },
  production_type = "input-output",
  filter = "bit-stream"
}
error_burner.icons = {
  {
    icon = "__base__/graphics/icons/boiler.png",
  },
  {
  icon = "__simulacrum__/graphics/icons/micros/64.png",
  }
}

error_burner.output_fluid_box =
{
  base_area = 1.28,
  height = 2,
  base_level = 1,
  pipe_covers = pipecoverspictures(),
  pipe_connections =
  {
    {type = "output", position = {0, -1.5}}
  },
  production_type = "output",
  filter = "bit-stream"
}
error_burner.energy_consumption = "6.4MW"
error_burner.energy_source =
{
  type = "burner",
  fuel_category = "simulation-fuel",
  effectivity = 1,
  fuel_inventory_size = 1,
  emissions_per_minute = 32,
  light_flicker =
  {
    color = {1,0,0},
    minimum_intensity = 0.6,
    maximum_intensity = 0.95
  },
  smoke =
  {
    {
      name = "red-smoke-small",
      north_position = util.by_pixel(-38, -47.5),
      south_position = util.by_pixel(38.5, -32),
      east_position = util.by_pixel(20, -70),
      west_position = util.by_pixel(-19, -8.5),
      frequency = 15,
      starting_vertical_speed = 0.0,
      starting_frame_deviation = 60
    }
  }
}

local error_consumer = table.deepcopy((data.raw["generator"]["steam-turbine"]))
error_consumer.name = "error-consumer"
error_consumer.max_power_output = "512kW"
error_consumer.minable = {mining_time = 0.2, result = "error-consumer"}
error_consumer.maximum_temperature = 64
error_consumer.fluid_box =
{
  base_area = 2.56,
  height = 1,
  base_level = -1,
  pipe_covers = pipecoverspictures(),
  pipe_connections =
  {
    { type = "input-output", position = {0, 3} },
    { type = "input-output", position = {0, -3} }
  },
  production_type = "input-output",
  filter = "bit-stream",
  minimum_temperature = 64
}
error_consumer.energy_source =
{
  type = "electric",
  usage_priority = "secondary-output"
}
error_consumer.smoke =
{
  {
    name = "magenta-smoke-big",
    north_position = {0.0, -1.0},
    east_position = {0.75, -0.75},
    frequency = 10 / 32,
    starting_vertical_speed = 0.08,
    slow_down_factor = 1,
    starting_frame_deviation = 60
  }
}
error_consumer.icons = {
  {
    icon = "__base__/graphics/icons/steam-turbine.png",
  },
  {
  icon = "__simulacrum__/graphics/icons/micros/64.png",
  }
}
error_consumer.fast_replaceable_group = ""
error_consumer.next_upgrade = ""

local bit_lab = table.deepcopy((data.raw["lab"]["lab"]))
bit_lab.name = "bit-lab"
bit_lab.minable = {mining_time = 0.2, result = "bit-lab"}
bit_lab.inputs = {"bit-0", "bit-1", "bit-science-pack", "byte-science-pack"}

data.raw["lab"]["lab"].inputs = {
    "automation-science-pack",
    "logistic-science-pack",
    "military-science-pack",
    "chemical-science-pack",
    "production-science-pack",
    "utility-science-pack",
    "space-science-pack",
    "bit-science-pack",
    "byte-science-pack"
}
bit_lab.icons = {
  {
    icon = "__base__/graphics/icons/lab.png",
  },
  {
  icon = "__simulacrum__/graphics/icons/micros/1.png",
  }
}

local word_pipe = table.deepcopy((data.raw["pipe"]["pipe"]))
word_pipe.name = "word-pipe"
word_pipe.minable = {mining_time = 0.1, result = "word-pipe"}
word_pipe.fluid_box =
{
  base_area = 0.64,
  pipe_connections =
  {
    { position = {0, -1} },
    { position = {1, 0} },
    { position = {0, 1} },
    { position = {-1, 0} }
  }
}
word_pipe.icons = {
  {
    icon = "__base__/graphics/icons/pipe.png",
  },
  {
  icon = "__simulacrum__/graphics/icons/micros/64.png",
  }
}
word_pipe.next_upgrade = "pipe"
word_pipe.fast_replaceable_group = "pipe"

local bit_inserter = table.deepcopy((data.raw["inserter"]["burner-inserter"]))
bit_inserter.name = "bit-inserter"
bit_inserter.minable = {mining_time = 0.1, result = "bit-inserter"}
bit_inserter.energy_per_movement = "64KJ"
bit_inserter.energy_per_rotation = "64KJ"
bit_inserter.extension_speed = 0.03
bit_inserter.rotation_speed = 0.014
bit_inserter.energy_source =
{
  type = "burner",
  fuel_category = "simulation-fuel",
  effectivity = 1,
  fuel_inventory_size = 1,
  light_flicker = {color = {1,0,0}},
  smoke =
  {
    {
      name = "red-smoke-small",
      deviation = {0.1, 0.1},
      frequency = 9
    }
  }
}
bit_inserter.icons = {
  {
    icon = "__base__/graphics/icons/burner-inserter.png",
  },
  {
  icon = "__simulacrum__/graphics/icons/micros/1.png",
  }
}
bit_inserter.next_upgrade = "inserter"

local byte_belt = table.deepcopy((data.raw["transport-belt"]["transport-belt"]))
byte_belt.name = "byte-belt"
byte_belt.corpse = "byte-belt-remnants"
byte_belt.minable = {mining_time = 0.05, result = "byte-belt"}
byte_belt.speed = 8/480
local baseAnimation = byte_belt.belt_animation_set.animation_set
local arrowAnimation = table.deepcopy(baseAnimation)
arrowAnimation.filename = "__simulacrum__/graphics/entity/transport-belt/arrows.png"
arrowAnimation.hr_version.filename = "__simulacrum__/graphics/entity/transport-belt/hr-arrows.png"
arrowAnimation.tint = {0, 1, 0}
arrowAnimation.hr_version.tint = {0, 1, 0}
byte_belt.belt_animation_set = {
    animation_set = {
        layers = {
            baseAnimation,
            arrowAnimation
        }
    }
}
byte_belt.icons = {
  {
    icon = "__simulacrum__/graphics/icons/byte-belt.png",
  },
  {
  icon = "__simulacrum__/graphics/icons/micros/8.png",
  }
}

local byte_underground_belt = table.deepcopy((data.raw["underground-belt"]["underground-belt"]))
byte_underground_belt.name = "byte-underground-belt"
byte_underground_belt.corpse = "byte-underground-belt-remnants"
byte_underground_belt.minable = {mining_time = 0.1, result = "byte-underground-belt"}
byte_underground_belt.speed = 8/480
byte_underground_belt.belt_animation_set = {
  animation_set = {
      layers = {
          baseAnimation,
          arrowAnimation
      }
  }
}
byte_belt.next_upgrade = "transport-belt"

byte_underground_belt.icons = {
  {
    icon = "__simulacrum__/graphics/icons/byte-underground-belt.png",
  },
  {
  icon = "__simulacrum__/graphics/icons/micros/8.png",
  }
}

byte_underground_belt.structure =
{
  direction_in =
  {
    sheet =
    {
      filename = "__simulacrum__/graphics/entity/underground-belt/underground-belt-structure.png",
      priority = "extra-high",
      width = 96,
      height = 96,
      y = 96,
      hr_version =
      {
        filename = "__simulacrum__/graphics/entity/underground-belt/hr-underground-belt-structure.png",
        priority = "extra-high",
        width = 192,
        height =192,
        y = 192,
        scale = 0.5
      }
    }
  },
  direction_out =
  {
    sheet =
    {
      filename = "__simulacrum__/graphics/entity/underground-belt/underground-belt-structure.png",
      priority = "extra-high",
      width = 96,
      height = 96,
      hr_version =
      {
        filename = "__simulacrum__/graphics/entity/underground-belt/hr-underground-belt-structure.png",
        priority = "extra-high",
        width = 192,
        height = 192,
        scale = 0.5
      }

    }

  },
  direction_in_side_loading =
  {
    sheet =
    {
      filename = "__simulacrum__/graphics/entity/underground-belt/underground-belt-structure.png",
      priority = "extra-high",
      width = 96,
      height = 96,
      y = 96*3,
      hr_version =
      {
        filename = "__simulacrum__/graphics/entity/underground-belt/hr-underground-belt-structure.png",
        priority = "extra-high",
        width = 192,
        height = 192,
        y = 192*3,
        scale = 0.5
      }
    }
  },
  direction_out_side_loading =
  {
    sheet =
    {
      filename = "__simulacrum__/graphics/entity/underground-belt/underground-belt-structure.png",
      priority = "extra-high",
      width = 96,
      height = 96,
      y = 96*2,
      hr_version =
      {
        filename = "__simulacrum__/graphics/entity/underground-belt/hr-underground-belt-structure.png",
        priority = "extra-high",
        width = 192,
        height = 192,
        y= 192*2,
        scale = 0.5
      },

    }

  },
  back_patch =
  {
    sheet =
    {
      filename = "__simulacrum__/graphics/entity/underground-belt/underground-belt-structure-back-patch.png",
      priority = "extra-high",
      width = 96,
      height = 96,
      hr_version =
      {
        filename = "__simulacrum__/graphics/entity/underground-belt/hr-underground-belt-structure-back-patch.png",
        priority = "extra-high",
        width = 192,
        height = 192,
        scale = 0.5
      }

    }
  },
  front_patch =
  {
    sheet =
    {
      filename = "__simulacrum__/graphics/entity/underground-belt/underground-belt-structure-front-patch.png",
      priority = "extra-high",
      width = 96,
      height = 96,
      hr_version =
      {
        filename = "__simulacrum__/graphics/entity/underground-belt/hr-underground-belt-structure-front-patch.png",
        priority = "extra-high",
        width = 192,
        height = 192,
        scale = 0.5
      }

    }
  }
}
byte_underground_belt.next_upgrade = "underground-belt"

--data.raw["character"]["character"].mining_categories = {"basic-solid", "simulation-solid"}
--data.raw["character"]["character"].crafting_categories = {"crafting", "bit-operations-assembler"}

table.insert(data.raw["character"]["character"].mining_categories, "simulation-solid")
table.insert(data.raw["character"]["character"].crafting_categories, "bit-operations-assembler")

local bit_drill =  table.deepcopy((data.raw["mining-drill"]["burner-mining-drill"]))
bit_drill.name = "bit-drill"
bit_drill.resource_categories = {"simulation-solid"}
bit_drill.mining_speed = 1
bit_drill.energy_source =
{
  type = "burner",
  fuel_category = "simulation-fuel",
  effectivity = 1,
  fuel_inventory_size = 1,
  emissions_per_minute = 16,
  light_flicker = {color = {1,0,0}},
  smoke =
  {
    {
      name = "red-smoke-small",
      deviation = {0.1, 0.1},
      frequency = 3
    }
  }
}
bit_drill.energy_usage = "128kW"
bit_drill.minable = {mining_time = 0.5, result = "bit-drill"}
bit_drill.icons = {
  {
    icon = "__base__/graphics/icons/burner-mining-drill.png",
  },
  {
  icon = "__simulacrum__/graphics/icons/micros/1.png",
  }
}

local leak_harvester = table.deepcopy((data.raw["mining-drill"]["pumpjack"]))
leak_harvester.name = "leak-harvester"
leak_harvester.resource_categories = {"simulation-fluid"}
leak_harvester.energy_usage = "512kW"
leak_harvester.minable = {mining_time = 0.5, result = "leak-harvester"}
leak_harvester.icons = {
  {
    icon = "__base__/graphics/icons/pumpjack.png",
  },
  {
  icon = "__simulacrum__/graphics/icons/micros/1.png",
  }
}

local byte_computer_combinator = table.deepcopy((data.raw["constant-combinator"]["constant-combinator"]))
byte_computer_combinator.name = "byte-combinator"
byte_computer_combinator.minable = {mining_time = 0.1, result = "byte-combinator"}
byte_computer_combinator.item_slot_count = 4
byte_computer_combinator.icons = {
  {
    icon = "__base__/graphics/icons/constant-combinator.png",
  },
  {
  icon = "__simulacrum__/graphics/icons/micros/4.png",
  }
}
byte_computer_combinator.allow_copy_paste = false
byte_computer_combinator.fast_replaceable_group = ""
byte_computer_combinator.next_upgrade = ""

local bit_computer_combinator = table.deepcopy((data.raw["constant-combinator"]["constant-combinator"]))
bit_computer_combinator.name = "bit-combinator"
bit_computer_combinator.minable = {mining_time = 0.1, result = "bit-combinator"}
bit_computer_combinator.item_slot_count = 1
bit_computer_combinator.icons = {
  {
    icon = "__base__/graphics/icons/constant-combinator.png",
  },
  {
  icon = "__simulacrum__/graphics/icons/micros/1.png",
  }
}
bit_computer_combinator.allow_copy_paste = false
bit_computer_combinator.fast_replaceable_group = ""
bit_computer_combinator.next_upgrade = ""

local simulacrum_chest = table.deepcopy((data.raw["container"]["red-chest"]))
simulacrum_chest.name = "short-word-chest"
simulacrum_chest.minable = {mining_time = 1, result = "short-word-chest"}
simulacrum_chest.inventory_size = 32
simulacrum_chest.fast_replaceable_group = "container"
simulacrum_chest.next_upgrade = "steel-chest"
simulacrum_chest.icons = {
  {
    icon = "__simulacrum__/graphics/icons/structurized-chest.png",
  },
  {
  icon = "__simulacrum__/graphics/icons/micros/32.png",
  }
}
simulacrum_chest.corpse = "short-word-chest-remnants"
simulacrum_chest.picture = {
  layers = {
    {
      filename = "__simulacrum__/graphics/entity/short-word-chest/logistic-chest-passive-provider.png",
      priority = "extra-high",
      width = 34,
      height = 38,
      frame_count = 7,
      shift = util.by_pixel(0, -2),
      hr_version =
      {
        filename = "__simulacrum__/graphics/entity/short-word-chest/hr-logistic-chest-passive-provider.png",
        priority = "extra-high",
        width = 66,
        height = 74,
        frame_count = 7,
        shift = util.by_pixel(0, -2),
        scale = 0.5
      }
    },
    {
      filename = "__simulacrum__/graphics/entity/short-word-chest/logistic-chest-shadow.png",
      priority = "extra-high",
      width = 56,
      height = 24,
      repeat_count = 7,
      shift = util.by_pixel(12, 5),
      draw_as_shadow = true,
      hr_version =
      {
        filename = "__simulacrum__/graphics/entity/short-word-chest/hr-logistic-chest-shadow.png",
        priority = "extra-high",
        width = 112,
        height = 46,
        repeat_count = 7,
        shift = util.by_pixel(12, 4.5),
        draw_as_shadow = true,
        scale = 0.5
      }
    }
  }
}

local linked_chest = table.deepcopy((data.raw["linked-container"]["linked-chest"]))
linked_chest.name = "quantum-chest"
linked_chest.minable = {mining_time = 1, result = "quantum-chest"}
linked_chest.inventory_size = 64
linked_chest.gui_mode = "none"
linked_chest.inventory_type = "with_filters_and_bar"
linked_chest.allow_copy_paste = false

data:extend({
doubleword_pump, 
word_pump, 
bit_smelter, 
byte_smelter, 
bit_combiner, 
byte_combiner, 
bit_mixer, 
byte_mixer, 
error_burner, 
error_consumer, 
bit_lab, 
word_pipe,
bit_inserter,
byte_belt,
byte_underground_belt,
bit_drill,
leak_harvester,
byte_computer_combinator,
bit_computer_combinator,
simulacrum_chest,
linked_chest
})