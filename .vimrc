"
" Tips
"
"{{{
"
" How-to-Use
"
" git clone --recursive git@github.com:hiroyam/.dotfiles.git
" sh setup.sh
"
""" 古いやり方
""" git clone https://github.com/hiroyam/.dotfiles
""" cd .dotfiles
""" git submodule init
""" git submodule update
""" sh setup.sh
"
" cd .vim/bundle/vimproc
" make -f .vim/bundle/vimproc/make_???.mak
"
" モジュールの追加
" git submodule add git@github.com:gmarik/vundle.git .vim/vundle
"
" モジュールの削除 (after git 1.8.5.2)
" git rm spdlog
" rm -rf .git/modules/spdlog
"
" モジュールの削除 (after git 1.8.5.2)
" git submodule deinit spdlog
" git rm -rf spdlog
" rm -rf .git/modules/spdlog
"
" オプションリスト
" http://vimwiki.net/?OptionList
"
" ftpluginを書く際の注意
" http://whileimautomaton.net/2008/09/07213145
"
" オプションが最後にどこで設定されたか表示する
" :verbose set tabstop?
"
" vimからFinderを開く
" :!open .
"
" sudoでファイル保存
" :w !sudo tee >/dev/null %
"
" :setなどのアウトプットに対して検索をかける
" :Unite output:set
"
" grep置換
" http://archiva.jp/web/tool/vim_grep2.html
" vimfilerでgr検索する
" a -> replace
" バッファ全体に対して置換をかけて保存
"
" <Plug> がある場合は nnoremap ではなく nmap を使う必要がある
"
" :highlight でカラーチェック
" :help highlight-group
" http://d.hatena.ne.jp/kakurasan/20080703
"
" 縦分割 横分割 切り替え
" [C-w HJKL]
"
" diff
" vimdiff filename1 filename2
" :vert diffs filename2
"
" カーソル下の単語でヘルプを引く
" :h <C-r><C-w><CR>
"
" タグジャンプ関連
" <C-]> 定義に飛ぶ
" <C-o> 飛ぶ前のバッファに戻る
" <C-i> <C-o>の逆
"
" コマンドを評価する
" :<C-r>=
" と打ったあと
" system("ctags --version")
" などと入力する
"
" 直前に選択していた範囲を、再度選択する
" gv
"
" bash prompt here
" chere -ia -t mintty -s bash
"
" Sublime Text
" 有料なので使わない
"
" w3m -cols 256 -dump http://futaba-only.net/list01.html | grep may | wc -l 18
"
" 画像リサイズ
" mogrify -resize 800x *
"}}}


"
" Vundle
"
"{{{

set nocompatible
filetype off

set rtp&
set rtp+=~/.vim/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tomasr/molokai'
Bundle 'vim-jp/vimdoc-ja'
Bundle 'banyan/recognize_charcode.vim'
Bundle 'vim-scripts/mru.vim'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimfiler.vim'
Bundle 'Shougo/vimproc.vim'
Bundle 'thinca/vim-qfreplace'
Bundle 'tomtom/tcomment_vim'
Bundle 'bling/vim-airline'
Bundle 'terryma/vim-expand-region'
Bundle 'godlygeek/tabular'
filetype plugin indent on

nnoremap <Space>b :BundleClean<CR>:BundleInstall<CR>

"}}}


"
" General
"
"{{{

autocmd!

syntax  on
set     autoindent                      " smartindentとcindentは設定しない
set     tabstop=4                       "
set     shiftwidth=4                    "
set     softtabstop=4                   "
set     smarttab                        "
set     expandtab                       " タブを空白にする
set     textwidth=0                     " 入力可能なテキストの最大幅
set     timeoutlen=500                  " <Nop>キーの待機時間
set     history=1000                    " コマンド・検索パターンの履歴数
set     scrolloff=8                     " スクロールオフセット
set     clipboard&                      " デフォルトにする（リロード対策）
set     clipboard+=autoselect           " クリップボードを使う
set     clipboard+=unnamed              " クリップボードを使う
set     clipboard+=unnamedplus          " クリップボードを使う
set     foldmethod=marker               " 折りたたみ形式
set     hlsearch                        " 検索結果をハイライトする
set     incsearch                       " インクリメンタルサーチを使う
set     nowrapscan                      " 検索をラップしない
set     backspace=eol,indent,start      " バックスペースで消去できるようにする
set     showmatch                       " 対応するカッコをハイライト
set     nobackup                        " バックアップファイルを作成しない
set     noswapfile                      " スワップファイルを作成しない
set     autoread                        " 外部で変更された際に自動で再読み込み
set     number                          " 行番号表示
set     ignorecase                      " 大文字小文字
set     vb t_vb=                        " ビジュアルベル
set     hidden                          " 編集中でもファイルを開けるようにする
set     lazyredraw                      " コマンド実行中は再描画しない
set     ttyfast                         " 高速ターミナル接続を行う
set     virtualedit& virtualedit+=block " 矩形選択で自由に移動する
set     completeopt=menuone             " 補完オプション
set     wildmenu                        " コマンド補完を強化
set     wildchar=<tab>                  " コマンド補完を開始するキー
set     wildmode=list:full              " リスト表示，最長マッチ
set     laststatus=2                    " ステータスライン
" set     wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.Trash/*          " Linux/MacOSX
" set     wildignore+=*\\.git\\*,*\\.hg\\*,*\\.svn\\*,*\\.Trash\\*  " Windows ('noshellslash')
" set     statusline=\ #{buftabs}%=\ %{(&fenc!=''?&fenc:&enc)}\ %{&ff}\ %Y\ "
" set     statusline=\ #{buftabs}%=\ %t\ %{(&fenc!=''?&fenc:&enc)}\ %{&ff}\ %Y\ "
" set     showtabline=2
" set     guioptions-=e
" set     tags+=tags;                     " タグファイル
set     t_Co=256                        " CentOS GNOME端末で256色を表示するのに必要だった
" set     mouse=a                         " マウスホイール有効


" GVim
" set     guioptions-=T                   " ツールバー非表示
" set     guifont=Ricty\ Regular:h14      " フォント

" 行末のスペースを削除
" http://vi.stackexchange.com/questions/3539/highlight-double-space-in-markdown
autocmd BufWritePre * call RTrim()
function! RTrim()
  let s:cursor = getpos(".")
  if &filetype == "markdown"
    %s/\s\+\(\s\{2}\)$/\1/e
    match underlined /\s\{2}/
  else
    %s/\s\+$//e
  endif
  call setpos(".", s:cursor)
endfunction

" タブを明示
autocmd InsertLeave * match underlined /\t/

" 前回終了したカーソル行に移動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" 自動コメントをオフ
autocmd FileType * set formatoptions-=ro

" インサートモードを抜ける時に:set nopaste
autocmd InsertLeave * set nopaste

" Indent
autocmd FileType css        setlocal sw=2 sts=2 ts=2
autocmd FileType less       setlocal sw=2 sts=2 ts=2
autocmd FileType html       setlocal sw=2 sts=2 ts=2
autocmd FileType javascript setlocal sw=2 sts=2 ts=2
autocmd FileType ruby       setlocal sw=2 sts=2 ts=2
autocmd FileType eruby      setlocal sw=2 sts=2 ts=2
autocmd FileType haml       setlocal sw=2 sts=2 ts=2
autocmd FileType vim        setlocal sw=2 sts=2 ts=2
autocmd FileType yaml       setlocal sw=2 sts=2 ts=2
autocmd FileType scala      setlocal sw=2 sts=2 ts=2
autocmd FileType cpp        setlocal sw=4 sts=4 ts=4

" Detect
" autocmd BufRead,BufNewFile *.R setlocal filetype=r

" Syntax
colorscheme molokai
highlight Pmenu          ctermbg=gray ctermfg=black guibg=gray guifg=black " メニュー項目
highlight PmenuSel       ctermbg=cyan ctermfg=black guibg=cyan guifg=black " メニュー選択
highlight MatchParen     ctermbg=240
highlight Visual         ctermbg=237
highlight Search         guifg=#FFFFFF guibg=#95A3A4
highlight StatusLine     ctermfg=60  ctermbg=232 guifg=#5F5F87 guibg=#080808
highlight StatusLineNC   ctermfg=238 ctermbg=253 guifg=#455354 guibg=fg

" Binary
autocmd BufReadPre   *.bin let &binary =1
autocmd BufReadPost  * if &binary && &modifiable | silent %!xxd -g 1
autocmd BufReadPost  * set ft=xxd | endif
autocmd BufWritePre  * if &binary | %!xxd -r | endif
autocmd BufWritePost * if &binary | silent %!xxd -g 1
autocmd BufWritePost * set nomod | endif

" autocmd cpp
autocmd FileType cpp call s:cpp_settings()
function! s:cpp_settings()
  set cinoptions+=(0
endfunction

" transparent
if !has('gui_running')
    augroup transparent
        autocmd!
        autocmd VimEnter,ColorScheme * highlight Normal ctermbg=none
        autocmd VimEnter,ColorScheme * highlight LineNr ctermbg=none
        autocmd VimEnter,ColorScheme * highlight SignColumn ctermbg=none
        autocmd VimEnter,ColorScheme * highlight VertSplit ctermbg=none
        autocmd VimEnter,ColorScheme * highlight NonText ctermbg=none
    augroup END
endif


"}}}


"
" Mapping
"
" {{{
" nnoremap      x          "_x
" vnoremap      x          "_x
" nnoremap            <Space>,   :e      $MYVIMRC<CR>
" nnoremap            <Space>5   :source $MYVIMRC<CR>
nnoremap            H            ^
vnoremap            H            ^
nnoremap            L            $
vnoremap            L            $
nnoremap            n            nzz
nnoremap            N            Nzz
nnoremap <silent>   p            :set paste!<CR>p:set nopaste<CR>
nnoremap            <C-k><C-i>   :set paste!<CR>
nnoremap            <C-k><C-m>   :w<CR>:!make -j && make run<CR>
nnoremap            <C-k><C-p>   :bp<CR>
nnoremap            <C-k><C-n>   :bn<CR>
nnoremap            <C-k><C-k>   @s
nnoremap            s            q
nnoremap            <Space><Tab> :vs<CR>
nnoremap            ;            :
nnoremap            ,            <C-w><C-w>
nnoremap            -            20<C-w>+
nnoremap            <Space>q     :qa!<CR>
nnoremap            <Space>,     :e      ~/.dotfiles/.vimrc<CR>
nnoremap            <Space>5     :source ~/.dotfiles/.vimrc<CR>
inoremap            <C-b>        <Left>
inoremap            <C-f>        <Right>
" inoremap            <C-e>        <End>
" inoremap            <C-a>        <Home>
inoremap            <C-h>        <Backspace>
inoremap            <C-d>        <Del>

" splitを閉じずにバッファを閉じる
" http://stackoverflow.com/questions/4298910/vim-close-buffer-but-not-split-window
nnoremap            <C-k><C-d> :b#<bar>bd!#<CR>
" nnoremap            <C-k><C-d> :b#<bar>bw!#<CR>
" nnoremap            <C-k><C-d> :bw!<CR>

" コマンドモードの<C-p><C-n>をzshのヒストリ補完にする
cnoremap            <C-p>      <Up>
cnoremap            <C-n>      <Down>
cnoremap            <Up>       <C-p>
cnoremap            <Down>     <C-n>

" tagsジャンプの時に複数ある時は一覧表示
" nnoremap            <C-]>      g<C-]>

" スラッシュの検索を楽にする
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'

" w!! でスーパーユーザーとして保存（sudoが使える環境限定）
cnoremap w!! w !sudo tee > /dev/null %

" タイムスタンプを入力
inoremap <C-t>      <C-R>=strftime("%Y-%m-%d %H:%M:%S +09:00")<CR>
" inoremap <C-t>      <C-R>=strftime("** %H:%M **")<CR>
" inoremap <C-t><C-t> <C-R>=strftime("###%Y/%m/%d")<CR><CR><CR>
nnoremap <Space>m   :e ~/.memo<CR>

" タグプレビューを開く
nnoremap <Space>p   <C-w>}

" バッファを閉じる
nnoremap <silent> q :call Wipeout()<CR>
function! Wipeout()
    :silent! wincmd P
    if &previewwindow
        :pc!
    else
        :bw!
    endif
endfunction

"}}}


"
" Plugins
"
"{{{
"
"****************************************
" vim-easytags
" let g:easytags_async = 1
" let g:easytags_dynamic_files = 1


"****************************************
" auto-ctags
" let g:auto_ctags = 1
" let g:auto_ctags_directory_list = ['.git', '.svn']


"****************************************
" " ctrlp
" let g:ctrlp_map          = '<Space>p'
" let g:ctrlp_match_window = 'bottom,order:btt,min:30,max:30,results:30'
" let g:ctrlp_show_hidden  = 1
" let g:ctrlp_lazy_update  = 1
" let g:ctrlp_max_files    = 1000
" let g:ctrlp_mruf_max     = 0
"
" let g:ctrlp_prompt_mappings = {
"       \ 'PrtSelectMove("j")':   ['<c-n>', '<down>'],
"       \ 'PrtSelectMove("k")':   ['<c-p>', '<up>'],
" 			\ 'PrtHistory(-1)':       ['<c-j>'],
" 			\ 'PrtHistory(1)':        ['<c-k>'],
"       \ }


"****************************************
" vim-airline
" :help airline
let g:airline_left_sep                        = ''
let g:airline_right_sep                       = ''
let g:airline#extensions#tabline#enabled      = 1
let g:airline#extensions#tabline#left_sep     = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#fnamecollapse = 0
" let g:airline_section_c                       = '%{getcwd()}'
" let g:airline_section_c                       = '%{getcwd()}/%t'
" let g:airline_theme                           = 'murmur'


"****************************************
" vim-expand-region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)


"****************************************
" vim-scrollbar
" let g:scrollbar_thumb='#'
" let g:scrollbar_clear='|'
" highlight Scrollbar_Thumb ctermfg=green ctermbg=green guifg=green guibg=black cterm=reverse
" highlight Scrollbar_Clear ctermfg=black ctermbg=black guifg=black guibg=black cterm=none


"****************************************
" tcomment
"let g:tcommentOptions = {'col': 1}
let g:tcomment#options = {'col': 1}
nnoremap    <Space>/         :TComment<CR>
vnoremap    <Space>/         :TComment<CR>gvy
nnoremap    <Space>/         :TComment<CR>
vnoremap    <Space>/         :TComment<CR>gvy

"****************************************
" tabular
vnoremap    <Space>t         :Tab/


"****************************************
" taglist
" nnoremap <silent> <Space>r  :<C-u>Tlist<CR>
" let Tlist_Show_One_File      = 1
" let Tlist_Exit_OnlyWindow    = 1
" let Tlist_Enable_Fold_Column = 1
" let Tlist_Auto_Open          = 0
" let Tlist_Auto_Update        = 1
" let Tlist_WinWidth           = 70
" function! s:wipeout_tlist_buffer()
"   if bufexists('__Tag_List__')
"     :bw! __Tag_List__
"   endif
" endfunction


"****************************************
" yankring
" let g:yankring_history_file = '.yankring'
" let g:yankring_n_keys = 'Y D'


"****************************************
" vim-indent-guides
" Bundle 'nathanaelkane/vim-indent-guides'
" let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_guide_size            = 1
" let g:indent_guides_auto_colors           = 0
" autocmd VimEnter * :highlight IndentGuidesOdd  ctermbg=234 guibg=#292929
" autocmd VimEnter * :highlight IndentGuidesEven ctermbg=236 guibg=#414141


"****************************************
" buftabs
" let g:buftabs_only_basename = 1
" let g:buftabs_in_statusline = 1
" let g:buftabs_active_highlight_group = "buftabs"
" highlight buftabs ctermbg=33 guibg=#0088BB
"
" let g:buftabs_show_number       = 0
" let g:buftabs_marker_start      = ' '
" let g:buftabs_marker_end        = ' '
" let g:buftabs_separator         = ''
" let g:buftabs_marker_modified   = '*'


"****************************************
" mru.vim
nnoremap <silent> <C-k><C-l> :<C-u>MRU<CR>
let MRU_Max_Entries     = 10000
let MRU_Window_Height   = 30


"****************************************
" unite.vim
" nnoremap <silent> <Space>r   :<C-u>Unite -no-split file_rec<CR>
" nnoremap <silent> <Space>u   :<C-u>Unite -no-split file_mru<CR>

" " 大文字小文字を区別しない
" let g:unite_enable_ignore_case = 1
" let g:unite_enable_smart_case  = 1

" grep検索
nnoremap <silent> <Space>g :<C-u>Unite grep:. -buffer-name=search-buffer<CR>

" カーソル位置の単語をgrep検索
nnoremap <silent> <Space>f :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W><CR>

" grep検索結果の再呼出
nnoremap <silent> <Space>r :<C-u>UniteResume search-buffer<CR>


" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif


"****************************************
" vimfiler.vim
nnoremap <silent> <Space>.   :<C-u>VimFilerBufferDir -force-quit<CR>

" if executable('grep')
  " let g:unite_source_grep_command       = 'grep'
  " let g:unite_source_grep_default_opts  = '-ERIn --color=never'
  " let g:unite_source_grep_recursive_opt = ''
" endif

" let g:vimfiler_edit_action = 'tabopen'
let g:vimfiler_as_default_explorer  = 1
let g:vimfiler_safe_mode_by_default = 0

autocmd FileType vimfiler call s:vimfiler_settings()
function! s:vimfiler_settings()
  nmap  <silent><buffer><expr><CR>  vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")
  nmap  <silent><buffer><expr>o     vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")
  nmap  <silent><buffer> q          <Plug>(vimfiler_exit)
  nmap  <silent><buffer> N          N
endfunction


"****************************************
" autocomplpop
" 補完決定
inoremap <expr><TAB> pumvisible() ? "<C-y>"     : "<TAB>"
" 補完消去して改行
inoremap <expr><CR>  pumvisible() ? "<C-e><CR>" : "<CR>"


"****************************************
" neocomplcache
" http://www.karakaram.com/vim/neocomplcache/
"
" " 補完ウィンドウの設定
" set completeopt=menuone
"
" " NeoComplCacheを有効にする
" let g:neocomplcache_enable_at_startup = 1
"
" " 補完候補の一番先頭を選択状態にする(AutoComplPopと似た動作)
" let g:neocomplcache_enable_auto_select = 1
"
" " ポップアップメニューで表示される候補の数
" let g:neocomplcache_max_list = 20
"
" " CamelCase補完
" let g:neocomplcache_enable_camel_case_completion = 1
"
" " UnderBar補完
" let g:neocomplcache_enable_underbar_completion = 1
"
" " SmartCase補完
" let g:neocomplcache_enable_smart_case = 0
"
" inoremap <expr><TAB> pumvisible() ? neocomplcache#close_popup() : "<TAB>"
" inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "<CR>"
" snoremap <expr><TAB> pumvisible() ? neocomplcache#close_popup() : "<TAB>"
" snoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "<CR>"


"****************************************
" neosnippet
" nnoremap <Space>s :<C-u>Unite snippet<CR>
"
" inoremap <expr>[close_popup] neocomplcache#close_popup()
"
" imap <expr><TAB> (pumvisible() && neosnippet#expandable()) ? "<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "[close_popup]" : neosnippet#jumpable() ? "<Plug>(neosnippet_jump)" : "<TAB>"
" smap <expr><TAB> (pumvisible() && neosnippet#expandable()) ? "<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "[close_popup]" : neosnippet#jumpable() ? "<Plug>(neosnippet_jump)" : "<TAB>"
" imap <expr><CR>  (pumvisible() && neosnippet#expandable()) ? "<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "[close_popup]" : neosnippet#jumpable() ? "<Plug>(neosnippet_jump)" : "<CR>"
" smap <expr><CR>  (pumvisible() && neosnippet#expandable()) ? "<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "[close_popup]" : neosnippet#jumpable() ? "<Plug>(neosnippet_jump)" : "<CR>"
"
" " imap <expr><TAB> neosnippet#expandable() ? "<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "[close_popup]" : "<TAB>"
" " smap <expr><TAB> neosnippet#expandable() ? "<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "[close_popup]" : "<TAB>"
" " imap <expr><CR>  neosnippet#expandable() ? "<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "[close_popup]" : "<CR>"
" " smap <expr><CR>  neosnippet#expandable() ? "<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "[close_popup]" : "<CR>"
"
" " set 3rd-party snippets
" let g:neosnippet#snippets_directory='~/.vim/bundle/snipmate-snippets/snippets'
"
" " disable default snippets
" let g:neosnippet#disable_runtime_snippets = {
"       \   '_' : 1,
"       \ }


"****************************************
" zencoding
" complete tags using omnifunc
" let g:use_zen_complete_tag = 1


"****************************************
" syntastic
" let g:syntastic_mode_map = {
"       \ 'mode': 'passive',
"       \ 'active_filetypes' : ['php', 'python', 'ruby', 'haskell'],
"       \ 'passive_filetypes': ['cpp'] }
" let g:syntastic_enable_signs = 1
" let g:syntastic_quiet_warnings = 1


"****************************************
" quickrun
" let g:quickrun_config = {
"       \   "_" : {
"       \       "outputter/buffer/into"     : 0,
"       \       "outputter/buffer/split"    : ":botright 8sp",
"       \       "runner"                    : "vimproc",
"       \       "runner/vimproc/updatetime" : 50,
"       \   }
"       \}
" nnoremap  <Space>b       :QuickRun<CR>


"****************************************
" uncrustify
autocmd FileType cpp nnoremap <silent><buffer> <C-k><C-o> :call Uncrustify('cpp')<CR>

" http://stackoverflow.com/questions/12374200/using-uncrustify-with-vim/15513829#15513829
function! Preserve(command)
  " Save the last search.
  let search = @/

  " Save the current cursor position.
  let cursor_position = getpos('.')

  " Save the current window position.
  normal! H
  let window_position = getpos('.')
  call setpos('.', cursor_position)

  " Execute the command.
  execute a:command

  " Restore the last search.
  let @/ = search

  " Restore the previous window position.
  call setpos('.', window_position)
  normal! zt

  " Restore the previous cursor position.
  call setpos('.', cursor_position)
endfunction

" Specify path to your Uncrustify configuration file.
let g:uncrustify_cfg_file_path =
    \ shellescape(fnamemodify('~/.uncrc', ':p'))

" Don't forget to add Uncrustify executable to $PATH (on Unix) or %PATH% (on Windows) for this command to work.
function! Uncrustify(language)
  call Preserve(':silent %!uncrustify'
      \ . ' -q '
      \ . ' -l ' . a:language
      \ . ' -c ' . g:uncrustify_cfg_file_path)
endfunction

"}}}

