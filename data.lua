local p = "prototypes/"
local po = p .. "other/"

require(po.."group")
require(po.."resources")
require(po.."tiles")
require(p.."item")
require(p.."recipe")
require(p.."entity")
require(p.."technology")
require(po.."signal")
require(po.."remnants")
require(po.."decoratives")

require(p.."computers/one-time-pad")
require(p.."computers/computer-1")
require(p.."computers/computer-2")
require(p.."computers/computer-3")
require(p.."computers/computer-4")
require(p.."computers/port")

local noise = require("noise")
local nowater = {probability_expression = noise.to_noise_expression(-math.huge)}
local t = data.raw.tile
t.water.autoplace = nowater
t.deepwater.autoplace = nowater
t['water-green'].autoplace = nowater
t['deepwater-green'].autoplace = nowater

data:extend({
    {
		type = 'custom-input',
		name = 'quantum-chest-filter',
		key_sequence = 'U',
	},
})

data:extend({
	--[[
    {
		type = 'custom-input',
		name = 'clear-computers',
		key_sequence = 'J',
	},
    {
		type = 'custom-input',
		name = 'print-computers',
		key_sequence = 'K',
	},
	--]]
	{
		type = "custom-input",
		name = "teleport",
		key_sequence = "SHIFT + T",
		action = "lua"
	},
})


data:extend({
	{
		type = "sprite",
		name = "teleport-button",
		filename = "__simulacrum__/graphics/icons/teleport.png",
		size = 256,
	},
})

data:extend({
    {
      type = "shortcut",
      name = "teleport",
      toggleable = true,
      localised_name = { "strings.teleport"},
	  localised_description = {"stringsdesc.teleport"},
      order = "a",
      action = "lua",
      icon = {
        filename = "__simulacrum__/graphics/icons/teleport.png",
        flags = {
          "icon"
        },
        priority = "extra-high-no-scale",
        size = 256
      },
    },
  })