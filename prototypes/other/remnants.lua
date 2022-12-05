data:extend({

  {
    type = "corpse",
    name = "byte-belt-remnants",
    icon = "__simulacrum__/graphics/icons/byte-belt.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "belt-remnants",
    order = "a-b-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =  make_rotated_animation_variations_from_sheet (2,
    {
      filename = "__simulacrum__/graphics/entity/transport-belt/remnants/transport-belt-remnants.png",
      line_length = 1,
      width = 54,
      height = 52,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 4,
      shift = util.by_pixel(1, 0),
      hr_version =
      {
        filename = "__simulacrum__/graphics/entity/transport-belt/remnants/hr-transport-belt-remnants.png",
        line_length = 1,
        width = 106,
        height = 102,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 4,
        shift = util.by_pixel(1, -0.5),
        scale = 0.5
      }
    })
  },

  {
    type = "corpse",
    name = "byte-underground-belt-remnants",
    icon = "__simulacrum__/graphics/icons/byte-underground-belt.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map", "building-direction-8-way"},
    subgroup = "belt-remnants",
    order="a-d-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__simulacrum__/graphics/entity/underground-belt/remnants/underground-belt-remnants.png",
      line_length = 1,
      width = 78,
      height =72,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 8,
      shift = util.by_pixel(10, 3),
      hr_version =
      {
        filename = "__simulacrum__/graphics/entity/underground-belt/remnants/hr-underground-belt-remnants.png",
        line_length = 1,
        width = 156,
        height = 144,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 8,
        shift = util.by_pixel(10.5, 3),
        scale = 0.5
      }
    }
  },
  {
    type = "corpse",
    name = "short-word-chest-remnants",
    localised_name = {"remnant-name", {"entity-name.logistic-chest-passive-provider"}},
    icon = "__simulacrum__/graphics/icons/structurized-chest.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    subgroup = "logistic-network-remnants",
    order = "a-d-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__simulacrum__/graphics/entity/short-word-chest/passive-provider-chest-remnants.png",
      line_length = 1,
      width = 60,
      height = 42,
      frame_count = 1,
      direction_count = 1,
      shift = util.by_pixel(10.5, -2.5),
      hr_version =
      {
        filename = "__simulacrum__/graphics/entity/short-word-chest/hr-passive-provider-chest-remnants.png",
        line_length = 1,
        width = 116,
        height = 82,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel(10, -3),
        scale = 0.5
      }
    }
  },

})