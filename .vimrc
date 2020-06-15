set nu
" tab为2空格，google标准
set ts=2
" tab用空格代替
set expandtab
" 自动缩进
set autoindent
" 缩进空格数为2
set shiftwidth=2


call plug#begin('~/.vim/plugged')

" 定义插件，默认用法，和 Vundle 的语法差不多
Plug 'junegunn/vim-easy-align'
Plug 'skywind3000/quickmenu.vim'

" " 延迟按需加载，使用到命令的时候再加载或者打开对应文件类型才加载
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" " 确定插件仓库中的分支或者 tag
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" "universa-ctags
Plug 'universal-ctags/ctags'
" " 安装tags自动生成器
Plug 'ludovicchabant/vim-gutentags'

" " 安装动态代码检查工具
Plug 'w0rp/ale'
call plug#end()

set tags=./.tags;,.tags
" 先用下列语句生成系统头文件的tags, 再添加tags
"ctags -I __THROW --file-scope=yes -h=".h,." --language-force=c++ --langmap=c:+.h+.hpp+ --languages=c,c++ --links=yes --c-kinds=+p --fields=+S  -R -f ~/.vim/sys-tags /usr/include/c++/4.8.2/ /usr/include
set tags+=~/.vim/sys-tags
" 第三方库tags放到~/.vim/third-party-tags
set tags+=~/.vim/third-party-tags

" gutentags 配置

" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" " 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" " 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
"
" " 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
"
" " 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
   endif

" " ALE 动态代码检查工具
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_linters = {'cpp':['g++', 'gcc']}

let g:ale_c_gcc_options = '-I ~/projects/fluid_inference/paddle/include/ ~/projects/fluid_inference/third_party/install/gflags/include/ ~/projects/fluid_inference/third_party/install/glog/include/ ~/projects/fluid_inference/third_party/install/mklml/include/ ~/projects/fluid_inference/third_party/install/protobuf/include/ ~/projects/fluid_inference/third_party/install/xxhash/include/ ~/projects/fluid_inference/third_party/install/zlib/include/ -Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-I ~/projects/fluid_inference/paddle/include/ ~/projects/fluid_inference/third_party/install/gflags/include/ ~/projects/fluid_inference/third_party/install/glog/include/ ~/projects/fluid_inference/third_party/install/mklml/include/ ~/projects/fluid_inference/third_party/install/protobuf/include/ ~/projects/fluid_inference/third_party/install/xxhash/include/ ~/projects/fluid_inference/third_party/install/zlib/include/ -Wall -O2 -std=c++11'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

let g:ale_sign_error = "\ue009\ue009"
hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! SpellBad gui=undercurl guisp=red
hi! SpellCap gui=undercurl guisp=blue
hi! SpellRare gui=undercurl guisp=magenta

