data:extend(
{
    {
        type = "tool",
        name = "bit-0",
        icon = "__simulacrum__/graphics/icons/bit_0.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "simulacrum-bits",
        order = "zza[bit-0]",
        stack_size = 128,
        durability = 1,
        durability_description_key = "description.science-pack-remaining-amount-key",
        durability_description_value = "description.science-pack-remaining-amount-value"
      },
      {
        type = "tool",
        name = "bit-1",
        icon = "__simulacrum__/graphics/icons/bit_1.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "simulacrum-bits",
        order = "zza[bit-1]",
        stack_size = 128,
        durability = 1,
        durability_description_key = "description.science-pack-remaining-amount-key",
        durability_description_value = "description.science-pack-remaining-amount-value"
      },
      {
        type = "item",
        name = "word-pump",
        icons = {
          {
          icon = "__base__/graphics/icons/offshore-pump.png",
          },
          {
          icon = "__simulacrum__/graphics/icons/micros/64.png",
          }
          },
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "simulacrum-production",
        order = "aadb[pump]1",
        place_result = "word-pump",
        stack_size = 32
      },
      {
        type = "item",
        name = "doubleword-pump",
        icons = {
          {
            icon = "__base__/graphics/icons/offshore-pump.png",
          },
          {
          icon = "__simulacrum__/graphics/icons/micros/128.png",
          }
          },
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "simulacrum-production",
        order = "aadb[pump]2",
        place_result = "doubleword-pump",
        stack_size = 32
      },
      {
        type = "item",
        name = "word-putty",
        icon = "__simulacrum__/graphics/icons/word-putty.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "simulacrum-raw-resource",
        order = "aa[word-putty]",
        stack_size = 128
      },
      {
        type = "item",
        name = "pointer",
        icon = "__simulacrum__/graphics/icons/pointer.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "simulacrum-raw-resource",
        order = "aa[pointer]",
        stack_size = 128
      },
      {
        type = "item",
        name = "bit-assembler",
        icons = {
          {
          icon = "__base__/graphics/icons/assembling-machine-2.png",
          },
          {
          icon = "__simulacrum__/graphics/icons/micros/1.png",
          }
          },
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "simulacrum-production",
        place_result = "bit-assembler",
        order = "aaa[bit-assembler]1",
        stack_size = 32
      },
      {
        type = "item",
        name = "doublebit-assembler",
        icons = {
          {
            icon = "__base__/graphics/icons/assembling-machine-3.png",
          },
          {
          icon = "__simulacrum__/graphics/icons/micros/2.png",
          }
          },
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "simulacrum-production",
        place_result = "doublebit-assembler",
        order = "aaa[doublebit-assembler]2",
        stack_size = 32
      },
      {
        type = "item",
        name = "bit-mixer",
        icons = {
          {
            icon = "__base__/graphics/icons/chemical-plant.png",
          },
          {
          icon = "__simulacrum__/graphics/icons/micros/1.png",
          }
          },
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "simulacrum-production",
        place_result = "bit-mixer",
        order = "aac[bit-mixer]1",
        stack_size = 32
      },
      {
        type = "item",
        name = "doublebit-mixer",
        icons = {
          {
            icon = "__base__/graphics/icons/chemical-plant.png",
          },
          {
          icon = "__simulacrum__/graphics/icons/micros/2.png",
          }
          },
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "simulacrum-production",
        place_result = "doublebit-mixer",
        order = "aac[doublebit-mixer]2",
        stack_size = 32
      },
      {
        type = "item",
        name = "bit-smelter",
        icons = {
          {
            icon = "__base__/graphics/icons/steel-furnace.png",
          },
          {
          icon = "__simulacrum__/graphics/icons/micros/1.png",
          }
          },
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "simulacrum-production",
        order = "aab[bit-smelter]1",
        place_result = "bit-smelter",
        stack_size = 32
      },
      {
        type = "item",
        name = "doublebit-smelter",
        icons = {
          {
            icon = "__base__/graphics/icons/electric-furnace.png",
          },
          {
          icon = "__simulacrum__/graphics/icons/micros/2.png",
          }
          },
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "simulacrum-production",
        order = "aab[doublebit-smelter]2",
        place_result = "doublebit-smelter",
        stack_size = 32
      },
      {
        type = "item",
        name = "error-burner",
        icons = {
          {
            icon = "__base__/graphics/icons/boiler.png",
          },
          {
          icon = "__simulacrum__/graphics/icons/micros/64.png",
          }
        },
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "simulacrum-production",
        order = "aae[error-burner]",
        stack_size = 32,
        place_result = "error-burner"
      },
      {
        type = "item",
        name = "error-consumer",
        icons = {
          {
            icon = "__base__/graphics/icons/steam-turbine.png",
          },
          {
          icon = "__simulacrum__/graphics/icons/micros/64.png",
          }
        },
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "simulacrum-production",
        order = "aae[error-consumer]",
        stack_size = 32,
        place_result = "error-consumer"
      },
      {
        type = "tool",
        name = "bit-science-pack",
        icons = {
          {
            icon = "__simulacrum__/graphics/icons/simulation-science-pack.png",
          },
          {
          icon = "__simulacrum__/graphics/icons/micros/1.png",
          }
          },
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "simulacrum-science-pack",
        order = "z[bit-science-pack]1",
        stack_size = 64,
        durability = 1,
        durability_description_key = "description.science-pack-remaining-amount-key",
        durability_description_value = "description.science-pack-remaining-amount-value"
      },
      {
        type = "tool",
        name = "byte-science-pack",
        icons = {
          {
            icon = "__simulacrum__/graphics/icons/simulation-science-pack.png",
          },
          {
          icon = "__simulacrum__/graphics/icons/micros/8.png",
          }
          },
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "simulacrum-science-pack",
        order = "z[byte-science-pack]2",
        stack_size = 64,
        durability = 1,
        durability_description_key = "description.science-pack-remaining-amount-key",
        durability_description_value = "description.science-pack-remaining-amount-value"
      },
      {
        type = "item",
        name = "bit-lab",
        icons = {
          {
            icon = "__base__/graphics/icons/lab.png",
          },
          {
          icon = "__simulacrum__/graphics/icons/micros/1.png",
          }
        },
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "simulacrum-production",
        order = "aae[bit-lab]",
        stack_size = 32,
        place_result = "bit-lab"
      },
      {
        type = "item",
        name = "byte-plate",
        icon = "__simulacrum__/graphics/icons/byte-plate.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "simulacrum-raw-resource",
        order = "aa[byte-plate]",
        stack_size = 128,
      },
      {
        type = "item",
        name = "byte-belt",
        icons = {
          {
            icon = "__simulacrum__/graphics/icons/byte-belt.png",
          },
          {
          icon = "__simulacrum__/graphics/icons/micros/8.png",
          }
        },
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "simulacrum-logistics",
        order = "aaf[byte-belt]1",
        stack_size = 128,
        place_result = "byte-belt"
      },
      {
        type = "item",
        name = "byte-underground-belt",
        icons = {
          {
            icon = "__simulacrum__/graphics/icons/byte-underground-belt.png",
          },
          {
          icon = "__simulacrum__/graphics/icons/micros/8.png",
          }
        },
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "simulacrum-logistics",
        order = "aaf[byte-underground-belt]2",
        stack_size = 128,
        place_result = "byte-underground-belt"
      },
      {
        type = "item",
        name = "bit-inserter",
        icons = {
          {
            icon = "__base__/graphics/icons/burner-inserter.png",
          },
          {
          icon = "__simulacrum__/graphics/icons/micros/1.png",
          }
        },
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "simulacrum-logistics",
        order = "aaf[bit-inserter]3",
        stack_size = 128,
        place_result = "bit-inserter"
      },
      {
        type = "item",
        name = "word-pipe",
        icons = {
          {
            icon = "__base__/graphics/icons/pipe.png",
          },
          {
          icon = "__simulacrum__/graphics/icons/micros/64.png",
          }
          },
        
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "simulacrum-logistics",
        order = "aaf[word-pipe]4",
        stack_size = 128,
        place_result = "word-pipe"
      },
      {
        type = "item",
        name = "bit-drill",
        icons = {
          {
            icon = "__base__/graphics/icons/burner-mining-drill.png",
          },
          {
          icon = "__simulacrum__/graphics/icons/micros/1.png",
          }
          },
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "simulacrum-production",
        order = "aada[bit-drill]1",
        stack_size = 32,
        place_result = "bit-drill"
      },
      {
        type = "item",
        name = "leak-harvester",
        icons = {
          {
            icon = "__base__/graphics/icons/pumpjack.png",
          },
          {
          icon = "__simulacrum__/graphics/icons/micros/1.png",
          }
          },
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "simulacrum-production",
        order = "aada[leak-harvester]2",
        stack_size = 32,
        place_result = "leak-harvester"
      },
      {
        type = "item",
        name = "structurized-concrete",
        icon = "__simulacrum__/graphics/icons/structurized-concrete.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "simulacrum-production",
        order = "aaz[structurized-concrete]",
        stack_size = 128,
        place_as_tile =
        {
          result = "structurized-concrete",
          condition_size = 1,
          condition = { "ground-tile" }
        }
      },
      {
        type = "item",
        name = "harddrive",
        icon = "__simulacrum__/graphics/icons/harddrive.png",
        icon_size = 128, icon_mipmaps = 4,
        subgroup = "simulacrum-harddrives",
        order = "a",
        stack_size = 1
      },
      {
        type = "item",
        name = "harddrive-dummy",
        icon = "__simulacrum__/graphics/icons/harddrive.png",
        icon_size = 128, icon_mipmaps = 4,
        subgroup = "simulacrum-harddrives",
        order = "z",
        stack_size = 1
      },
      {
        type = "item",
        name = "unstable-harddrive",
        icon = "__simulacrum__/graphics/icons/unstable-harddrive.png",
        icon_size = 128, icon_mipmaps = 4,
        subgroup = "simulacrum-harddrives",
        order = "b",
        stack_size = 8
      },
      {
        type = "item",
        name = "bit-combinator",
        icons = {
          {
            icon = "__base__/graphics/icons/constant-combinator.png",
          },
          {
          icon = "__simulacrum__/graphics/icons/micros/1.png",
          }
          },
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "simulacrum-computers",
        order = "a1",
        stack_size = 32,
        place_result = "bit-combinator"
      },
      {
        type = "item",
        name = "byte-combinator",
        icons = {
          {
            icon = "__base__/graphics/icons/constant-combinator.png",
          },
          {
          icon = "__simulacrum__/graphics/icons/micros/4.png",
          }
          },
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "simulacrum-computers",
        order = "a2",
        stack_size = 32,
        place_result = "byte-combinator"
      },
      {
        type = "item",
        name = "short-word-chest",
        icons = {
          {
            icon = "__simulacrum__/graphics/icons/structurized-chest.png",
          },
          {
          icon = "__simulacrum__/graphics/icons/micros/32.png",
          }
        },
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "simulacrum-logistics",
        order = "aag[chest]1",
        stack_size = 32,
        place_result = "short-word-chest"
      },
      {
        type = "item",
        name = "quantum-chest",
        icon_size = 64, icon_mipmaps = 4,
        icon = "__base__/graphics/icons/linked-chest-icon.png",
        subgroup = "simulacrum-logistics",
        order = "aag[chest]2",
        stack_size = 32,
        place_result = "quantum-chest"
      },
})