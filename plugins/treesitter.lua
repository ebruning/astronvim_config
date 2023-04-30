return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = { "lua", "org" },
    highlight = { enable = true, additional_vim_regex_highlighting = { "org" } },
  },
}
