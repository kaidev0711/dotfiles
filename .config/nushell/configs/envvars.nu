$env.SHELL = "/opt/homebrew/bin/nu"
$env.BAT_THEME = "Kanagawa"
$env.EDITOR = "hx"
# $env.PAGER = "less"
$env.GPG_TTY = (tty)
$env.HOMEBREW_NO_ENV_HINTS = true
$env.LANG = "en_US.UTF-8"
$env.VISUAL = "hx"
$env.STARSHIP_SHELL = "nu" 
$env.LDFLAGS = "-L/opt/homebrew/opt/llvm/lib"
$env.CPPFLAGS = "-I/opt/homebrew/opt/llvm/include"
$env.STARSHIP_CONFIG = ("/.config/starship/starship.toml" | prepend $env.HOME | str join)
$env.FZF_DEFAULT_COMMAND = 'fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
# $env.FZF_DEFAULT_OPTS = "
 # --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 
 # --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc 
 # --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 
 # --color=selected-bg:#45475a 
 # --multi
 # --height=50% --layout=reverse --info=inline --border --margin=1 --padding=1 --preview 'bat --style=numbers --color=always --line-range :500 {}'"


$env.FZF_DEFAULT_OPTS = "--height=50% --layout=reverse --info=inline --border --margin=1 --padding=1 --preview 'bat --style=numbers --color=always --line-range :500 {}'"
