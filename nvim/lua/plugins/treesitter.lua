-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "bash",
      "c",
      "cmake",
      "cpp",
      "diff",
      "dot",
      "fortran",
      "git_config",
      "git_rebase",
      "gitattributes",
      "gitcommit",
      "gitignore",
      "go",
      "goctl",
      "gomod",
      "gosum",
      "html",
      "ini",
      "json",
      "llvm",
      "lua",
      "make",
      "markdown",
      "passwd",
      "perl",
      "php",
      "python",
      "rust",
      "strace",
      "vim",
      "yaml",
      -- add more arguments for adding more treesitter parsers
    },
  },
}
