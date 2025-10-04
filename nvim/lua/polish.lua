-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

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

