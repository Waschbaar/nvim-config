local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

local two_arg_o = {
    fc = "frac",
    df = "dfrac",
}


local inside_env = function(name)
    local lines = vim.fn["vimtex#env#is_inside"](name)
    return not (lines[1] == 0 or lines[2] == 0)
end

local in_math = function()
    local mathzone = vim.fn["vimtex#syntax#in_mathzone"]() == 1
    return mathzone or inside_env("tikzcd")
end

local in_comment = function()
    return vim.fn["vimtex#syntax#in_comment"]() == 1
end

local in_text = function()
    return (not env_detect.in_math()) and (not env_detect.in_comment())
end

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

