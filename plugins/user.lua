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
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)      -- override the options using lazy.nvim
      opts.section.header.val = { -- change the header section value
        " ███████████           ███████████             █████████   ████  ██████   ██████         ",
        "░░███░░░░░███         ░█░░░███░░░█            ███░░░░░███ ░░███ ░░██████ ██████          ",
        " ░███    ░███  ██████ ░   ░███  ░   ██████   ░███    ░███  ░███  ░███░█████░███   ██████ ",
        " ░██████████  ███░░███    ░███     ░░░░░███  ░███████████  ░███  ░███░░███ ░███  ███░░███",
        " ░███░░░░░███░███████     ░███      ███████  ░███░░░░░███  ░███  ░███ ░░░  ░███ ░███████ ",
        " ░███    ░███░███░░░      ░███     ███░░███  ░███    ░███  ░███  ░███      ░███ ░███░░░  ",
        " ███████████ ░░██████     █████   ░░████████ █████   █████ █████ █████     █████░░██████ ",
        "░░░░░░░░░░░   ░░░░░░     ░░░░░     ░░░░░░░░ ░░░░░   ░░░░░ ░░░░░ ░░░░░     ░░░░░  ░░░░░░  ",
      }
    end,
  },
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      local status = require "astronvim.utils.status"
      opts.statusline = {
                                                                                     -- statusline
        hl = { fg = "fg", bg = "bg" },
        status.component.mode { mode_text = { padding = { left = 1, right = 1 } } }, -- add the mode text
        status.component.git_branch(),
        status.component.file_info { filetype = {}, filename = false, file_modified = false },
        status.component.git_diff(),
        status.component.diagnostics(),
        status.component.fill(),
        status.component.cmd_info(),
        status.component.fill(),
        status.component.lsp(),
        status.component.treesitter(),
        status.component.nav(),
        -- remove the 2nd mode indicator on the right
      }

      opts.winbar = {
        -- create custom winbar
        -- store the current buffer number
        init = function(self) self.bufnr = vim.api.nvim_get_current_buf() end,
        fallthrough = false, -- pick the correct winbar based on condition
        -- inactive winbar
        {
          condition = function() return not status.condition.is_active() end,
          -- show the path to the file relative to the working directory
          status.component.separated_path { path_func = status.provider.filename { modify = ":.:h" } },
          -- add the file name and icon
          status.component.file_info {
            file_icon = { hl = status.hl.file_icon "winbar", padding = { left = 0 } },
            file_modified = false,
            file_read_only = false,
            hl = status.hl.get_attributes("winbarnc", true),
            surround = false,
            update = "BufEnter",
          },
        },
        -- active winbar
        {
          -- show the path to the file relative to the working directory
          status.component.separated_path { path_func = status.provider.filename { modify = ":.:h" } },
          -- add the file name and icon
          status.component.file_info { -- add file_info to breadcrumbs
            file_icon = { hl = status.hl.filetype_color, padding = { left = 0 } },
            file_modified = false,
            file_read_only = false,
            hl = status.hl.get_attributes("winbar", true),
            surround = false,
            update = "BufEnter",
          },
          -- show the breadcrumbs
          status.component.breadcrumbs {
            icon = { hl = true },
            hl = status.hl.get_attributes("winbar", true),
            prefix = true,
            padding = { left = 0 },
          },
        },
      }

      return opts
    end,
  },
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
