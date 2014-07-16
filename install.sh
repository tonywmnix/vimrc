#!/bin/bash
rm -fv ~/.vimrc ~/.gvimrc
ln -sv ~/.vim/vimrc ~/.vimrc
ln -sv ~/.vim/gvimrc ~/.gvimrc

cd bundle
git clone https://github.com/mileszs/ack.vim.git
git clone https://github.com/vim-scripts/Align.git
git clone https://github.com/wincent/Command-T.git
git clone https://github.com/kien/ctrlp.vim.git
git clone https://github.com/vim-scripts/DirDiff.vim.git
git clone https://github.com/editorconfig/editorconfig-vim.git
git clone https://github.com/vim-scripts/L9.git
git clone https://github.com/tmhedberg/matchit.git
git clone https://github.com/Lokaltog/powerline.git
git clone https://github.com/kien/rainbow_parentheses.vim.git
git clone https://github.com/kien/tabman.vim.git
git clone https://github.com/vim-scripts/vcscommand.vim.git
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/thinca/vim-localrc.git
git clone https://github.com/tpope/vim-pathogen.git
git clone https://github.com/tpope/vim-sensible.git
git clone https://github.com/tpope/vim-surround.git
git clone https://github.com/tpope/vim-dispatch.git
git clone https://github.com/tpope/vim-rails.git
git clone https://github.com/vim-voom/VOoM.git
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/oplatek/Conque-Shell.git
git clone https://github.com/ervandew/supertab.git
git clone https://github.com/Rip-Rip/clang_complete.git
git clone https://github.com/yegappan/mru.git
git clone https://github.com/chrisbra/csv.vim.git
cp -rfv _overrides/* .


#svn checkout http://conque.googlecode.com/svn/trunk conque-read-only
