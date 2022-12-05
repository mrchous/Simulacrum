--[[
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
]]--

require("worldgen/lib/queue")

-- Based on Wilson's algorithm
function Maze2()
    local dirs = {
        {dx = 1, dy = 0},
        {dx = -1, dy = 0},
        {dx = 0, dy = 1},
        {dx = 0, dy = -1}
    }

    local data

    local function key(x, y)
        if x == 0 then
            x = 0
        end
        if y == 0 then
            y = 0
        end

        return x .. '#' .. y
    end

    local function makeland(x, y)
        data.land[key(x, y)] = true
        data.nearland[key(x, y)] = true
        data.nearland[key(x - 1, y)] = true
        data.nearland[key(x + 1, y)] = true
        data.nearland[key(x, y - 1)] = true
        data.nearland[key(x, y + 1)] = true
        data.nearishland[key(x - 1, y - 1)] = true
        data.nearishland[key(x + 1, y - 1)] = true
        data.nearishland[key(x - 1, y + 1)] = true
        data.nearishland[key(x + 1, y + 1)] = true
    end

    local function create()
        data = {
            land            = {},
            nearland        = {},
            nearishland     = {},
            pending         = {},
            pendingsum      = 0,
            pendingr        = 0,
            nearest         = 0,
            rng             = new_rng()
        }

        makeland(0, 0)
        makeland(-1, 0)
        makeland(0, -1)
        makeland(-1, -1)

        return data
    end

    local function reload(d)
        data = d
    end

    local function weight(x, y)
        return 1 / math.sqrt(math.abs(x * x) + math.abs(y * y) + 4)
    end

    local function impend(x, y)
        local k = key(x, y)
        if (not data.nearishland[k]) and (not data.nearland[k]) and (data.pending[k] == nil) then
            local w = weight(x, y)
            data.pending[k] = {x = x, y = y, w = w}
            data.pendingsum = data.pendingsum + w
            if x * x + y * y < data.nearest then
                data.nearest = x * x + y * y
            end
        end
    end

    local function update_pending()
        for k, _ in pairs(data.pending) do
            if data.nearishland[k] or data.nearland[k] then
                data.pending[k] = nil
            end
        end

        local sum = 0
        local nearest = 1000000000
        for _, v in pairs(data.pending) do
            sum = sum + v.w
            local n = v.x * v.x + v.y * v.y
            if n < nearest then
                nearest = n
            end
        end
        data.pendingsum = sum
        data.nearest = nearest

        local n = data.pendingr
        while data.pendingsum < 5 do
            for i = -n, n do
                impend(i, -n)
                impend(i, n)
                impend(-n, i)
                impend(n, i)
            end
            n = n + 1
            data.pendingr = n
        end
    end

    local function random_direction(x, y)
        if data.rng() < 0.95 then
            return dirs[1 + math.floor(data.rng() * 4)]
        else
            if data.rng() < 0.5 then
                if x < 0 then
                    return {dx = 1, dy = 0}
                else
                    return {dx = -1, dy = 0}
                end
            else
                if y < 0 then
                    return {dx = 0, dy = 1}
                else
                    return {dx = 0, dy = -1}
                end
            end
        end
    end

    local function fill_shortest_path(path, x, y)
        local q = Queue()
        local visited = {}

        q.push({x = x, y = y})
        local p
        while true do
            p = q.pop()
            local k = key(p.x, p.y)
            if path[k] and (visited[k] == nil) then
                visited[k] = true
                if data.nearland[k] then
                    break
                end
                for _, d in pairs(dirs) do
                    q.push({x = p.x + d.dx, y = p.y + d.dy, prev = p})
                end
            end
        end

        while not (p == nil) do
            makeland(p.x, p.y)
            p = p.prev
        end
    end

    local function diffuse_from(x, y)
        local n = {}
        local k
        local cx, cy
        cx, cy = x, y
        
        while true do
            k = key(cx, cy)
            if data.nearland[k] then
                break
            end
            d = random_direction(cx, cy)
            cx = cx + d.dx
            cy = cy + d.dy
            n[k] = key(cx, cy)
        end

        path = {}
        k = key(x, y)
        while not (k == nil) do
            path[k] = true
            k = n[k]
        end

        fill_shortest_path(path, x, y)
    end

    local function diffuse()
        update_pending()
        r = data.rng() * data.pendingsum

        for k, v in pairs(data.pending) do
            r = r - v.w
            if r < 0 then
                diffuse_from(v.x, v.y)
                break
            end
        end
    end

    local function geti(x, y)
        while math.sqrt(x * x + y * y) + 5 > math.sqrt(data.nearest) do
            diffuse()
        end
        return data.land[key(x, y)] == true
    end

    local function get(x, y)
        return geti(math.floor(x + 0.5), math.floor(y + 0.5))
    end

    return {
        create = create,
        reload = reload,
        get = get,
        output = "bool"
    }
end
