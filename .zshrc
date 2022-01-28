# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' original false
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/randy/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
export LS_COLORS='rs=0:di=38;5;27:ln=38;5;51:mh=44;38;5;15:pi=40;38;5;11:so=38;5;13:do=38;5;5:bd=48;5;232;38;5;11:cd=48;5;232;38;5;3:or=48;5;232;38;5;9:mi=05;48;5;232;38;5;15:su=48;5;196;38;5;15:sg=48;5;11;38;5;16:ca=48;5;196;38;5;226:tw=48;5;10;38;5;16:ow=48;5;10;38;5;21:st=48;5;21;38;5;15:ex=38;5;34:*.tar=38;5;9:*.tgz=38;5;9:*.arj=38;5;9:*.taz=38;5;9:*.lzh=38;5;9:*.lzma=38;5;9:*.tlz=38;5;9:*.txz=38;5;9:*.zip=38;5;9:*.z=38;5;9:*.Z=38;5;9:*.dz=38;5;9:*.gz=38;5;9:*.lz=38;5;9:*.xz=38;5;9:*.bz2=38;5;9:*.tbz=38;5;9:*.tbz2=38;5;9:*.bz=38;5;9:*.tz=38;5;9:*.deb=38;5;9:*.rpm=38;5;9:*.jar=38;5;9:*.rar=38;5;9:*.ace=38;5;9:*.zoo=38;5;9:*.cpio=38;5;9:*.7z=38;5;9:*.rz=38;5;9:*.jpg=38;5;13:*.jpeg=38;5;13:*.gif=38;5;13:*.bmp=38;5;13:*.pbm=38;5;13:*.pgm=38;5;13:*.ppm=38;5;13:*.tga=38;5;13:*.xbm=38;5;13:*.xpm=38;5;13:*.tif=38;5;13:*.tiff=38;5;13:*.png=38;5;13:*.svg=38;5;13:*.svgz=38;5;13:*.mng=38;5;13:*.pcx=38;5;13:*.mov=38;5;13:*.mpg=38;5;13:*.mpeg=38;5;13:*.m2v=38;5;13:*.mkv=38;5;13:*.ogm=38;5;13:*.mp4=38;5;13:*.m4v=38;5;13:*.mp4v=38;5;13:*.vob=38;5;13:*.qt=38;5;13:*.nuv=38;5;13:*.wmv=38;5;13:*.asf=38;5;13:*.rm=38;5;13:*.rmvb=38;5;13:*.flc=38;5;13:*.avi=38;5;13:*.fli=38;5;13:*.flv=38;5;13:*.gl=38;5;13:*.dl=38;5;13:*.xcf=38;5;13:*.xwd=38;5;13:*.yuv=38;5;13:*.cgm=38;5;13:*.emf=38;5;13:*.axv=38;5;13:*.anx=38;5;13:*.ogv=38;5;13:*.ogx=38;5;13:*.aac=38;5;45:*.au=38;5;45:*.flac=38;5;45:*.mid=38;5;45:*.midi=38;5;45:*.mka=38;5;45:*.mp3=38;5;45:*.mpc=38;5;45:*.ogg=38;5;45:*.ra=38;5;45:*.wav=38;5;45:*.axa=38;5;45:*.oga=38;5;45:*.spx=38;5;45:*.xspf=38;5;45:'

alias ll='exa -la'
alias llg='exa -la --git'
alias lsof-listen='lsof -iTCP -sTCP:LISTEN'
alias cat='bat'
alias du='dust'
alias df='duf'
alias tree='br -i'
alias find='fd -HIl'
alias top='glances'
alias ag='ag -f'
alias rg='rg --follow'
alias vim='nvim'
alias tg='tmux-go.py'

export GIT_EDITOR=nvim

export GOPATH=$HOME
export GOBIN=~/bin

# unicode symbols in the prompt
SEP=$'\ue0b0'
# UNC_SYM_RIGHT_ARROW=$'\UE0B0'
UNC_SYM_RIGHT_ARROW=$''
# UNC_SYM_LEFT_ARROW=$'\UE0B2'
# UNC_SYM_LEFT_ARROW=$''

# ANSI colour escape sequences for prompt
COLOUR_OFF="\033[0m"
# FG_COLOUR_BLACK="\033[30m"
# FG_COLOUR_RED="\033[31m"
# FG_COLOUR_GREEN="\033[32m"
# FG_COLOUR_BROWN="\033[33m"
# FG_COLOUR_BLUE="\033[34m"
# FG_COLOUR_PURPLE="\033[35m"
# FG_COLOUR_CYAN="\033[36m"
# FG_COLOUR_GRAY="\033[37m"
# BG_COLOUR_BLACK="\033[40m"
# BG_COLOUR_RED="\033[41m"
# BG_COLOUR_GREEN="\033[42m"
# BG_COLOUR_BROWN="\033[43m"
# BG_COLOUR_BLUE="\033[44m"
# BG_COLOUR_PURPLE="\033[45m"
# BG_COLOUR_CYAN="\033[46m"
# BG_COLOUR_GRAY="\033[47m"
BGFG_COLOUR_BLK_ON_GREEN=$'\033[42;30m'
BGFG_COLOUR_BLK_ON_BLUE=$'\033[44;30m'
BGFG_COLOUR_GREEN_ON_BLUE=$'\033[44;32m'
BGFG_COLOUR_BLUE_ON_BLK=$'\033[40;34m'

setopt promptsubst
autoload -Uz vcs_info
precmd () { vcs_info }

zstyle ':vcs_info:*' actionformats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
#zstyle ':vcs_info:*' actionformats ' %u%c'
zstyle ':vcs_info:*' formats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
#zstyle ':vcs_info:*' formats ' %u%c'
#zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'
#zstyle ':vcs_info:*' enable git
#zstyle ':vcs_info:*' get-revision true
#zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '✚'
zstyle ':vcs_info:*' unstagedstr '±'

#PROMPT="${BGFG_COLOUR_BLK_ON_GREEN}%n@%m${BGFG_COLOUR_GREEN_ON_BLUE}${SEP}${BGFG_COLOUR_BLK_ON_BLUE} %~ ${BGFG_COLOUR_BLUE_ON_BLK}${SEP} ${vcs_info_msg_0_} %f%k"$'\n'"$ "

PS1='%F{5}[%F{2}%n@%m%F{5}] %F{3}%3~ ${vcs_info_msg_0_}%f'$'\n''%# '
