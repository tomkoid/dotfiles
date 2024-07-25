-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "Catppuccin Mocha"

config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.hide_mouse_cursor_when_typing = true

-- Set window padding
config.window_padding = {
	top = 0,
	left = 0,
	right = 0,
	bottom = 0,
}

-- Set window opacity
config.window_background_opacity = 0.85

config.xcursor_theme = "Adwaita"

-- Set default cursor (Beam)
config.default_cursor_style = "SteadyBar"

-- Set default shell
config.default_prog = { "zsh" }

config.font = wezterm.font_with_fallback({
	{ family = "JetBrains Mono Nerd Font", weight = "Regular" },
	{ family = "Font Awesome 6 Free", weight = "Black", stretch = "Normal", style = "Normal" },
	"Noto Serif",
})

config.font_size = 13.0

-- config.cell_width = 0.9
config.cell_width = 1.0

config.enable_wayland = false

-- config.front_end = "WebGpu"

-- config.window_decorations = "RESIZE"

-- Set mouse bindings
config.mouse_bindings = {
	-- Make Ctrl-Click open hyperlinks
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = act.OpenLinkAtMouseCursor,
		mouse_reporting = true, --- this fixes it from not working in tmux
	},
}

-- and finally, return the configuration to wezterm
return config
