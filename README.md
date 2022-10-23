# My Linux environment config file

## Vim Configuration

### (Optional) Install Vim 8.0 +
I would like to use the vim with the version 8.0+ because it has lots of new attractive features such as terminal mode.

```
git clone https://github.com/vim/vim.git
cd vim

# Need to clean the compile cache when recompile
rm -f src/auto/config.cache
make distclean

./configure --with-features=huge --enable-multibyte --enable-python3interp --with-python-config-dir='/xxx/config-3.7m-x86_64-linux-gnu'

make -j8
make install
```

#### Terminal Mode

When you are in normal mode in vim, you can input `:term ++close bash` to create a terminal inside the vim. You can bind the keys.

```
map <Leader>t :term ++close bash<cr>
```

### Install the awesome vim plugin

```
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
```

### Install Vundle package management tools

1. Install vundle

```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

2. Configure Plugins

```

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

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

```

3. Install Plugins

Launch `vim` and run `:PluginInstall`

### Install YouCompleteMe

https://github.com/ycm-core/YouCompleteMe
