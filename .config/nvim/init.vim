

" ----------------
"   dein settings
" ----------------
let s:dein_dir = expand('~/.cache/dein')

let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
	if !isdirectory(s:dein_repo_dir)
		execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
	endif
	execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
	call dein#begin(s:dein_dir)

	let s:toml_dir = expand('~/.config/nvim')

	call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})
	call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy': 1})

	call dein#end()
	call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
	call dein#install()
endif

" ----------------
"   vim settings
" ----------------

" vi互換でなくvimデフォルト設定にする
if &compatible
	set nocompatible
endif

" CoffeeScript 設定
au BufRead,BufNewFile,BufReadPre *.coffee set filetype=coffee
autocmd FileType coffee setlocal sw=2 sts=2 ts=2 et

" basic
syntax enable		" シンタックスハイライト
set number			" 行番号
set cursorline		" 行カーソル
set cursorcolumn	" 列カーソル
set ruler			" ルーラー
set cmdheight=2		" コマンドライン行数
set wildmenu		" ナビゲーションバー
set wildmode=list:full
set wildignore=*.o,*.obj,*.pyc,*.so
set tw=0			" 自動改行オフ
set whichwrap=b,s,h,l,<,>,[,]	" カーソルを止まらないように
set switchbuf=useopen			" 新しく開かず既にあるバッファを使う
set nostartofline	" 移動コマンド使用時に行頭に移動しない
set matchpairs& matchpairs+=<:>	" <>をペアに
set wrap			" 長い行を折りたたむ
set colorcolumn=80	" 80文字目にラインを入れる
set textwidth=0		" テキスト最大幅を無効
set history=10000	" 履歴を10000までもつ
set mouse=a			" マウス有効
colorscheme badwolf	" カラースキーム
set termguicolors	" true color

" status line
set statusline=%F	" ファイル名
set statusline+=%m	" 変更チェック
set statusline+=%r	" 読み込み専用かどうか
set statusline+=%h	" ヘルプページで[HELP]
set statusline+=%w	" プレビューで[Preview]
set statusline+=%=	" これ以降は右寄せ
set statusline+=[ENC=%{&fileencoding}]	" ファイルエンコード
set statusline+=[LOW=%l/%L]				" 現在行数/全体行数
set laststatus=2	" ステータスラインを常時表示

" edit
set showmatch		" 閉じカッコ入力時強調表示
set matchtime=3		" 強調表示時間
set backspace=indent,eol,start	" BSで各種消せるように
set modeline		" モードラインを有効
set modelines=5		" モードラインの行数

" tab
set tabstop=4		" タブは4スペース
set shiftwidth=4	" 自動インデントのスペース
set autoindent		" 自動インデント
set smartindent		" スマートインデント
set smarttab

" search
set ignorecase		" 大文字小文字を区別しない
set smartcase		" 大文字を含めた検索はその通りに検索する
set incsearch		" インクリメンタルサーチ
" set wrapscan		" 循環検索
set infercase		" 補完の際に大文字小文字を区別しない
set hlsearch		" 検索結果をハイライトする

" バクスラやハテナを自動エスケープ
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\/' : '?'

" カッコのペアを続けて入力時に1文字戻る
inoremap {} {}<Left>
inoremap [] []<Left>
inoremap () ()<Left>
inoremap "" ""<Left>
inoremap '' ''<Left>

" sudo で保存
cmap w!! w !sudo tee % > /dev/null

" NERDTreeToggle
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" カラースキーム関係
augroup TransparentBG
	autocmd!
	autocmd Colorscheme * highlight Normal ctermbg=none
	autocmd Colorscheme * highlight NonText ctermbg=none
	autocmd Colorscheme * highlight LineNr ctermbg=none
	autocmd Colorscheme * highlight Folded ctermbg=none
	autocmd Colorscheme * highlight EndOfBuffer ctermbg=none
augroup END
