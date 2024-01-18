--@override treesitter nvchad configuration

local options = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "c",
    "markdown",
    "markdown_inline",
    "c_sharp",
    "csv",
    "git_config",
    "git_rebase",
    "gitcommit",
    "http",
    "jsdoc",
    "json",
    "luadoc",
    "rust",
    "scala",
    "scss",
    "sql",
    "xml",
    "yaml"
  },
  highlight = {
    enable = true,
    use_languagetree = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  }
}

return options
