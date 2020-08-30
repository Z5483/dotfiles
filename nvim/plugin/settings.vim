if exists('g:loaded_settings') || &compatible
	finish
endif
let g:loaded_settings = 1

if has('autocmd')
	filetype plugin indent on
endif

if has('syntax') && !exists('g:syntax_on')
	syntax on
endif

set autoread

if &history < 10000
	set history=10000
endif

if &tabpagemax < 50
	set tabpagemax=50
endif

set updatetime=100

set ttimeout
set ttimeoutlen=100

set autoindent
set backspace=indent,start,eol
set smarttab

set tabstop=8
set softtabstop=8
set shiftwidth=8
set shiftround
set noexpandtab

if !&scrolloff
	set scrolloff=1
endif

if !&sidescrolloff
	set sidescrolloff=5
endif

set number
set relativenumber

set incsearch

if $TERM == 'linux'
	set guicursor=
endif

if exists('&inccommand')
	set inccommand=split
endif

if has('showcmd')
	set noshowcmd
endif

if has('statusline')
	set statusline=%<%F\ %y%m%r%=%-14.(L:\ %l/%L\ C:\ %c%V%)\ |
	set laststatus=2
	set ruler
endif

set list
set listchars+=extends:»
set listchars+=nbsp:ø
set listchars+=precedes:«
set listchars+=tab:▷┅
set listchars+=trail:•

if has('folding')
	set fillchars=diff:∙
	set fillchars+=eob:\ |
	set fillchars+=fold:·
	set fillchars+=vert:┃

	set foldmethod=indent
	set foldlevelstart=99
endif

set completeopt=menuone
set completeopt+=noinsert
set completeopt+=noselect

set shortmess=I
set shortmess+=c

set splitbelow
set splitright

if has('termguicolors')
	set termguicolors
endif

if exists('&wildmode')
	set wildmenu
	set wildcharm=<C-z>
endif
