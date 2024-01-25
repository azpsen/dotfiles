-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
config.enable_scroll_bar=true
config.use_fancy_tab_bar=true
config.hide_tab_bar_if_only_one_tab=true

config.initial_cols=120
config.initial_rows=35

config.colors = {
  scrollbar_thumb = '#666666',
}

config.window_background_opacity = 0.95

config.warn_about_missing_glyphs=false

-- For example, changing the color scheme:
-- config.color_scheme = 'Catppuccin Mocha'
config.color_scheme = "Gigavolt (base16)"

config.font = wezterm.font 'JetBrains Mono'

-- and finally, return the configuration to wezterm
return config
