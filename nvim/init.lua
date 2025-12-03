vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = " "


--
-- Plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    "junegunn/fzf",
    "ibhagwan/fzf-lua",
    "machakann/vim-highlightedyank",
    "pbrisbin/vim-mkdir",
    "justinmk/vim-sneak",
    "itchyny/lightline.vim",
    "neovim/nvim-lspconfig",
    "mason-org/mason-lspconfig.nvim",
    "mason-org/mason.nvim",
    "mbbill/undotree",
    "nvim-tree/nvim-web-devicons",
    "webhooked/kanso.nvim",
    {
      "nvim-tree/nvim-tree.lua",
      config = function()
        require("nvim-tree").setup({
          view = { width = 30 },
          renderer = {
            highlight_opened_files = "all",
            indent_markers = { enable = true },
          },
        })
      end,
    },
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function()
        require("nvim-treesitter.configs").setup({
          ensure_installed = {
            "c",
            "cpp",
            "cmake",
            "c_sharp",
            "python",
            "rust",
            "zig",
            "go",
            "lua",
          },
          highlight = {
            enable = true,
            use_languagetree = true,
            additional_vim_regex_highlighting = false,
          },
          indent = { enable = false },
        })
      end,
    },
    {
      "codethread/qmk.nvim",
      config = function()
        require('qmk').setup({
          name = 'LAYOUT',
          layout = {
            'x x x x x x _ x x x x x x',
            'x x x x x x _ x x x x x x',
            'x x x x x x _ x x x x x x',
            'x x x x x x _ x x x x x x',
            '_ _ _ x x x _ x x x _ _ _',
          },
        })
			end,
    },
  },
  defaults = {
    lazy = false,
    version = false,
  },
})


--
-- Options
vim.opt.cmdheight = 1
vim.opt.shortmess:append("c")
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.history = 200
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.laststatus = 2
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.scrolloff = 2
vim.opt.sidescrolloff = 2
vim.opt.wrap = false
vim.opt.cindent = true
vim.opt.lazyredraw = true
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.showmatch = true
vim.opt.showmode = false
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.list = true
vim.opt.undofile = true
vim.opt.undolevels = 1000
vim.opt.undoreload = 10000
vim.opt.modeline = true
vim.opt.mouse = "a"
vim.opt.visualbell = true
vim.opt.listchars = { tab = "  ", trail = "·", extends = ">", precedes = "<", nbsp = "~" }
vim.opt.updatetime = 300
vim.opt.wildignore = {
  "*/node_modules/*", "*/dist/*", "*/__pycache__/*", "*/venv/*", "*/target/*",
  "*.o", "*.obj", "*.ilk", "*/build/*", "*/build_native/*", "*/build-*/*", "*/vendor/*",
  "moc_*.cpp", "moc_*.h", "moc_*.hpp", "*/target/debug/*", "*/target/release/*",
  "*.pyc", "*/tmp/*", "*.so", "*.swp", "*.zip", "*.exe", ".git", ".hg", ".svn", "*/doc/*html",
}

vim.cmd("colorscheme kanso-zen")

vim.g.fzf_preview_window = {}

vim.g.zig_fmt_autosave = 0


--
-- Mappings
local map = vim.keymap.set

map("n", "Q", "<nop>")
map("n", "<space>", "<nop>")
map("n", "<leader>w", "<cmd>w<cr>")

map("n", "<F1>", [[:%s/\s\+$//e<CR>:nohl<CR>]])
map("n", "<F2>", ":NvimTreeToggle<CR>")
map("n", "<F3>", ":NvimTreeFindFile<CR>")
map("n", "<F4>", vim.cmd.UndotreeToggle)

map("n", "<ESC><ESC>", ":nohl<CR>", { noremap = true, silent = true })

-- Disable arrow keys
map("n", "<up>", "<nop>")
map("n", "<down>", "<nop>")
map("n", "<left>", "<nop>")
map("n", "<right>", "<nop>")

map("i", "<up>", "<nop>")
map("i", "<down>", "<nop>")
map("i", "<left>", "<nop>")
map("i", "<right>", "<nop>")

-- Move lines up and down
map("n", "<C-Down>", ":m .+1<CR>==", { noremap = true })
map("n", "<C-Up>", ":m .-2<CR>==", { noremap = true })

-- Keeps cursor centered
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Buffer navigation
map("n", "<F5>", ":bprev<CR>", { noremap = true, silent = true })
map("n", "<F6>", ":bnext<CR>", { noremap = true, silent = true })
map("n", "<F7>", ":bfirst<CR>", { noremap = true, silent = true })
map("n", "<F8>", ":blast<CR>", { noremap = true, silent = true })

-- Split management
map("n", "<leader>s", "<C-w>s", { noremap = true })
map("n", "<leader>v", "<C-w>v", { noremap = true })

-- Split navigation
map("n", "<C-h>", "<C-w>h", { noremap = true })
map("n", "<C-j>", "<C-w>j", { noremap = true })
map("n", "<C-k>", "<C-w>k", { noremap = true })
map("n", "<C-l>", "<C-w>l", { noremap = true })

-- Clipboard
map("v", "<leader>y", '"+y', { silent = false })
map("v", "<leader>p", '"+p', { silent = true })
map("n", "<leader>p", '"+p', { silent = true })

-- Special paste and delete
map("x", "<leader>p", [["_dP]], { noremap = true })
map("n", "<leader>d", "\"_d", { noremap = true})

-- Move by display lines
map("n", "k", "gk", { noremap = true })
map("n", "j", "gj", { noremap = true })
map("n", "gk", "k", { noremap = true })
map("n", "gj", "j", { noremap = true })

-- Tabs
map("n", "<S-t>", ":tabnew<CR>", { noremap = true })
map("n", "<S-c>", ":tabc<CR>", { noremap = true })
map("n", "<S-l>", "gt", { noremap = true })
map("n", "<S-h>", "gT", { noremap = true })

-- fzf
local fzf = require("fzf-lua")
map("n", "<leader>ff", fzf.files, { noremap = true, desc = "Find Files" })
map("n", "<leader>fg", fzf.git_files, { noremap = true, desc = "Git Files" })
map("n", "<leader>fl", fzf.live_grep, { noremap = true, desc = "Live Grep" })
map("n", "<leader>fb", fzf.buffers, { noremap = true, desc = "Buffers" })
map("n", "<leader>fc", fzf.git_status, { noremap = true, desc = "Git Changes" })
map("n", "<leader>fr", fzf.grep_cword, { noremap = true, desc = "Grep String" })
map("n", "<leader>fh", fzf.oldfiles, { noremap = true, desc = "Previously Open Files" })


--
-- LSP configuration
local on_attach = function(client, bufnr)
  local keymaps_opts = { noremap = true, silent = true, buffer = bufnr }
  -- Configure keymaps for LSP actions
  vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", keymap_opts)
  vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", keymap_opts)
  vim.keymap.set("n", "gTD", "<cmd>lua vim.lsp.buf.type_definition()<CR>", keymap_opts)
  vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", keymap_opts)

  if client.server_capabilities.documentFormattingProvider then
    vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, keymaps_opts)
  end
end

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "clangd",
    "rust_analyzer",
    "zls",
    "ruff",
    "lua_ls",
  }
})


--TODO: migrate these to vim.lps.config(...)
--
--local lspconfig = require("lspconfig")
--
--lspconfig.clangd.setup({
--  on_attach = on_attach,
--})
--
--lspconfig.rust_analyzer.setup({
--  on_attach = on_attach,
--})
--
--lspconfig.zls.setup({
--  on_attach = on_attach,
--})
--
--lspconfig.ruff.setup({
--
--  on_attach = on_attach,
--})
--
--lspconfig.lua_ls.setup({
--  on_attach = on_attach,
--})
