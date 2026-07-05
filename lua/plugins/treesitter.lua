return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "c",
      "lua",
      "vim",
      "vimdoc",
      "query",
      "python",
      "rust",
      "cpp",
    },
    sync_install = false,
    auto_install = true,
    ignore_install = { "javascript" },

    indent = {
      enable = true,
      disable = { "python3" },
    },

    highlight = {
      enable = true,
      disable = function(lang, buf)
        local disabled_languages = { c = true, rust = true }
        if disabled_languages[lang] then
          return true
        end
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
      end,
      additional_vim_regex_highlighting = false,
    },
  },
}

