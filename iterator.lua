#!/usr/bin/env lua

function reverse(tbl)
    local i = #tbl + 1
    return function()
        if i > 1 then
            i = i - 1
            return i, tbl[i]
        else
            return
        end
    end
end

local tbl = {1, 2, 3, 4, 5}
for k, v in reverse(tbl) do
    print(k, v)
end

t1 = {1, 2, 3, 4, 5}
t2 = {}
q = {}
print(q[1]) 
setmetatable(q, t2)
print(q[1]) 
t2.__index = tbl
print(q[1]) 
