use '~/.config/nushell/resource/rust.nu' *

use '/Users/tuandang/.config/broot/launcher/nushell/br' *

use ($nu.default-config-dir | path join "scripts" "mise.nu")

use "~/.cache/starship/init.nu"

source "~/.cache/zoxide/init.nu"

source "~/.local/share/atuin/init.nu"


# scripts
source "~/.config/nushell/scripts/cargo-completions.nu"
source "~/.config/nushell/scripts/rustup-completions.nu"
