-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Search Configuration
vim.opt.ignorecase = false   -- Make search case-sensitive
vim.opt.smartcase = false    -- Don't let nvim decide case sensitivity
vim.opt.hlsearch = true      -- Highlight search matches
vim.opt.incsearch = true     -- Show search matches as you type
vim.opt.wrapscan = true      -- Wrap around the search

-- Load github dark theme
vim.cmd('colorscheme github_dark')
-- Override the background color
vim.cmd("highlight Normal guibg=#0d1117")

-- Set colortheme
-- vim.cmd("colorscheme tokyonight-night")
--
-- Use standard space per tab for display
vim.opt.expandtab = false  -- Use tabs instead of spaces
vim.opt.tabstop = 8        -- Number of spaces per tab (for display)
vim.opt.shiftwidth = 8     -- Number of spaces for autoindent

-- Speed up ESC key press
vim.opt.timeoutlen = 500
vim.opt.ttimeoutlen = 50
