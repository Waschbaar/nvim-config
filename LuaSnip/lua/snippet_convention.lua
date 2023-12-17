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

    ]], {i(1), c(2, {t(""), t("snippetType=\"autosnippet\"")}), i(3), i(4)})),
    s(
    { trig = "envd" },
    fmt([[
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
    ]], {})
    )
}
