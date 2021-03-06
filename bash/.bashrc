#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Always start in tmux session
#[[ -z "$TMUX" ]] && exec tmux

# Greeting
fortune all | cowthink
echo -e '\n'

# Set environment
export EDITOR="vim"
export VISUAL="vim"
export TMPDIR="$HOME/tmp"

## ls ## {{{
alias ls='ls -hF --color=auto'
alias ll='ls -l'
alias la='ll -A'
alias lx='ll -BX'                   # sort by extension
alias lz='ll -rS'                   # sort by size
alias lt='ll -rt'                   # sort by date
alias lm='la | more'

## Modified commands ## {{{
alias grep='grep --color=auto'
alias more='less'
alias df='df -h'
alias du='du -c -h'
alias packer='packer --noconfirm --noedit'
# }}}

# Command prompt
#PS1='\e[1;33m[\u@\h \w]\e[0;37m\n\$ '
#PS1='\$ '

# Set title bar text
export PROMPT_COMMAND='echo -ne "\033]0;$PWD\007"'

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# avoid duplicates..
export HISTCONTROL=ignoredups:erasedups

# remember a lot of history
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history

# append history entries..
shopt -s histappend
source ~/packer-completion.bash
PROMPT_COMMAND="history -a"

# pretty colors
eval $(dircolors -b $HOME/.dircolors)

# Is this the proper place to set PATH? should be in .profile?
PATH="/home/david/perl5/bin${PATH+:}$PATH"; export PATH;
PERL5LIB="/home/david/perl5/lib/perl5${PERL5LIB+:}$PERL5LIB"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/david/perl5${PERL_LOCAL_LIB_ROOT+:}$PERL_LOCAL_LIB_ROOT"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/david/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/david/perl5"; export PERL_MM_OPT;

PATH=$PATH:$HOME/bin:$HOME/.gem/ruby/2.1.0/bin:$HOME/pp/tools:/usr/local/lib
export PATH

LD_LIBRARY_PATH=/usr/local/lib
export LD_LIBRARY_PATH

