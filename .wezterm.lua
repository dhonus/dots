local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.colors = {
  selection_fg = 'none',
  selection_bg = 'rgba(50% 50% 50% 50%)',
  tab_bar = {
    active_tab = {
      bg_color = 'rgba(22,22,22)',
      fg_color = '#ffffff',
    }
  }
}

config.color_scheme = 'Chalk (dark) (terminal.sexy)'

config.window_background_opacity = 0.8
config.enable_wayland = false

return config

