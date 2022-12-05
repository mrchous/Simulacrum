local noise = require("noise")
local nowater = {probability_expression = noise.to_noise_expression(-math.huge)}

local virtual_concrete = table.deepcopy(data.raw.tile["tutorial-grid"])
virtual_concrete.map_color = {0.54, 0.168, 0.886}
virtual_concrete.walking_speed_modifier = 1.5
virtual_concrete.tint = {0.54, 0.168, 0.886}
virtual_concrete.name = "virtual-concrete"
virtual_concrete.allowed_neighbors = { "virtual-water", "structurized-concrete" }

local structurized_concrete = table.deepcopy(data.raw.tile["tutorial-grid"])
structurized_concrete.map_color = {1, 90/255, 0}
structurized_concrete.walking_speed_modifier = 1.5
structurized_concrete.tint = {1, 90/255, 0}
structurized_concrete.name = "structurized-concrete"
structurized_concrete.allowed_neighbors = { "virtual-water", "virtual-concrete" }

local virtual_water = table.deepcopy(data.raw.tile["water"])
virtual_water.map_color = {0, 1, 0.4}
virtual_water.layer = 14
virtual_water.tint = {0, 1, 0.4}
virtual_water.effect_color = {0, 1, 0.4}
virtual_water.effect_color_secondary = {0, 1, 0.4}
virtual_water.name = "virtual-water"
virtual_water.allowed_neighbors = { "virtual-concrete", "structurized-concrete" }
virtual_water.autoplace = nowater

data:extend({virtual_concrete, virtual_water, structurized_concrete})