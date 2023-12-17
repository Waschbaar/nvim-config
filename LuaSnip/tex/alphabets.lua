local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

local greek = {
    a = "alpha",
    b = "beta",
    g = "gamma",
    G = "Gamma",
    d = "delta",
    D = "Delta",
    e = "epsilon",
    ve = "varepsilon",
    z = "zeta",
    h = "eta",
    th = "theta",
    vth = "vartheta",
    Th = "Theta",
    i = "iota",
    k = "kappa",
    l = "lambda",
    L = "Lambda",
    m = "mu",
    n = "nu",
    x = "xi",
    X = "Xi",
    p = "pi",
    P = "Pi",
    r = "rho",
    vr = "varrho",
    s = "sigma",
    S = "Sigma",
    ta = "tau",
    u = "upsilon",
    U = "Upsilon",
    f = "phi",
    F = "Phi",
    vf = "varphi",
    ch = "chi",
    Z = "psi",
    I = "Psi",
    oo = "omega",
    Oo = "Omega",
}

local mathfonts = {
    rm = "mathrm",
    sc = "mathscr",
    bb = "mathbb",
    fr = "mathfrak",
    ca = "mathcal",
    it = "mathit",
    bf = "mathbf",
    sf = "mathsf",
    tt = "mathtt",
}

local textfonts = {
    bf = "textbf",
    ul = "underline",
    it = "textit",
}

local snippets = {}

for k, v in pairs(greek) do
    table.insert(snippets, s(
        {trig = ";" .. k, snippetType="autosnippet"},
        fmt("\\" .. v, {})
    ))
end

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


local in_math = env_detect.in_math

local in_text = env_detect.in_text

for k, v in pairs(mathfonts) do
    table.insert(snippets, s(
        {trig = "\\" .. k},
        fmt("\\" .. v .. "{<>}", {i(1)}),
        {condition = in_math}
    ))
end

for k, v in pairs(textfonts) do
    table.insert(snippets, s(
        {trig = "\\" .. k},
        fmt("\\" .. v .. "{<>}", {i(1)}),
        {condition = in_text}
    ))
end

return snippets
