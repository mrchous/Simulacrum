--[[
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
]]--

require("worldgen/patterns")
require("worldgen/lib/transforms")

local function eval(str, env)
    -- string.find(str, "return", 1, true) ~= nil then
    if env == nil then
        return assert(load("return (" .. str .. ")", str, 't'))()
    else
        return assert(load("return (" .. str .. ")", str, 't', env))()
    end
end

local function evaluate_pattern_with_context(pattern, vars)
    if vars == nil then
        return eval(pattern)
    end

    local env = {}
    setmetatable(env, {__index = _G})
    for i = 1, #vars do
        local item = vars[#vars - i + 1]
        local var_name = item[1]
        local var_value = eval(item[2], env)
        env[var_name] = var_value
    end

    return eval(pattern, env)
end

function evaluate_pattern()
    local land_pattern, void_pattern, water_tile, deepwater_tile, void_tile

    local preset = "Tighten(Zoom(Maze2(), 50))"
    local pattern
    pattern = evaluate_pattern_with_context(preset)

    if pattern.output == "tilename" then
        return pattern
    elseif pattern.output == "bool" then
        return TP(pattern, nil, nil)
    elseif pattern.output == "tileid" then
        return TileID2Name(pattern, nil)
    else
        return nil
    end
end
