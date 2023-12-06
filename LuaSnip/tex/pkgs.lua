local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

local pkg_groups = {
    math = {"amsmath", "amsthm", "amssymb", "amsfonts", "mathrsfs"},
    fig = {"graphicx", "float", "wrapfig"},
    tikz = {"tikz", "tikz-cd"},
}

local snippets = {
    s(
        {trig = "\\pkg"},
        fmt("\\usepackage{<>}\n", {i(1)})
    ),
    s(
        {trig = "\\pkga"},
        fmt("\\usepackage[<>]{<>}\n", {i(2), i(1)})
    )
}

for k, v in pairs(pkg_groups) do
    local cmd = ""
    for _, p in pairs(v) do
        cmd = cmd .. "\\usepackage{" .. p .. "}\n"
    end
    table.insert(snippets, s(
        {trig="pkg" .. k},
        fmt(cmd, {})
    ))
end

table.insert(snippets, s(
    {trig = "\\fig"},
    fmt([[
        \begin{figure}[<>]
        \centering
        <>
        \end{figure}
    ]], {i(1, "H"), i(2)})
))

return snippets

