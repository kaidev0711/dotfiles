source "~/.config/nushell/themes/kanagawa-dragon.nu"
source "~/.config/nushell/configs/keybindings.nu"
source "~/.config/nushell/configs/hooks.nu"       
source "~/.config/nushell/configs/menus.nu"       

$env.config = {
    show_banner: false 

    ls: {
        use_ls_colors: true 
        clickable_links: true 
    }

    rm: {
        always_trash: false 
    }

    table: {
        mode: rounded 
        index_mode: always 
        show_empty: true 
        padding: { left: 1, right: 1 } 
        trim: {
            methodology: wrapping 
            wrapping_try_keep_words: true 
            truncating_suffix: "..." 
        }
        header_on_separator: false 
        footer_inheritance: false 
    }

    error_style: "fancy" 

    display_errors: {
        exit_code: false 
        termination_signal: true
    }

    datetime_format: {

    }

    explore: {
        status_bar_background: { fg: "#1D1F21", bg: "#C4C9C6" },
        command_bar_text: { fg: "#C4C9C6" },
        highlight: { fg: "black", bg: "yellow" },
        status: {
            error: { fg: "white", bg: "red" },
            warn: {}
            info: {}
        },
        selected_cell: { bg: light_blue },
    }
    history: {
        max_size: 100_000 
        sync_on_enter: true 
        file_format: "plaintext" 
        isolation: false 
    }

    completions: {
        case_sensitive: false 
        quick: true    
        partial: true    
        algorithm: "prefix"    
        sort: "smart" 
        external: {
            enable: true 
            max_results: 100 
            completer: null 
        }
        use_ls_colors: true 
    }

    filesize: {
        metric: false 
        format: "auto" 
    }

    cursor_shape: {
        emacs: line 
        vi_insert: block 
        vi_normal: underscore 
    }

    # color_config: $base16_theme
    color_config: $kanagawa_theme
    footer_mode: 25 
    float_precision: 2 
    buffer_editor: null 
    use_ansi_coloring: true
    bracketed_paste: true 
    edit_mode: emacs 
    shell_integration: {
        osc2: true
        osc7: true
        osc8: true
        osc9_9: false
        osc133: true
        osc633: true
        reset_application_mode: true
    }
    render_right_prompt_on_last_line: false 
    use_kitty_protocol: false 
    highlight_resolved_externals: false 
    recursion_limit: 50 

    plugins: {} 

    plugin_gc: {
        default: {
            enabled: true 
            stop_after: 10sec 
        }
        plugins: {
            
        }
    }
    hooks: $hooks
    menus: $menus
    keybindings: $keybindings
    
}

source "~/.config/nushell/configs/modules.nu"     
source "~/.config/nushell/configs/completions.nu" 
source "~/.config/nushell/configs/aliases.nu"
source "~/.config/nushell/configs/defs.nu"        

# info
