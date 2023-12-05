local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

local levels = {
    pt = "part",
    ch = "chapter",
    se = "section",
    ss = "subsection",
    sss = "subsubsection",
    pa = "paragraph",
}

local not_in_math = function()
    return not (vim.fn["vimtex#syntax#in_mathzone"]() ==  1)
end

local snippets = {s(
    { trig="\\env" },
    fmt("\n" .. [[
        \begin{<>}
        <>
        \end{<>}

    ]], {i(1), i(2), rep(1)})
)}

for k, v in pairs(levels) do
    table.insert(snippets, s(
        { trig = "\\" .. k },
        fmt("\\" .. v .. "{<>}", {i(1)}),
        {condition=not_in_math}
    ))
    table.insert(snippets, s(
        { trig = "\\" .. k .. "u" },
        fmt("\\" .. v .. "*{<>}", {i(1)}),
        {condition=not_in_math}
    ))
end

table.insert(snippets, s({trig = "m"}, fmt("$ <> $", {i(1)}), {condition=not_in_math}))
table.insert(snippets, s({trig = "mm"}, fmt("$$ <> $$", {i(1)}), {condition=not_in_math}))

return snippets

