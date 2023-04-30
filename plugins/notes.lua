return {
  -- commenting out TOC plugin
  -- { "mzlogin/vim-markdown-toc", ft = { "markdown" } },
  { "AckslD/nvim-FeMaco.lua", ft = { "markdown" }, opts = {} },
  {
    "folke/twilight.nvim",
    opts = {},
    cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
  },
  { "folke/zen-mode.nvim", opts = {}, cmd = { "ZenMode" } },
  { "dhruvasagar/vim-table-mode", ft = { "markdown", "org", "norg" } },
  { "lukas-reineke/headlines.nvim", opts = {}, ft = { "markdown", "org", "norg" } },
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    lazy = true,
    build = "cd app && npm install && git reset --hard",
  },
}
