#zoxide completion
export def "nu-complete zoxide path" [line : string, pos: int] {
    let prefix = ($line | str trim | split row ' ' | append ' ' | skip 1 | get 0)
    let data = (^zoxide query $prefix --list | lines)
    return {
        completions: $data,
        options: {
            completion_algorithm: "fuzzy"
        }
    }
}
