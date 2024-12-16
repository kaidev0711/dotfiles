#alias
alias nu-open = open
alias open = ^open

alias c = clear

alias cp = cp -i
alias mv = mv -i
# alias rm = rm -i

alias rmds = fd -H '^\.DS_Store$' -tf -X rm -i

alias br = br -H

alias ps = procs
alias du = dust
alias grep = rg
alias sed = sd
alias find = fd
alias top = btm
alias info = fastfetch
alias ip = ipconfig getifaddr en0
alias to = tock -c -m
alias ppsh = pipes.sh
alias gt = gitui
alias ju = just
alias http = xh
alias hu = hurl

alias x = eza --icons=always --color=always --group-directories-first
alias xa = eza --icons=always --color=always --group-directories-first --all
alias xl	= eza --icons=always --color=always --group-directories-first --long
alias xla = eza --icons=always --color=always --group-directories-first --long --all
alias xt	= eza --icons=always --color=always --group-directories-first --tree
alias xta = eza --icons=always --color=always --group-directories-first --tree --all

alias hxff = fzf --bind 'enter:become(hx {})'

# alias y = yazi

alias tn = tmux new -s
alias tl = tmux ls
alias ta = tmux attach-session -t
alias tk = tmux kill-session -t
alias tka = tmux kill-session -a

