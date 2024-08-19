local wezterm = require "wezterm"
local utils = require "utils"
local keys = require "keys"
local font_rules = require "font_rules"
local launch_menu = require "launch_menu"
local custom_colors = require "custom_colors"

-- https://github.com/yutkat/dotfiles
-- https://github.com/KevinSilvester/wezterm-config
-- https://github.com/willothy/dotfiles/blob/main/.config/wezterm/wezterm.lua
-- https://github.com/marcusramberg/dotfiles/blob/main/link/config/wezterm/pomodoro.lua
-- https://github.com/protiumx/.dotfiles/blob/main/stow/wezterm/.config/wezterm/wezterm.lua

local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
  mux.spawn_window(cmd or
    {
      cwd = os.getenv("HOME"),
      position = { x = 1024, y = 512 },
    }
  )
  mux.set_active_workspace "default"
end)

wezterm.on("format-tab-title",
  function(tab, tabs, panes, config, hover, max_width)
    local title = utils.create_tab_title(tab, tabs, panes, config, hover, max_width)
    return { { Text = title } }
  end
)

wezterm.on("update-status",
  function(window)
    window:set_right_status(wezterm.format {
      { Attribute = { Italic = true } },
      { Foreground = { Color = "#a6e3a1" } }, -- green
      { Text = window:active_workspace() },
    })
  end
)

wezterm.on("window-config-reloaded",
  function(window)
    window:toast_notification("wezterm", "configuration reloaded!", nil, 3000)
  end
)

local config = {
  default_cwd = os.getenv("HOME"),
  default_workspace = "default",
  enable_kitty_graphics = true,
  font = wezterm.font_with_fallback {
    { family = "Inconsolata",            weight = "Regular" },
    { family = "Symbols Nerd Font Mono", weight = "Regular", scale = 0.75 },
    { family = "Apple Color Emoji" },
  },
  font_rules = font_rules,
  font_size = 15.0,
  initial_cols = 180,
  initial_rows = 45,
  max_fps = 120,
  front_end = "WebGpu",
  cursor_thickness = 1.5,
  default_cursor_style = "BlinkingBar",
  scrollback_lines = 7000,
  enable_scroll_bar = true,
  pane_focus_follows_mouse = true,
  bold_brightens_ansi_colors = true,
  window_background_opacity = 0.98,
  macos_window_background_blur = 8,
  native_macos_fullscreen_mode = true,
  show_new_tab_button_in_tab_bar = true,
  quit_when_all_windows_are_closed = false,
  switch_to_last_active_tab_when_closing_tab = true,
  adjust_window_size_when_changing_font_size = false,
  send_composed_key_when_left_alt_is_pressed = true,
  send_composed_key_when_right_alt_is_pressed = false,
  window_padding = {
    top = "0.1cell",
    bottom = "0.25cell",
    right = "0.25cell",
    left = "0.25cell",
  },
  inactive_pane_hsb = {
    saturation = 0.95,
    brightness = 0.5,
  },
  tab_max_width = 48,
  enable_tab_bar = true,
  use_fancy_tab_bar = false,
  debug_key_events = false,
  disable_default_key_bindings = true,
  launch_menu = launch_menu,
  keys = keys,
}

-- for k, v in pairs(custom_colors) do config[k] = v end
-- config.color_scheme = "Eldritch"
config.color_scheme = "Abenazzy"

return config
