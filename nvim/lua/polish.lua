-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Handle Makefile syntax highlighting differently because vscode theme is not good at it
vim.api.nvim_create_autocmd("FileType", {
  pattern = "make",
  callback = function()
    -- Load the habamax colorscheme
    vim.cmd("colorscheme default")

    -- Make everything transparent
    local groups = {
      "Normal", "NormalNC",
      "SignColumn", "EndOfBuffer", "LineNr",
      "StatusLine", "StatusLineNC",
      "TabLine", "TabLineSel", "TabLineFill",
      "WinBar", "WinBarNC",
    }

    for _, g in ipairs(groups) do
      vim.cmd("hi! " .. g .. " guibg=NONE ctermbg=NONE")
    end
  end,
})

-- Set tab size
vim.opt.tabstop = 8        -- number of visual spaces per TAB
vim.opt.shiftwidth = 8     -- number of spaces for each indent level
vim.opt.softtabstop = 8    -- number of spaces when you press <Tab> in insert mode
