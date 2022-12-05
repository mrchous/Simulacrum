--[[
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
]]--

local magic = 0x45d9f3b
local rshift = bit32.rshift
local xor = bit32.bxor
local M = 2 ^ 32

-- Hash function used as randomness primitive for all other
-- functions.
function hash_(x)
    x = xor(x, rshift(x, 16)) * magic
    x = xor(x, rshift(x, 16)) * magic
    return xor(x, rshift(x, 16))
end

-- If seed is 0 or nil, creates global.rng with a random seed. Otherwise uses the given seed.
function init_global_rng(seed)
    if seed == 0 or seed == nil then
        seed = game.create_random_generator()(0, M - 1)
    end
    global.seed = seed
    global.rng = game.create_random_generator(seed)
    print("Terrain generation seed " .. tostring(global.seed))
end

-- Statefully uses global.rng to get a new 32 bit integer
function rand_i()
    return global.rng(0, M - 1)
end

-- Uses global.rng to create another rng
function new_rng()
    return game.create_random_generator(rand_i())
end

-- Stateless random number generators.
-- These functions have no side effects.
-- The argument 'r' is assumed to be a 32 bit integer
-- which is a source of high-quality randomness.
-- Other arguments are assumed to not be a source of randomness.

function rand_i2i(r)
    return hash_(r)
end

function rand_ii2i(r, x)
    return hash_(xor(r, x))
end

function rand_iii2i(r, x, y)
    return hash_(xor(hash_(xor(r, x)), y))
end

function rand_iiii2i(r, x, y, z)
    return hash_(xor(hash_(xor(hash_(xor(r, x)), y)), z))
end

function rand_ii2f(r, x)
    return hash_(xor(r, x)) / M
end

function rand_iii2f(r, x, y)
    return hash_(xor(hash_(xor(r, x)), y)) / M
end

function rand_iiii2f(r, x, y, z)
    return hash_(xor(hash_(xor(hash_(xor(r, x)), y)), z)) / M
end

function rand_ii2b(r, x)
    return (hash_(xor(r, x)) % 2) == 0
end

function rand_iii2b(r, x, y)
    return (hash_(xor(hash_(xor(r, x)), y)) % 2) == 0
end

function rand_iiii2b(r, x, y, z)
    return (hash_(xor(hash_(xor(hash_(xor(r, x)), y)), z)) % 2) == 0
end
