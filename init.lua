vim.cmd [[packadd packer.nvim]]
vim.opt.number = true
vim.opt.termguicolors=true
vim.opt.expandtab=true
vim.opt.tabstop=2
vim.opt.smartindent=false
vim.opt.shiftwidth=2
vim.opt.softtabstop=2
vim.opt.background='dark'
vim.opt.mouse = 'a'
vim.opt.completeopt='menuone,noselect'


local use = require('packer').use
vim.g.nvim_tree_quit_on_open = 1

require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'folke/lsp-colors.nvim'  
  use 'drewtempelmeyer/palenight.vim'
  use 'bluz71/vim-nightfly-guicolors'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use { 
    'lewis6991/gitsigns.nvim', 
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup()
    end
  }
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/vim-vsnip'
  use 'simrat39/rust-tools.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
  -- Lua
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
  use 'ellisonleao/glow.nvim'
  use 'sbdchd/neoformat'
  use 'b3nj5m1n/kommentary'
  use 'catppuccin/nvim'
  use 'ggandor/lightspeed.nvim'
  use 'herringtondarkholme/yats.vim'
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require'nvim-tree'.setup {} end
  }
  use 'lervag/vimtex'
  use 'neovimhaskell/haskell-vim'
  use 'andy-morris/happy.vim'
  use 'andy-morris/alex.vim'
  use 'neomake/neomake'
  use 'fatih/vim-go'
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use 'glepnir/zephyr-nvim'
  use 'rockerBOO/boo-colorscheme-nvim'
  use 'cocopon/iceberg.vim'
  use "rebelot/kanagawa.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "APZelos/blamer.nvim"
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'
end)

vim.g.mapleader =';'
vim.g.go_highlight_functions=1
vim.g.go_highlight_function_calls=1

require'lualine'.setup()

--[[ local colors = {

    bg = "#282c34",
    line_bg = "#353644",
    fg = '#8FBCBB',
    fg_green = '#65a380',

    yellow = '#fabd2f',
    cyan = '#008080',
    darkblue = '#081633',
    green = '#afd700',
    orange = '#FF8800',
    purple = '#5d4d7a',
    magenta = '#c678dd',
    blue = '#51afef';
    red = '#ec5f67'
}

require('galaxyline').section.left[1]= {
  FileSize = {
    provider = 'FileSize',
    condition = function()
      if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
        return true
      end
      return false
      end,
    icon = '   ',
    highlight = {colors.green,colors.purple},
    separator = '',
    separator_highlight = {colors.purple,colors.darkblue},
  }
}
 ]]
local catppuccin = require("catppuccin")

-- configure it
catppuccin.setup(
    {
		colorscheme = "soft_manilo",
		transparency = false,
		term_colors = true,
		styles = {
			comments = "italic",
			functions = "italic",
			keywords = "italic",
			strings = "NONE",
			variables = "NONE",
		},
		integrations = {
			treesitter = true,
			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = "italic",
					hints = "italic",
					warnings = "italic",
					information = "italic",
				},
				underlines = {
					errors = "underline",
					hints = "underline",
					warnings = "underline",
					information = "underline",
				}
			},
			lsp_trouble = true,
			lsp_saga = false,
			gitgutter = false,
			gitsigns = true,
			telescope = true,
			nvimtree = {
				enabled = false,
				show_root = false,
			},
			which_key = false,
			indent_blankline = {
				enabled = false,
				colored_indent_levels = false,
			},
			dashboard = false,
			neogit = true,
			vim_sneak = false,
			fern = false,
			barbar = false,
			bufferline = false,
			markdown = false,
			lightspeed = false,
			ts_rainbow = false,
			hop = false,
		}
	}
)

require('kanagawa').setup({
    undercurl = true,           -- enable undercurls
    commentStyle = "italic",
    functionStyle = "italic",
    keywordStyle = "italic",
    statementStyle = "bold",
    typeStyle = "NONE",
    variablebuiltinStyle = "italic",
    specialReturn = true,       -- special highlight for the return keyword
    specialException = true,    -- special highlight for exception handling keywords 
    transparent = false,        -- do not set background color
    dimInactive = false,        -- dim inactive window `:h hl-NormalNC`
    colors = {},
    overrides = {},
})

-- Lua
-- vim.cmd[[colorscheme catppuccin]]
-- vim.cmd[[colorscheme palenight]]
-- vim.cmd[[colorscheme zephyr]]
-- vim.cmd[[colorscheme boo]]
-- vim.cmd[[colorscheme iceberg]]
vim.cmd[[colorscheme kanagawa]]

local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()


require('nvim-treesitter.configs').setup {
	ensure_installed = { "go", "haskell", "cpp", "c", "rust", "javascript", "typescript" }
}

local nvimlsp = require('lspconfig')



require('rust-tools').setup({})

local nvim_lsp = require('lspconfig')


local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>sy', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

local cmp = require'cmp'

cmp.setup({
    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
      { name = 'orgmode' },

      -- For vsnip user.
      -- { name = 'vsnip' },

      -- For luasnip user.
      -- { name = 'luasnip' },

      -- For ultisnips user.
      -- { name = 'ultisnips' },

      { name = 'buffer' },
    }
})


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local servers = {'rust_analyzer', 'ocamllsp', 'ccls', 'tsserver', 'pyright', 'hls', 'texlab', 'gopls', 'terraformls'}

for _,lsp in ipairs(servers) do 
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end


require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- DevIcon will be appended to `name`
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    name = "Zsh"
  }
 };
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}

require('kommentary.config').use_extended_mappings()

-- VimTex 
vim.g.tex_flavor='latex'
vim.g.vimtex_view_method='zathura'
vim.g.vimtex_quickfix_mode=0
vim.api.nvim_command('set conceallevel=2')
vim.g.tex_conceal='abdmg'

--NvimTree
vim.api.nvim_command([[autocmd VimEnter * NvimTreeOpen]])

vim.api.nvim_set_keymap('', '<space>ff', ':NvimTreeToggle<cr>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('', '<space>gg', ':Neogit<cr>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('', '<space>tt', ':Telescope<cr>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('', '<space>tg', ':Telescope<space>grep_string<cr>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('', '<space>mk', ':Neomake!<cr>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('', '<space>dd', ':lua require("dapui").toggle()<cr>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('', '<space>rl', ':s/', { silent = true, noremap = true })
vim.api.nvim_set_keymap('', '<space>rg', ':%s/', { silent = true, noremap = true })

vim.api.nvim_set_keymap('', '<leader>br', ':lua require("dap").toggle_breakpoint()<cr>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('', '<leader>cn', ':lua require("dap").continue()<cr>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('', '<leader>so', ':lua require("dap").step_over()<cr>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('', '<leader>si', ':lua require("dap").step_into()<cr>', { silent = true, noremap = true })

vim.api.nvim_set_keymap("", "<space>xx", "<cmd>Trouble<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("", "<space>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("", "<space>xd", "<cmd>Trouble lsp_document_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("", "<space>xl", "<cmd>Trouble loclist<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("", "<space>xq", "<cmd>Trouble quickfix<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("", "gR", "<cmd>Trouble lsp_references<cr>",
  {silent = true, noremap = true}
)

vim.api.nvim_exec([[autocmd FileType haskell nnoremap <buffer> <space>fm :Neoformat! haskell ormolu<cr>]], false)
vim.api.nvim_exec([[autocmd FileType go nnoremap <buffer> <space>fm :Neoformat! go gofumpt<cr>]], false)
vim.api.nvim_exec([[autocmd FileType c nnoremap <buffer> <space>fm :Neoformat! c clang-format<cr>]], false)
vim.api.nvim_exec([[autocmd FileType rust nnoremap <buffer> <space>fm :Neoformat! rust rustfmt<cr>]], false)

vim.api.nvim_exec([[au BufRead,BufNewFile *.cwl setfiletype yaml]], false)
