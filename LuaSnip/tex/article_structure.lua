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

local env_detect = {}

env_detect.inside_env = function(name)
    local lines = vim.fn["vimtex#env#is_inside"](name)
    return not (lines[1] == 0 or lines[2] == 0)
end

env_detect.in_math = function()
    local mathzone = vim.fn["vimtex#syntax#in_mathzone"]() == 1
    return mathzone or env_detect.inside_env("tikzcd")
end

env_detect.in_comment = function()
    return vim.fn["vimtex#syntax#in_comment"]() == 1
end

env_detect.in_text = function()
    return (not env_detect.in_math()) and (not env_detect.in_comment())
end
local not_in_math = function()
    return not env_detect.in_math()
end

local snippets = {}

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

