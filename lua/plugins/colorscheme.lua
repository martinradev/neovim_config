return
  {
    "NLKNguyen/papercolor-theme",
    lazy = false, -- load immediately
    priority = 1000, -- ensure it loads before other plugins
    config = function()
      vim.cmd.colorscheme("PaperColor")
    end,
  }
