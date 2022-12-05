local hit_effects = require ("__base__/prototypes/entity/hit-effects")
local decorative_trigger_effects = require("__base__/prototypes/decorative/decorative-trigger-effects")
local sounds = require ("__base__/prototypes/entity/sounds")

local virtual_stone_huge = table.deepcopy((data.raw["simple-entity"]["rock-huge"]))
local virtual_stone_big = table.deepcopy((data.raw["simple-entity"]["rock-big"]))

local smoke_animations = require("__base__/prototypes/entity/smoke-animations")
local util = require("util")

local smoke_fast_animation = smoke_animations.trivial_smoke_fast
local trivial_smoke = smoke_animations.trivial_smoke

virtual_stone_huge.name = "virtual-stone-huge"
virtual_stone_huge.minable =
{
  mining_particle = "stone-particle",
  mining_time = 8,
  results = {{name = "bit-ore", amount_min = 60, amount_max = 100}, {name = "pointer-ore", amount_min = 10, amount_max = 20}},
}
virtual_stone_huge.loot =
{
    {item = "bit-ore", amount_min = 60, amount_max = 100}
}
virtual_stone_huge.map_color = {0, 0.7, 0.6}

virtual_stone_big.name = "virtual-stone-big"
virtual_stone_big.minable =
{
  mining_particle = "stone-particle",
  mining_time = 2,
  result = "bit-ore",
  count = 20
}
virtual_stone_big.loot =
{
  {item = "bit-ore", probability = 1, count_min = 9, count_max = 25}
}
virtual_stone_big.map_color = {0, 0.7, 0.6}

for _, v in pairs(virtual_stone_huge.pictures) do 
  v.tint = {0, 0.7, 0.6}
  v.hr_version.tint = {0, 0.7, 0.6}
end

for _, v in pairs(virtual_stone_big.pictures) do 
  v.tint = {0, 0.7, 0.6}
  v.hr_version.tint = {0, 0.7, 0.6}
end

local virtual_wood_1 = table.deepcopy((data.raw["tree"]["dead-dry-hairy-tree"]))
local virtual_wood_2 = table.deepcopy((data.raw["tree"]["dead-grey-trunk"]))
local virtual_wood_3 = table.deepcopy((data.raw["tree"]["dead-tree-desert"]))
local virtual_wood_4 = table.deepcopy((data.raw["tree"]["dry-hairy-tree"]))
local virtual_wood_5 = table.deepcopy((data.raw["tree"]["dry-tree"]))

virtual_wood_1.name = "virtual-wood-1"
virtual_wood_1.map_color = {1, 90/255, 0}
virtual_wood_1.minable =
    {
      mining_particle = "wooden-particle",
      mining_time = 0.5,
      result = "structurized-data",
      count = 5
    }
for _, v in pairs(virtual_wood_1.pictures) do 
  v.tint = {1, 90/255, 0}
  v.hr_version.tint = {1, 90/255, 0}
end

virtual_wood_2.name = "virtual-wood-2"
virtual_wood_2.map_color = {0, 0, 1}
virtual_wood_2.minable =
    {
      mining_particle = "wooden-particle",
      mining_time = 0.5,
      result = "structurized-data",
      count = 5
    }
for _, v in pairs(virtual_wood_2.pictures) do 
  v.tint = {0, 0, 1}
  v.hr_version.tint = {0, 0, 1}
end

virtual_wood_3.name = "virtual-wood-3"
virtual_wood_3.map_color = {1, 0, 1}
virtual_wood_3.minable =
    {
      mining_particle = "wooden-particle",
      mining_time = 0.5,
      result = "structurized-data",
      count = 5
    }
for _, v in pairs(virtual_wood_3.pictures) do 
  v.tint = {1, 0, 1}
  v.hr_version.tint = {1, 0, 1}
end

virtual_wood_4.name = "virtual-wood-4"
virtual_wood_4.map_color = {50/255, 1, 0}
virtual_wood_4.minable =
    {
      mining_particle = "wooden-particle",
      mining_time = 0.5,
      result = "structurized-data",
      count = 5
    }
for _, v in pairs(virtual_wood_4.pictures) do 
  v.tint = {50/255, 1, 0}
  v.hr_version.tint = {50/255, 1, 0}
end

virtual_wood_5.name = "virtual-wood-5"
virtual_wood_5.map_color = {0, 1, 1}
virtual_wood_5.minable =
    {
      mining_particle = "wooden-particle",
      mining_time = 0.5,
      result = "structurized-data",
      count = 5
    }
for _, v in pairs(virtual_wood_5.pictures) do 
  v.tint = {0, 1, 1}
  v.hr_version.tint = {0, 1, 1}
end

data:extend({
  virtual_stone_huge,
  virtual_stone_big,
  virtual_wood_1,
  virtual_wood_2,
  virtual_wood_3,
  virtual_wood_4,
  virtual_wood_5,
  trivial_smoke
  {
    name = "magenta-smoke-big",
    color = {r = 1, g = 0, b = 1, a = 0.3},
    start_scale = 0.8,
    fade_in_duration = 30
  },
  trivial_smoke
  {
    name = "red-smoke-small",
    color = {r = 1, g = 0, b = 0, a = 0.4}
  }
})