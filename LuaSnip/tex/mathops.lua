local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

local in_math = function()
    return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

local two_arg_o = {
    ff = "frac",
    df = "dfrac",
}

local snippets = {
    s({trig="newops"}, fmt("\\DeclareMathOperator{<>}{<>}", {i(1), i(2)})),
    s(
        {trig="ff", snippetType="autosnippet"},
        fmt([[^{<>}]], {i(1)}),
        {condition = in_math}
    ),
    s(
        {trig="jj", snippetType="autosnippet"},
        fmt([[_{<>}]], {i(1)}),
        {condition = in_math}
    ),
    s(
        {trig="(", snippetType="autosnippet"},
        fmt([[(<>)]], {i(1)}),
        {condition = in_math}
    ),
    s(
        {trig="[", snippetType="autosnippet"},
        fmt("[<>]", {i(1)}),
        {condition = in_math}
    ),
    s(
        {trig="\\{", snippetType="autosnippet"},
        fmt("\\{<>\\}", {i(1)}),
        {condition = in_math}
    ),
    s(
        {trig="\\l(", snippetType="autosnippet"},
        fmt("\\left(<>\\right)", {i(1)}),
        {condition = in_math}
    ),
    s(
        {trig="\\l{", snippetType="autosnippet"},
        fmt("\\left\\{<>\\right\\}", {i(1)}),
        {condition = in_math}
    ),
    s(
        {trig="\\gl2", snippetType="autosnippet"},
        fmt([[
        %
        \begin{pmatrix}
            <> &<> \\
            <> &<> \\
        \end{pmatrix}
        ]], {i(1, "a"), i(2, "b"), i(3, "c"), i(4, "d")}),
        {condition = in_math}
    )
}

for k, v in pairs(two_arg_o) do
    table.insert(snippets, s(
        {trig = "\\" .. k},
        fmt("\\" .. v .. "{<>}{<>}", {i(1), i(2)}),
        {condition = in_math}
    ))
end

return snippets

