sudo apt install -y curl git tmux silversearcher-ag
curl https://pyenv.run | bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
pushd
git clone git@github.com:sergeant-wizard/rc_files
ln -s rc_files/.vimrc .
ln -s rc_files/tmux.conf.linux .tmux.conf
git clone https://github.com/vim/vim
git clone https://github.com/powerline/powerline
