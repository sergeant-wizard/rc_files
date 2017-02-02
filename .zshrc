# Path to your oh-my-zsh installation.
export ZSH=/home/ryo/.oh-my-zsh

HYPHEN_INSENSITIVE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(git zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

eval `keychain --eval id_rsa id_rsa`

# ROS
source /opt/ros/indigo/setup.zsh

# GPS related envs
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/ryo/gps/build/lib
export PYTHONPATH=$PYTHONPATH:/home/ryo/gps/build/lib

# caffe
export PYTHONPATH=$PYTHONPATH:/home/ryo/caffe/python

# Z
. ~/z/z.sh

export PATH=/home/ryo/vim/bin:$PATH

. /home/ryo/powerline/powerline/bindings/zsh/powerline.zsh

export PATH=/home/ryo/toroboarmcommandlineclient:$PATH
export PATH=/home/ryo/bin:$PATH

eval `dircolors /home/ryo/.dir_colors/dircolors`

alias putclip='xclip -selection c'
alias getclip='xclip -selection clipboard -o'
