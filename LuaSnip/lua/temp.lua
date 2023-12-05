local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local c = ls.choice_node

return {
    s(
        {trig="kurs"},
        fmt([[
        {
            name = "<>",
            year = <>,
            textbook = "<>",
            lecturer = "<>",
            desc = "<>",
            grade = "<>",
            credit = <>,
            status = "<>",
        },
        ]], {
            i(1),
            c(2, {t("18"), t("19"), t("20"), t("21"), t("22"), t("23")}),
            i(3),
            i(4),
            i(5),
            i(6),
            i(7),
            c(8, {t("completed"), t("in progress"), t("planned")}),
        })
    )
}

