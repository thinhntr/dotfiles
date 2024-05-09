local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- config.font = wezterm.font("SF Mono")
config.font_size = 17

config.color_scheme = "rose-pine-moon"
config.enable_tab_bar = false

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

return config
