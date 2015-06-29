. ~/.profile
#if [ -e "/opt/lisa/os/.local.bashrc" ]; then
#    source /opt/lisa/os/.local.bashrc;
#else
#   source /data/lisa/data/local_export/.local.bashrc;
#fi
if [ -e "/opt/lisa/os_v3/.local.bashrc" ];then source /opt/lisa/os_v3/.local.bashrc; else source /data/lisa/data/local_export/.local.bashrc; fi
#if [ -e "/opt/lisa/os_v4/.local.bashrc" ];then source /opt/lisa/os_v4/.local.bashrc; else source /data/lisa/data/local_export/.local.bashrc; fi

alias clc=clear
alias firefox=/opt/lisa/os/firefox-38.0.5.x86_64/firefox

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alhtF'
alias la='ls -A'
alias l='ls -CF'


# git autocomplete
if [ -f ~/.git-completion.bash ]; then
    source ~/.git-completion.bash
fi

umask 027

# latex paths
export BIBINPUTS=.:$HOME/articles/bib:
export BSTINPUTS=.:$HOME/articles/bst:
export TEXINPUTS=.:$HOME/articles/sty:

# blas flag
export BLAS_FLAG=',blas.ldflags="-L/usr/lib64/ -lblas"'

# theano flag
export THEANO_FLAGS='floatX=float32,scan.allow_gc=False'$BLAS_FLAG
export THEANO_FLAGS_INIT=$THEANO_FLAGS

# theano device flags
alias GPU0='THEANO_FLAGS=device=gpu0,floatX=float32,scan.allow_gc=False,nvcc.fast_math=True,lib.cumem=True'
alias GPU1='THEANO_FLAGS=device=gpu1,floatX=float32,scan.allow_gc=False,nvcc.fast_math=True,lib.cumem=True'
alias GPU2='THEANO_FLAGS=device=gpu2,floatX=float32,scan.allow_gc=False,nvcc.fast_math=True,lib.cumem=True'
alias CPU='THEANO_FLAGS=device=cpu,floatX=float32'$BLAS_FLAG
alias PROFILE='CUDA_LAUNCH_BLOCKING=1 THEANO_FLAGS=proﬁle_memory=True,profile=True,${THEANO_FLAGS}'

# python paths
#export PYTHONPATH=$HOME/.local/lib/python2.7/site-packages:$PYTHONPATH
#export PYTHONPATH=/opt/lisa/byhost/lib/python2.7/site-packages:$PYTHONPATH
#export PYTHONPATH=/opt/lisa/os/lib/python2.7/site-packages/vtk_python:$PYTHONPATH
#export PYTHONPATH=/opt/lisa/os/lib/python2.7/site-packages:$PYTHONPATH
#export PYTHONPATH=/opt/lisa/os_v3/lib/python2.7/site-packages:$PYTHONPATH
export PYLEARN2_DATA_PATH=/data/lisa/data
export PYLEARN2_LOCATION=/u/firatorh/pylearn2/pylearn2
export PYLEARN2_VIEWER_COMMAND="gwenview"
export PATH=$PATH:/u/firatorh/foma/linux64

#export PYTHONPATH=/u/firatorh/git/GroundHog:$PYTHONPATH # change it to ~/git/GroundHog/
#export PYTHONPATH=/u/firatorh/git/LV_groundhog:$PYTHONPATH # change it to ~/git/GroundHog/
export PYTHONPATH=/u/firatorh/git/arctic-cglr/arctic:$PYTHONPATH
#export PYTHONPATH=/u/firatorh/git/arctic:$PYTHONPATH
export PYTHONPATH=$PYTHONPATH:/u/firatorh/git/MFDL
export PYTHONPATH=$HOME/git/GroungHogWMT15:$PYTHONPATH # change it to ~/git/GroundHog/
export PYTHONPATH=~/git/GroundHogWMT15:$PYTHONPATH
export PYTHONPATH=/u/firatorh/.local/lib/python2.7/site-packages:$PYTHONPATH
export PYTHONPATH=/u/firatorh/git/MemoryNetwork/codes:$PYTHONPATH
#export PYTHONPATH=/u/firatorh/git/NMT:$PYTHONPATH
export PYTHONPATH=/opt/lisa/os/lib/python2.7/site-packages:$PYTHONPATH
alias ipython=/opt/lisa/os/bin/ipython

# directory paths
export IWSLT_PATH=/data/lisatmp3/firatorh/turkishParallelCorpora/iwslt14
export LM_PATH=/data/lisatmp3/firatorh/languageModelling
export NMT_PATH=/data/lisatmp3/firatorh/nmt
export OPENMT_PATH=/data/lisatmp3/firatorh/nmt/openmt15
export ACL15_PATH=/data/lisatmp3/firatorh/nmt/acl15
export WMT15_PATH=/data/lisatmp3/firatorh/nmt/wmt15
export NTM_PATH=/data/lisatmp3/firatorh/ntm
#export FUEL_DATA_PATH=/part/02/Tmp/firatorh/datasets
export FUEL_DATA_PATH=/data/lisatmp3/firatorh/datasets
export JEAS_PATH=/data/lisatmp3/jeasebas/nmt/data/wmt15

# other paths
export SCREENRC="$HOME/.screenrc"
export PERL5LIB=$PERL5LIB:/u/firatorh/git
export PATH=/u/firatorh/.local/bin:$PATH
#export PATH=/opt/lisa/os/bin:$PATH
export LOCAL=/part/02/Tmp/firatorh

# groundhog path utils
SET_GHOG() { 
    PYTHONPATH=~/git/GroundHog:$PYTHONPATH 
}
SET_WMT15() { 
    PYTHONPATH=~/git/GroundHogWMT15:$PYTHONPATH 
}
SET_LV() { 
    PYTHONPATH=~/git/LV_groundhog:$PYTHONPATH 
}

# disk usage
disk_usage() {
    du -h $1 2> >(grep -v '^du: cannot \(access\|read\)' >&2) | grep '[0-9\.]\+G' | sort -rn
}

export -f SET_GHOG
export -f SET_WMT15
export -f SET_LV
export -f disk_usage

# cool bash and git bash extension
source ~/.git-prompt.sh
# foreground colors
BLACK='\[\e[0;30m\]'        # Black
RED='\[\e[0;31m\]'          # Red
GREEN='\[\e[0;32m\]'        # Green
YELLOW='\[\e[0;33m\]'       # Yellow
BLUE='\[\e[0;34m\]'         # Blue
PURPLE='\[\e[0;35m\]'       # Purple
CYAN='\[\e[0;36m\]'         # Cyan
WHITE='\[\e[0;37m\]'        # White

# format bash
RESET=${WHITE}
#PS1='[\u@\h \W]\$$(__git_ps1 " (%s)")'
PS1=${GREEN}'┌────── \u@\h'${BLUE}' [\w]'${YELLOW}'$(__git_ps1 " (%s)")\n'${GREEN}'└─ λ '${RESET}
# VIRTUAL_ENV_DISABLE_PROMPT=1 source ~/Enthought/Canopy_64bit/User/bin/activate

