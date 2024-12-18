local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux

local config = {}
if wezterm.config_builder then config = wezterm.config_builder() end

config.color_scheme = 'kanagawabones'
config.initial_cols = 150
config.initial_rows = 40
config.enable_tab_bar = false
-- config.window_decorations = "TITLE | RESIZE"
config.window_decorations = "RESIZE"
config.window_background_opacity = 1.0
config.macos_window_background_blur = 0
config.font = wezterm.font_with_fallback {
	{
    family = 'Cascadia Code',
    weight = 'Bold',
		stretch ="Normal",
		style="Normal",
  },
  {
  	family = 'GeistMono Nerd Font',
  	weight = 'Bold',
  	style="Normal"
  },
  {
  	family = 'JetBrains Mono',
  	weight = 'Bold',
   	style="Italic"
  },
  "Broot Icons Visual Studio Code"
}
config.warn_about_missing_glyphs=false
config.font_size = 16
config.scrollback_lines = 3000
config.window_close_confirmation = 'NeverPrompt'
config.default_workspace = "KAIDEV0711"
-- config.front_end = "WebGpu"
config.default_cursor_style = "BlinkingBar"
config.cursor_blink_rate = 400

config.inactive_pane_hsb = {
	saturation = 0.9,
	brightness = 0.8,
}

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.hyperlink_rules = wezterm.default_hyperlink_rules()


wezterm.on('gui-startup', function(cmd)

	local args = {}
	if cmd then
		args = cmd.args
	end

	local rust_dir = wezterm.home_dir .. '/Development/_rust'
	local tab, pane, window = mux.spawn_window {
    workspace = 'RUST',
    cwd = rust_dir,
    args = args,
  }
  -- local editor_pane = pane:split {
  --   direction = 'Top',
  			-- size = 0.7,
  --   cwd = rust_dir,
  -- }

	-- editor_pane:send_text 'br\n'
	pane:send_text 'br\n'
  -- pane:send_text ''

  local tab, pane, window = mux.spawn_window {
    workspace = 'KAIDEV0711',
    args = args,
  }

  -- We want to startup in the coding workspace
  mux.set_active_workspace 'KAIDEV0711'

end)


config.leader = { key = 'b', mods = 'CTRL' }
config.keys = {
		{ key = 'Enter', mods = 'ALT', action = wezterm.action.DisableDefaultAssignment, },
		{ key = "c", mods = "LEADER", action = act.ActivateCopyMode },
		{ key = "phys:Space", mods = "LEADER", action = act.ActivateCommandPalette },
		{ key = "s", mods = "LEADER", action = act.SplitVertical { domain = "CurrentPaneDomain" } },
  	{ key = "v", mods = "LEADER", action = act.SplitHorizontal { domain = "CurrentPaneDomain" } },
		{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
    { key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
    { key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
    { key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
		{ key = "o", mods = "LEADER", action = act.RotatePanes "Clockwise" },
		{ key = 'f', mods = 'LEADER', action = act.ToggleFullScreen, },
		{ key = 'z', mods = 'LEADER', action = act.TogglePaneZoomState, },
		{ key = 'q', mods = 'LEADER', action = act.CloseCurrentPane { confirm = false }, },
		{ key = 'r', mods = 'LEADER', action = act.ActivateKeyTable { name = 'resize_pane', one_shot = false, }, },
    { key = "w", mods = "LEADER", action = act.ShowLauncherArgs { flags = "FUZZY|WORKSPACES" } },
	  { key = 'p', mods = 'LEADER', action = act.SwitchToWorkspace { name = 'RUST', }, },
		-- { key = 'a', mods = 'LEADER', action = act.ActivateKeyTable { name = 'activate_pane', timeout_milliseconds = 1000, }, },
}

config.key_tables = {
	resize_pane = {
    { key = 'LeftArrow', action = act.AdjustPaneSize { 'Left', 5 } },
    { key = 'h', action = act.AdjustPaneSize { 'Left', 5 } },

    { key = 'RightArrow', action = act.AdjustPaneSize { 'Right', 5 } },
    { key = 'l', action = act.AdjustPaneSize { 'Right', 5 } },

    { key = 'UpArrow', action = act.AdjustPaneSize { 'Up', 5 } },
    { key = 'k', action = act.AdjustPaneSize { 'Up', 5 } },

    { key = 'DownArrow', action = act.AdjustPaneSize { 'Down', 5 } },
    { key = 'j', action = act.AdjustPaneSize { 'Down', 5 } },

    -- Cancel the mode by pressing escape
    { key = 'Escape', action = 'PopKeyTable' },
  },
  -- activate_pane = {
  --   { key = 'LeftArrow', action = act.ActivatePaneDirection 'Left' },
  --   { key = 'h', action = act.ActivatePaneDirection 'Left' },

  --   { key = 'RightArrow', action = act.ActivatePaneDirection 'Right' },
  --   { key = 'l', action = act.ActivatePaneDirection 'Right' },

  --   { key = 'UpArrow', action = act.ActivatePaneDirection 'Up' },
  --   { key = 'k', action = act.ActivatePaneDirection 'Up' },

  --   { key = 'DownArrow', action = act.ActivatePaneDirection 'Down' },
  --   { key = 'j', action = act.ActivatePaneDirection 'Down' },
  -- },
}
config.bypass_mouse_reporting_modifiers = 'ALT'
-- config.bypass_mouse_reporting_modifiers = 'SHIFT'

-- making window titles more distinct
wezterm.on('format-window-title', function()
  local title = 'kaidev0711'
  return title
end)

-- config.mouse_bindings = {
--  	{
--     event = { Up = { streak = 1, button = 'Left' } },
--     mods = 'CTRL',
--     action = act.OpenLinkAtMouseCursor,
--   },
-- }
return config
