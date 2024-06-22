#!/usr/bin/env lua

function reverse(tbl)

    local u8
    local ok, _ = pcall(function()
        u8 = require "utf8"
    end)

    if type(tbl) == 'table' then
        local i = #tbl + 1
        return function()
            if i > 1 then
                i = i - 1
                return i, tbl[i]
            else
                return
            end
        end
    elseif type(tbl) == 'string' then
        local i = #tbl + 1
        return function()
            if i > 1 then
                i = i - 1
                return i, string.sub(tbl, i, i)
            else
                return
            end
        end
    end
end

--[[
print("Test on table")
local tbl = {1, 2, 3, 4, 5}
for k, v in reverse(tbl) do
    print(k, v)
end
--]]

local u8 = require "utf8"

--Конечно, вот последний абзац романа "Война и мир" Льва Толстого:
local piece_and_war = [[
Но предчувствия все более и более удалялись от него, и его мысли были всегда заняты теми общими интересами, которые свойственны людям его возраста.
]]

local piece_and_war_reverserd = [[
акопс всет ит ендерп ан ина лосвопопс ен, вадотечовос елннед алгопсатс а алялусоп, идуп н а н гнищеброп ан ал, овед овревалрг ен еурб н атреск от Я. ядопсу ов ларне ажедовом аретнеб ё онт икнавороб уд тевирпотсоп рока ач акопс в атевирпотсоп
]]

local t = {}
for _, v in u8.codes(piece_and_war_reverserd) do
    table.insert(t, u8.char(v))
end

local accum = ""
for _, v in reverse(t) do
    accum = accum .. v
end
print(accum)

--[[
print("Test on string")
for k, v in reverse("Hello") do
    print(k, v)
end
--]]

--[[
-- Что делает этот кода?
t1 = {1, 2, 3, 4, 5}
t2 = {}
q = {}
print(q[1]) 
setmetatable(q, t2)
print(q[1]) 
t2.__index = tbl
print(q[1]) 
--]]
