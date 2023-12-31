local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

local snippets = {s(
    { trig="\\env" },
    fmt("\n" .. [[
        \begin{<>}
        <>
        \end{<>}
    ]], {i(1), i(2), rep(1)})
)}

local thms = {
    prop = "Proposition",
    thm = "Theorem",
    lem = "Lemma",
    rmk = "Remark",
    defi = "Definition",
    cor = "Corollary",
}

local envs = {
    pf = "proof",
    eq = "equation",
    eqs = "equation*",
    al = "align",
    als = "align*",
    ald = "aligned",
    alds = "aligned*",
}

for k, _ in pairs(thms) do
    envs[k] = k
end

local thmconv = [[
    \theoremstyle{plain}
    \newtheorem{thm}{Theorem}
    \newtheorem{prop}[thm]{Proposition}
    \newtheorem{lem}[thm]{Lemma}
    \newtheorem{cor}[thm]{Corollary}
    \theoremstyle{definition}
    \newtheorem{defi}[thm]{Definition}
    \theoremstyle{remark}
    \newtheorem{rmk}[thm]{Remark}
]]
table.insert(snippets, s(
    {trig="thmconv"},
    fmt(thmconv, {})
))

for k, v in pairs(envs) do
    table.insert(snippets, s(
        {trig="\\" .. k},
        fmt("\n" .. [[
            \begin{<>}
            <>
            \end{<>}
        ]], {t(v), i(1), t(v)})
    ))
end

return snippets

