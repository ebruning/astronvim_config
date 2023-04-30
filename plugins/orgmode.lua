return {
  {
    "nvim-orgmode/orgmode",
    ft = { "org" },
    opts = {
      org_agenda_files = "~/Dropbox/org/agenda/*",
      org_default_notes_file = "~/Dropbox/org/default_note.org",
    },
    config = function(plugin, opts)
      require("orgmode").setup_ts_grammar()
      require("orgmode").setup(opts)
    end,
  },
  { "akinsho/org-bullets.nvim", opts = {}, ft = { "org" } },
}
