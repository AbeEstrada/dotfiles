local wezterm = require "wezterm"
local utils = require "utils"
local keys = require "keys"
local font_rules = require "font_rules"

-- https://github.com/KevinSilvester/wezterm-config
-- https://github.com/yutkat/dotfiles
-- https://github.com/marcusramberg/dotfiles/blob/main/link/config/wezterm/pomodoro.lua

wezterm.on("format-tab-title",
  function(tab, tabs, panes, config, hover, max_width)
    local title = utils.create_tab_title(tab, tabs, panes, config, hover, max_width)
    return {
      { Text = title },
    }
  end
)

wezterm.on("window-config-reloaded",
  function(window, pane)
    window:toast_notification("wezterm", "configuration reloaded!", nil, 3000)
  end
)

return {
  -- term = "wezterm",
  default_cwd = os.getenv("HOME"),
  front_end = "WebGpu",
  color_scheme = "Abe",
  font = wezterm.font_with_fallback{
    { family = "Inconsolata", weight = "Regular" },
    { family = "Symbols Nerd Font", weight = "Light", scale = 0.9 },
    { family = "Apple Color Emoji" },
  },
  font_rules = font_rules,
  font_size = 16.0,
  initial_cols = 170,
  initial_rows = 40,
  cursor_thickness = 1.5,
  default_cursor_style = "BlinkingBar",
  bold_brightens_ansi_colors = true,
  window_background_opacity = 0.95,
  macos_window_background_blur = 5,
  native_macos_fullscreen_mode = true,
  tab_max_width = 48,
  use_fancy_tab_bar = false,
  show_new_tab_button_in_tab_bar = false,
  quit_when_all_windows_are_closed = false,
  switch_to_last_active_tab_when_closing_tab = true,
  adjust_window_size_when_changing_font_size = false,
  window_padding = {
    top = "0.25cell",
    bottom = "0.25cell",
    right = "0.5cell",
    left = "0.5cell",
  },
  inactive_pane_hsb = {
    saturation = 0.75,
    brightness = 0.75,
  },
  debug_key_events = false,
  disable_default_key_bindings = true,
  keys = keys,
}
