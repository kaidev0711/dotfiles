$env.PATH = (
  $env.PATH
  | split row (char esep)
  | append /usr/local/bin
  | append /usr/local/sbin
  | append /usr/sbin
  | append /opt/homebrew/opt/llvm/bin
  | append $"($env.HOME)/.local/bin"
  | append $"($env.HOME)/.cargo/bin"
  | append $"($env.HOME)/.local/scripts"
  | append $"($env.HOME)/Applications"
  | uniq 
)

$env.PATH = ($env.PATH | split row (char esep) | prepend '/opt/homebrew/bin' | uniq)

zoxide init --cmd cd nushell | save -f ~/.cache/zoxide/init.nu

# let mise_path = $nu.default-config-dir | path join mise.nu
let mise_path = $nu.default-config-dir | path join "scripts" "mise.nu"
^mise activate nu | save $mise_path --force
