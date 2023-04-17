return {
  {
    "Bekaboo/deadcolumn.nvim",
    enabled = false,
    lazy = false,
  },
  {
    "lukas-reineke/virt-column.nvim",
    lazy = false,
    config = function() require("virt-column").setup() end,
  },
  { "ellisonleao/gruvbox.nvim", enabled = false },
  { "luisiacc/gruvbox-baby" },
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
}
