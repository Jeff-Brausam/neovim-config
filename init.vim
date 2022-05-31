set tabstop=4 
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set exrc
set guicursor=
set relativenumber
set nu
set nohlsearch
set hidden
set noerrorbells
set incsearch
set scrolloff=8
set signcolumn=yes
set colorcolumn=80
set guifont=DroidSansMono\ Nerd\ Font:h16

call plug#begin('~/.vim/plugged')
Plug 'nvim-treesitter/nvim-treesitter', {'do': 'TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'gruvbox-community/gruvbox'
Plug 'neovim/nvim-lspconfig'
Plug 'tpope/vim-fugitive'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
call plug#end()

colorscheme gruvbox
highlight Normal guibg=none

let mapleader = " "
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>

:lua require'nvim-tree'.setup()
:lua require'nvim-web-devicons'.get_icons()

lua << EOF
local function config(_config)
    return vim.tbl_deep_extend("force", {
        on_attach = function()
        Nnoremap("gd",":lua vim.lsp.buf.definition()<CR>")
        Nnoremap("K", ":lua vim.lsp.buf.hover()<CR>")
        Nnoremap("<leader>vws", ":lua vim.lsp.buf.workspace_symbol()<CR>")
        Nnoremap("<leader>vd", ":lua vim.lsp.buf.open_float()<CR>")
        Nnoremap("[d", ":lua vim.lsp.diagnostic.goto_next()<CR>")
        Nnoremap("]d", ":lua vim.lsp.diagnostic.goto_prev()<CR>")
        Nnoremap("<leader>vca", ":lua vim.lsp.code_action()<CR>")
        Nnoremap("<leader>vrr", ":lua vim.lsp.refercences()<CR>")
        Nnoremap("<leader>vrn", ":lua vim.lsp.rename()<CR>")
        Inoremap("<C-h>", ":lua vim.lsp.signature_help()<CR>")
        end,
        }, _config or {})
end

require'lspconfig'.eslint.setup(config())
require'lspconfig'.graphql.setup(config())
require'lspconfig'.html.setup(config())
require'lspconfig'.java_language_server.setup(config())
require'lspconfig'.jsonls.setup(config())
EOF

nnoremap <leader>f :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>




