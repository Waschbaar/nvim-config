local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

local snippets = {
    s({ trig="newcmd" },
    fmt("\\newcommand{<>}{<>}", { i(1) , i(2) })),

    s({ trig="newcmda" },
    fmt("\\newcommand{<>}[<>]{<>}", { i(1), i(2), i(3)})),

    s({ trig="newthm" },
    fmt("\\newtheorem{<>}{<>}", { i(1), i(2) })),
}

table.insert(snippets, s(
    {trig = "\\c", },
    fmt("\\<>{<>}", {i(1), i(2)})
))

return snippets

