return {
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("vscode").setup({
        style = "dark",

        -- Enable transparent background
        transparent = true,
        -- Enable italic comment
        italic_comments = true,
        -- Enable italic inlay type hints
        italic_inlayhints = true,
        -- Underline `@markup.link.*` variants
        underline_links = true,
        -- Disable nvim-tree background color
        disable_nvimtree_bg = true,
        -- Apply theme colors to terminal
        terminal_colors = false,

      })

      require("vscode").load()

      -- Override highlight groups for transparency in UI bars
      vim.cmd([[
        hi! StatusLine guibg=NONE ctermbg=NONE
        hi! StatusLineNC guibg=NONE ctermbg=NONE
        hi! TabLine guibg=NONE ctermbg=NONE
        hi! TabLineFill guibg=NONE ctermbg=NONE
        hi! WinBar guibg=NONE ctermbg=NONE
        hi! WinBarNC guibg=NONE ctermbg=NONE
      ]])

    end,
  },
}
