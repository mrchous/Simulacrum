--[[
      primary = Main Liqud
      secondary = Secondary liquid
      tertiary = Top smoke
      quaternary = Bottom smoke
]]--

data:extend(
{
  {
    type = "recipe",
    name = "extract-bits",
    energy_required = 0.5,
    category = "bit-operations-assembler",
    ingredients =
    {
      {"bit-ore", 1},
    },
    results =
    {
      {type="item", name="bit-1", amount=1, probability = 0.2},
      {type="item", name="bit-0", amount=1, probability = 0.2},
    },
    subgroup = "simulacrum-raw-resource",
    icon = "__simulacrum__/graphics/icons/bit-ore.png",
    icon_size = 64,
    order = "za[extract-bits]",
  },
  {
    type = "recipe",
    name = "concentrate-bits",
    category = "bit-operations-chemistry",
    subgroup = "simulacrum-raw-resource",
    energy_required = 1,
    ingredients =
    {
      {
      type="fluid", 
      name="bit-stream", 
      amount=80
      }
    },
    crafting_machine_tint =
    {
      primary = {r=0, g=1, b=1, a = 1.000},
      secondary = {r=1, g=85/255, b=85/255, a = 1.000},
      tertiary = {r=0, g=1, b=0, a = 1.000},
      quaternary = {r=1, g=0, b=1, a = 1.000},
    },
    results=
    {
      {type="fluid", name="byte-stream", amount=10}
    },
    icon = "__simulacrum__/graphics/icons/byte-stream.png",
    icon_size = 64,
    order = "zb[concentrate-bits]",
    enabled = false
  },
  {
    type = "recipe",
    name = "word-putty",
    category = "bit-operations-chemistry",
    subgroup = "simulacrum-raw-resource",
    energy_required = 8,
    ingredients =
    {
      {
      type="fluid", 
      name="byte-stream", 
      amount=8
      }
    },
    crafting_machine_tint =
    {
      primary = {r=0, g=1, b=0, a = 1},
      secondary = {r=1, g=0, b=1, a = 1.000},
      tertiary = {r=1, g=85/255, b=85/255, a = 1.000},
      quaternary = {r=0, g=1, b=1, a = 1.000},
    },
    results=
    {
      {type="item", name="word-putty", amount=1}
    },
    icon = "__simulacrum__/graphics/icons/word-putty.png",
    icon_size = 64,
    order = "zb[word-putty]",
    enabled = false
  },
  {
    type = "recipe",
    name = "extract-pointers",
    energy_required = 4,
    category = "bit-operations-smelting",
    ingredients =
    {
      {"pointer-ore", 1},
    },
    results =
    {
      {type="item", name="pointer", amount=1, probability = 1},
    },
    subgroup = "simulacrum-raw-resource",
    icon = "__simulacrum__/graphics/icons/pointer.png",
    icon_size = 64,
    order = "za[extract-pointers]",
  },
  {
    type = "recipe",
    name = "byte-plate",
    energy_required = 2,
    category = "bit-operations-assembler",
    ingredients =
    {
      {"bit-0", 4},
      {"bit-1", 4},
    },
    results =
    {
      {type="item", name="byte-plate", amount=1, probability = 1},
    },
    subgroup = "simulacrum-raw-resource",
    icon = "__simulacrum__/graphics/icons/byte-plate.png",
    icon_size = 64,
    order = "zb[byte-plate]",
  },
  {
    type = "recipe",
    name = "bit-science-pack",
    energy_required = 8,
    category = "bit-operations-assembler",
    ingredients =
    {
      {"byte-plate", 2},
      {"pointer", 2},
    },
    results =
    {
      {type="item", name="bit-science-pack", amount=1, probability = 1},
    },
    subgroup = "simulacrum-science-pack",
    order = "zza[bit-science-pack]1",
  },
  {
    type = "recipe",
    name = "bit-assembler",
    energy_required = 4,
    category = "bit-operations-assembler",
    ingredients =
    {
      {"byte-plate", 2},
      {"pointer", 2},
    },
    results =
    {
      {type="item", name="bit-assembler", amount=1, probability = 1},
    },
    subgroup = "simulacrum-production",
    order = "zaa[bit-assembler]1",
    enabled = false
  },
  {
    type = "recipe",
    name = "bit-inserter",
    energy_required = 4,
    category = "bit-operations-assembler",
    ingredients =
    {
      {"byte-plate", 2},
      {"pointer", 2},
    },
    results =
    {
      {type="item", name="bit-inserter", amount=1, probability = 1},
    },
    subgroup = "simulacrum-logistics",
    order = "zac[bit-inserter]3",
    enabled = false
  },
  {
    type = "recipe",
    name = "byte-belt",
    energy_required = 4,
    category = "bit-operations-assembler",
    ingredients =
    {
      {"byte-plate", 2},
      {"pointer", 2},
    },
    results =
    {
      {type="item", name="byte-belt", amount=1, probability = 1},
    },
    subgroup = "simulacrum-logistics",
    order = "zac[byte-belt]1",
    enabled = false
  },
  {
    type = "recipe",
    name = "byte-underground-belt",
    energy_required = 4,
    category = "bit-operations-assembler",
    ingredients =
    {
      {"byte-plate", 2},
      {"pointer", 2},
    },
    results =
    {
      {type="item", name="byte-underground-belt", amount=1, probability = 1},
    },
    subgroup = "simulacrum-logistics",
    order = "zac[byte-underground-belt]2",
    enabled = false
  },
  {
    type = "recipe",
    name = "bit-mixer",
    energy_required = 8,
    category = "bit-operations-assembler",
    ingredients =
    {
      {"byte-plate", 2},
      {"pointer", 2},
    },
    results =
    {
      {type="item", name="bit-mixer", amount=1, probability = 1},
    },
    subgroup = "simulacrum-production",
    order = "zaa[bit-mixer]2",
    enabled = false
  },
  {
    type = "recipe",
    name = "bit-drill",
    energy_required = 4,
    category = "bit-operations-assembler",
    ingredients =
    {
      {"byte-plate", 2},
      {"pointer", 2},
    },
    results =
    {
      {type="item", name="bit-drill", amount=1, probability = 1},
    },
    subgroup = "simulacrum-production",
    order = "zada[bit-drill]1",
    enabled = false
  },
  {
    type = "recipe",
    name = "harddrive",
    energy_required = 32,
    category = "harddrives-make",
    ingredients =
    {
      {"byte-plate", 2},
      {"pointer", 2},
    },
    results =
    {
      {type="item", name="harddrive", amount=1, probability = 1},
    },
    subgroup = "simulacrum-harddrives",
    order = "b",
    enabled = true
  },
  {
    type = "recipe",
    name = "unstable-harddrive",
    energy_required = 60,
    category = "harddrives-consume",
    ingredients =
    {
      {"harddrive", 1},
    },
    results =
    {
      {type="item", name="unstable-harddrive", amount=1, probability = 0.3},
    },
    subgroup = "simulacrum-harddrives",
    order = "a",
    enabled = true,
    allow_inserter_overload = false
  },
  {
    type = "recipe",
    name = "harddrive-none",
    energy_required = 1200,
    category = "harddrives-consume-none",
    hidden = true,
    hide_from_player_crafting = true,
    unlock_results = false,
    ingredients =
    {
      {"harddrive-dummy", 1},
    },
    results =
    {
      {type="item", name="unstable-harddrive", amount=1, probability = 0.3},
    },
    subgroup = "simulacrum-harddrives",
    order = "a",
    enabled = true
  },
  {
    type = "recipe",
    name = "bit-combinator",
    energy_required = 4,
    category = "bit-operations-assembler",
    ingredients =
    {
      {"byte-plate", 2},
      {"pointer", 2},
    },
    results =
    {
      {type="item", name="bit-combinator", amount=1, probability = 1},
    },
    subgroup = "simulacrum-computers",
    order = "a1",
    enabled = false
  },
  {
    type = "recipe",
    name = "byte-combinator",
    energy_required = 4,
    category = "bit-operations-assembler",
    ingredients =
    {
      {"byte-plate", 2},
      {"pointer", 2},
    },
    results =
    {
      {type="item", name="byte-combinator", amount=1, probability = 1},
    },
    subgroup = "simulacrum-computers",
    order = "a2",
    enabled = false
  },
}
)