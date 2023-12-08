local env_detect = {}

env_detect.inside_env = function(name)
    local lines = vim.fn["vimtex#env#is_inside"](name)
    return (lines[1] > 0 and lines[2] > 0)
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

return env_detect
