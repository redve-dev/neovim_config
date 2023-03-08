vim.g.indent_blankline_char='┊'

--highlight
local function hi(group, opts)
	local c = "highlight " .. group
	for k, v in pairs(opts) do
		c = c .. " " .. k .. "=" .. v
	end
	vim.cmd(c)
end
hi("CursorLine",{gui="NONE", cterm="NONE", ctermbg=238})
hi("CursorLineNr",{gui="NONE", cterm="NONE", ctermbg=238, ctermfg=5})
hi("Conceal", {ctermfg=5})
hi("IndentBlanklineChar",{ctermfg=245})
hi("Pmenu",{ctermbg=23, ctermfg=247})
vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#ff0000]]
hi("Comment", {guifg="#FFB60A"})
hi("@comment", {guifg="#FFB60A"})

vim.g["blinds_guibg"] = "#252525"

local set = vim.opt
set.swapfile=false
set.number=true
set.relativenumber=true
set.showmatch=true
set.ignorecase=true
set.wildmenu=true
set.hlsearch=true
set.incsearch=true
set.tabstop=4
set.softtabstop=4
set.shiftwidth=4
set.clipboard="unnamedplus"
set.cursorline=true
set.encoding="UTF-8"
set.splitright=true
set.splitbelow=true
set.scrolloff=5
set.guicursor="i:block"
set.expandtab=false
set.wrap=false
set.ruler=true
set.autoindent=true
set.smartindent=true
set.showmode=false
set.inccommand="nosplit"
set.termguicolors=true
set.cmdheight=5
set.smartcase=true
set.undofile=true
set.undodir="/home/redve/.config/nvim_undofiles/"
set.mouse = ""
set.laststatus = 3
set.signcolumn="yes"

vim.g.mapleader = " "

local ag = vim.api.nvim_create_augroup
local au = vim.api.nvim_create_autocmd

---Highlight yanked text
au('TextYankPost', {
  group = ag('yank_highlight', {}),
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup='IncSearch', timeout=1000 }
  end,
})

set.mouse=""

vim.g.mkdp_auto_start = 0
vim.g.mkdp_auto_stop = 0
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-A>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

local ns = vim.api.nvim_create_namespace('toggle_hlsearch')

local function toggle_hlsearch(char)
  if vim.fn.mode() == 'n' then
    local keys = { '<CR>', 'n', 'N', '*', '#', '?', '/' }
    local new_hlsearch = vim.tbl_contains(keys, vim.fn.keytrans(char))

    if vim.opt.hlsearch:get() ~= new_hlsearch then
      vim.opt.hlsearch = new_hlsearch
    end
  end
end

vim.on_key(toggle_hlsearch, ns)
set.completeopt=menu,menuone,noselect
