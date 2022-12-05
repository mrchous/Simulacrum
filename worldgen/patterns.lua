--[[
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
]]--

require("worldgen/maze2")

function TileID2Name(pattern, water_color)
    water_tile = 'virtual-water'
    deep_water_tile = 'virtual-water'
    local void_tile = 'out-of-map'

    local pget = pattern.get
    local lookup = {}
    lookup[1] = nil
    lookup[0] = water_tile
    lookup[-1] = deep_water_tile
    lookup[-2] = void_tile

    local function get(x, y)
        return lookup[pget(x, y)]
    end

    return {
        create = pattern.create,
        reload = pattern.reload,
        get = get,
        output = "tilename"
    }
end

function TP(land_pattern, void_pattern, water_color)
    water_tile = 'virtual-water'

    local function create()
        local d = {}
        if land_pattern ~= nil then
            d[1] = land_pattern.create()
        end
        if void_pattern ~= nil then
            d[2] = void_pattern.create()
        end
        return d
    end

    local function reload(d)
        if land_pattern ~= nil then
            land_pattern.reload(d[1])
        end
        if void_pattern ~= nil then
            void_pattern.reload(d[2])
        end
    end

    local lg, vg, get

    if land_pattern ~= nil then
        lg = land_pattern.get
    end
    if void_pattern ~= nil then
        vg = void_pattern.get
    end

    if land_pattern == nil then
        if void_pattern == nil then
            get = function(x, y)
                return nil
            end
        else
            get = function(x, y)
                if vg(x, y) then
                    return nil
                else
                    return void_tile
                end
            end
        end
    else
        if void_pattern == nil then
            get = function(x, y)
                if lg(x, y) then
                    return nil
                else
                    return water_tile
                end
            end
        else
            get = function(x, y)
                if vg(x, y) then
                    if lg(x, y) then
                        return nil
                    else
                        return water_tile
                    end
                else
                    return void_tile
                end
            end
        end
    end

    return {
        create = create,
        reload = reload,
        get = get,
        output = "tilename"
    }
end
