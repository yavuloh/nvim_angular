local opt = vim.opt
local g = vim.g

opt.relativenumber  = true
opt.wildignore:append { "**/node_modules/*", "**/.git/*", "**/.vs/*" }
