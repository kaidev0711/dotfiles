# fastfetch
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH=$PATH:/Users/kaidev/.local/scripts
export STARSHIP_CONFIG=~/.config/starship/starship.toml
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export BAT_THEME="Kanagawa"
export ZSH="$HOME/.oh-my-zsh"
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
export EDITOR=$(which hx)
export VISUAL=hx
export LANG=en_US.UTF-8
export ESPANSO_CONFIG=~/.config/espanso

ZSH_THEME="robbyrussell"

plugins=(
  git
  web-search
  brew
  rust
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

alias zshrc="hx ~/.zshrc"
alias reload="source ~/.zshrc"

alias ngrcf="hx ~/Library/Application\ Support/ngrok/ngrok.yml"

alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

alias brupr="brew update && brew upgrade && brew upgrade --cask"

# alias br="br -dw"

alias cat="bat -p --paging=never"
alias ps="procs"
alias du="dust"
# alias cd="z"
alias grep="rg"
alias lg="lazygit"
alias sed="sd"
alias find="fd"
# fastfetch
alias info="fastfetch"
alias ip="ipconfig getifaddr en0"
alias to="tock -c -m"
alias ppsh="pipes.sh"
alias http="xh"
alias gt="gitui"

alias kai="cd ~/Docs/kaidev0711"

alias ju="just"

# Rust
alias cgn="cargo new"
alias cgr="cargo run"

#fd
alias fffd="find --type file --follow --hidden --exclude .git | sk --preview='bat {} --color=always'"
alias hxfd='hx $(find --type file --follow --hidden --exclude .git | sk --preview="bat {} --color=always")'
alias hxrs='hx $(find -e rs | sk --preview="bat {} --color=always")'
alias rmds="fd -H '^\.DS_Store$' -tf -X rm -i"

#rg
alias ffrg="rg --files | sk --preview='bat {} --color=always'"
alias hxrg='hx $(rg --files --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null | sk --preview="bat {} --color=always")'
alias skrg="sk --ansi -i -c 'rg --color=always --line-number \\{}'"

if [ -x "$(command -v eza)" ]; then
  # alias ls="eza"
  alias ls="eza -al --icons=always --color=always --group-directories-first"
  alias la="eza -a  --icons=always --color=always --group-directories-first"
  alias ll="eza -l  --icons=always --color=always --group-directories-first"
  alias lt="eza -aT --icons=always --color=always --group-directories-first"
  alias l.='eza -a | egrep "^\."'
  # alias tree="eza --tree --level=2 --icons=always --color=always"
fi

HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history 
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# tmux
# alias tn="tmux new -s"
# alias tl="tmux ls"
# alias ta="tmux attach-session -t"
# alias tk="tmux kill-session -t"
# alias tka="tmux kill-session -a"

# zellij
# alias zjd="zellij action new-tab -l ~/.config/zellij/layouts/default.kdl"
# alias zjr="zellij action new-tab -l ~/.config/zellij/layouts/rust.kdl"

# source "$HOME/.cargo/env"
. "$HOME/.cargo/env"

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(atuin init zsh)"
eval "$(mise activate zsh)"
eval "$(starship init zsh)"
# eval "$(zellij setup --generate-auto-start zsh)"

function mkcd() { mkdir -p "$@" && cd "$_"; }

function colormap() {
  for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done
}
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"


# Added by OrbStack: command-line tools and integration
# Comment this line if you don't want it to be added again.
source ~/.orbstack/shell/init.zsh 2>/dev/null || :

function killjob()
{
    emulate -L zsh
    for jobnum in $@ ; do
        kill ${${jobstates[$jobnum]##*:*:}%=*}
    done
}

source /Users/kaidev/.config/broot/launcher/bash/br

function tree {
     br -c :pt "$@"
}
