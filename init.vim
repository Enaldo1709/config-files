:set number
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
" :set mouse=a
:set encoding=UTF-8


call plug#begin()

Plug 'luochen1990/rainbow'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'https://github.com/tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'https://github.com/tpope/vim-commentary' 
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/lifepillar/pgsql.vim'
Plug 'https://github.com/rafi/awesome-vim-colorschemes'
Plug 'https://github.com/ryanoasis/vim-devicons'
Plug 'tomasiser/vim-code-dark'
Plug 'Mofiqul/vscode.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'https://github.com/tpope/vim-commentary'
Plug 'voldikss/vim-floaterm'

call plug#end()

let g:vscode_style = "dark"

let g:vscode_transparency = 1
" Enable italic comment
let g:vscode_italic_comment = 1
" Disable nvim-tree background color
let g:vscode_disable_nvimtree_bg = v:true

:colorscheme vscode
"":colorscheme jellybeans
let g:airline_theme = 'codedark'

let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
"	\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
let g:rainbow_conf = {
	\	'guifgs': ['cyan', 'yellow', 'magenta', 'lightmagenta'],
	\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
	\	'operators': '_,_',
	\	'separately': {
	\		'nerdtree': 0,
	\	}
	\}

let g:floaterm_keymap_new = '<C-f>t'
let g:floaterm_keymap_toggle = '<C-t>'
let g:floaterm_width = 0.9
let g:floaterm_height = 0.9

nnoremap <C-b> :NERDTreeToggle<CR>
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <c-space> coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"

noremap <C-t> :botright new <Bar> :terminal <cr>i

inoremap /* /**<cr>*<cr>*/<up><space>
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
autocmd BufNew * :TSEnable highlight
autocmd BufNewFile * :TSEnable highlight
autocmd BufRead * :TSEnable highlight
autocmd BufReadPost * :TSEnable highlight

" nmap <C-b> <Cmd>CocCommand explorer --toggle --root-strategies workspace<CR>
"":TSEnable highlight 
"":TSEnable incremental_selection
"":TSEnable indent

