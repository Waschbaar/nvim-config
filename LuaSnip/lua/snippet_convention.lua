local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

return {s(
    {trig="snipconv"},
    fmt([[
        local ls = require("luasnip")
        local s = ls.snippet
        local sn = ls.snippet_node
        local t = ls.text_node
        local i = ls.insert_node
        local f = ls.function_node
        local d = ls.dynamic_node
        local fmt = require("luasnip.extras.fmt").fmta
        local rep = require("luasnip.extras").rep

        local snippets = {}

    ]], {})
),
    s(
    {trig="snins"},
    fmt([[
    table.insert(snippets, s(
        {trig = <>, <>},
        fmt(<>, {<>})
    ))

    ]], {i(1), c(2, {t(""), t("snippetType=\"autosnippet\"")}), i(3), i(4)}))
}
