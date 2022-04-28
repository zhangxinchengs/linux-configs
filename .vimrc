""设置当文件被改动时自动载入
set autoread
colorscheme elflord
"共享剪贴板  
set clipboard=unnamed 
"从不备份  
set nobackup
"自动保存
set autowrite
set cursorline    "or set cul 设置光标所在的行
" cterm 表示原生vim设置央视, 设置为NONE表示可以自定义设置
" red（红），white（白），black（黑），green（绿），yellow（黄），blue（蓝），purple（紫）
" gray（灰），brown（棕），tan(褐色)，syan(青色)
" 更多高亮颜色设置, 可以:h highlight 查看manual
highlight CursorLine	term=bold cterm=bold ctermbg=black ctermfg=NONE guibg=NONE guifg=NONE
highlight CursorLineNr	term=bold cterm=bold ctermbg=black ctermfg=NONE guibg=NONE guifg=NONE
""highlight Search term=standout ctermfg=0 ctermbg=11 guifg=Black guibg=Yellow
nmap hi :highlight CursorLine term=bold cterm=bold ctermbg=black ctermfg=NONE guibg=NONE guifg=NONE<CR><CR>
nmap hin :highlight CursorLineNr term=bold cterm=bold ctermbg=black ctermfg=NONE guibg=NONE guifg=NONE<CR><CR>
set magic                   " 设置魔术
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏
set foldcolumn=0
set foldmethod=indent 
set foldlevel=3 
" 不要使用vi的键盘模式，而是vim自己的
set nocompatible
" 语法高亮
syntax on
" 去掉输入错误的提示声音
set noeb
" 在处理未保存或只读文件的时候，弹出确认
set confirm
" 自动缩进
set autoindent
set cindent
" Tab键的宽度
set tabstop=4
" 统一缩进为4
set softtabstop=4
set shiftwidth=4
" 不要用空格代替制表符
set noexpandtab
" 在行和段开始处使用制表符
set smarttab
" 显示行号
set number
" 历史记录数
set history=1000
"禁止生成临时文件
set nobackup
set noswapfile
"搜索忽略大小写
set ignorecase
"搜索逐字符高亮
set hlsearch
set incsearch
"行内替换
set gdefault
"编码设置
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn
" 总是显示状态行
set laststatus=2
" 命令行（在状态行下）的高度，默认为1，这里是2
set cmdheight=1
" 侦测文件类型
filetype on
" 载入文件类型插件
filetype plugin on
" 为特定文件类型载入相关缩进文件
filetype indent on
" 保存全局变量
set viminfo+=!
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
" 字符间插入的像素行数目
set linespace=0
" 增强模式中的命令行自动完成操作
set wildmenu
" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l
" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1
" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3
" 为C程序提供自动缩进
set smartindent
" 高亮显示普通txt文件（需要txt.vim脚本）
 au BufRead,BufNewFile *  setfiletype txt
"自动补全
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {<CR>}<ESC>O
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function! ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endfunction
filetype plugin indent on 
"打开文件类型检测, 加了这句才可以用智能补全
set completeopt=longest,menu
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""cscope config
if has("cscope")
set csprg=/usr/bin/cscope
set csto=0
set cst
set nocsverb
" add any database in current directory
if filereadable("cscope.out")
cs add cscope.out
" else add database pointed to by environment
elseif $CSCOPE_DB != ""
cs add $CSCOPE_DB
endif
set csverb
endif
nmap css :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap csg :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap csc :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap cst :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap cse :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap csf :cs find f <C-R>=expand("<cword>")<CR><CR>
nmap csd :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap csi :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>


"plugin
"启用vundle来管理vim插件
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 安装插件写在这之后
Plugin 'vim-utils/vim-man'
Plugin 'bling/vim-airline'
Plugin 'junegunn/fzf.vim'
Plugin 'Yggdroot/LeaderF'
"安装插件写在这之前
call vundle#end() " required
filetype plugin on " required
" 常用命令
" :PluginList       - 查看已经安装的插件
" :PluginInstall    - 安装插件
" :PluginUpdate     - 更新插件
" :PluginSearch     - 搜索插件
" :PluginClean      - 删除插件，把安装插件对应行删除，然后执行这个命令即可
" h: vundle         - 获取帮助
"---------------------------vim-man配置--------------------------------------
source $VIMRUNTIME/ftplugin/man.vim
"按m横屏显示manpage
nmap m :Man <C-R>=expand("<cword>")<CR><CR>
"按vm竖屏显示manpage
nmap vm :Vman <C-R>=expand("<cword>")<CR><CR>

"-----------------------"
"NERDTree key map 
nmap <F3> :NERDTree  <CR>

"------------------"
"taglist 
let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
""let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口
nmap <F4> :TlistOpen  <CR>

function! Mydict()
  let expl=system('sdcv -n ' .
        \  expand("<cword>"))
  windo if
        \ expand("%")=="diCt-tmp" |
        \ q!|endif
  sp diCt-tmp
  setlocal buftype=nofile bufhidden=hide noswapfile
  1s/^/\=expl/
  1
endfunction
nmap F :call Mydict()<CR><CR>

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '❯'
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '❮'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
" 是否打开tabline
let g:airline#extensions#tabline#enabled = 1 
" 打开后，tabline和tmuxline都可以得到增强
noremap <C-F> :<C-U><C-R>=printf("Leaderf rg -g *.c -g *.h -g *.S -s -e %s ", expand("<cword>"))<CR>
