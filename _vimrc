set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin
"关闭vi兼容模式
set nocp
"打开文件类型检测
filetype off
"允许使用插件
filetype plugin on
filetype plugin indent on
"自动补全
"inoremap ( ()<ESC>i
"inoremap " ""<ESC>i
"imap ' ''<ESC>i
imap [ []<ESC>i
imap { {}<ESC>i
imap < <><ESC>i
imap {<CR> {<CR>}<ESC>O
"启动的是否不显示援助乌干达儿童提示
set shortmess=atI
"设置窗口位置
"winpos 5 5
"设置窗口大小
"set lines=40 columns=155
"设置字体
set guifont=Consolas:h14:cANSI
"代码补全
set completeopt=preview,menu
"隐藏工具栏
"set guioptions-=T
"隐藏菜单栏
"set guioptions-=m
"设置配色方案
colorscheme molokai
"从不备份
set nobackup
"禁止生成临时文件
"set noswapfile
""""""""""""""""""""""""""""""""""""""""""""
"vim在windows下的编码设置
""""""""""""""""""""""""""""""""""""""""""""
set enc=utf-8
set fencs=utf-8,gbk,chinese,big5,cp936,gb18030,gb2312,utf-16
"set termencoding=utf-8
if has("win32")
	set enc=chinese
else
	set enc=utf-8
endif
"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
""""""""""""""""""""""""""""""""""""""""""""
"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn
"显示行号
set nu
"自动缩进
set autoindent
set cindent
"统一缩进为4
set softtabstop=4
set shiftwidth=4
"tab键的宽度
set tabstop=4
"空格代表制表符
set noexpandtab
set smarttab
"自动补全命令时候使用菜单式匹配列表
"set wildmenu
"autocmd filetype ruby,eruby set omnifunc=rubycomplete#complete
"autocmd filetype python set omnifunc=pythoncomplete#complete
"autocmd filetype javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd filetype html set omnifunc=htmlcomplete#completetags
"autocmd filetype css set omnifunc=csscomplete#completecss
"autocmd filetype xml set omnifunc=xmlcomplete#completetags
"autocmd FileType java set omnifunc=javacomplete#Complet
set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

""""""""""""""""""""""""""""""""""""""""""""
" vim插件管理工具Vundle配置
""""""""""""""""""""""""""""""""""""""""""""
" set nocompatible              " be iMproved, required
" filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$VIM/vimfiles/bundle/Vundle.vim/
call vundle#begin('$VIM/vimfiles/bundle/')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugin on GitHub repo
Plugin 'altercation/vim-colors-solarized'
Plugin 'molokai'		" 配色方案
Plugin 'DoxygenToolkit.vim'		" 注释文档生成

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

""""""""""""""""""""""""""""""""""""""""""""
" DoxygenToolkit配置
""""""""""""""""""""""""""""""""""""""""""""
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:doxygen_enhanced_color=1
" 注释快首尾
let g:DoxygenToolkit_blockHeader="*******************************************************" 
let g:DoxygenToolkit_blockFooter="*******************************************************" 
" 作者
let g:DoxygenToolkit_authorName="maojunhui5214@163.com"
" Lincese
let g:DoxygenToolkit_licenseTag = "Copyright (C) 2018 http://mounui.com\<enter>\<enter>Call Center On Demand Product Series\<enter>If you have any questions, please contact me at my blog. \<enter>All right reserved\<enter>\<enter>$$\<enter>TODO:\<enter>\<enter>*******************************************************"
