local wezterm = require "wezterm"
local utils = require "utils"
local keys = require "keys"

-- https://github.com/KevinSilvester/wezterm-config
-- https://github.com/yutkat/dotfiles
-- https://github.com/marcusramberg/dotfiles/blob/main/link/config/wezterm/pomodoro.lua

local SOLID_FOLDER_OPEN = utf8.char(0xf0770)

local function create_tab_title(tab, tabs, panes, config, hover, max_width)
  local index = tab.tab_index + 1

  local user_title = tab.active_pane.user_vars.panetitle
  if user_title ~= nil and #user_title > 0 then
    return "  " .. index .. ": " .. user_title .. "  "
  end

  local title = wezterm.truncate_right(utils.basename(tab.active_pane.foreground_process_name), max_width)
  if title == "zsh" then
    local dir = string.gsub(tab.active_pane.title, "(.*[: ])(.*)]", "%2")
    dir = utils.convert_useful_path(dir)
    title = SOLID_FOLDER_OPEN .. " " .. wezterm.truncate_left(dir, max_width)
  end

  return "  " .. index .. ": " .. title .. "  "
end

wezterm.on("format-tab-title",
  function(tab, tabs, panes, config, hover, max_width)
    local title = create_tab_title(tab, tabs, panes, config, hover, max_width)
    return {
      { Text = title },
    }
  end
)

wezterm.on("update-right-status",
  function(window, pane)
    -- local date = wezterm.strftime "%Y-%m-%d %H:%M:%S"
    window:set_right_status(wezterm.format {
      -- { Attribute = { Underline = "Single" } },
      -- { Attribute = { Italic = true } },
      -- { Text = "Hello " .. date .. " " },
      { Text = "☕️ " },
    })
  end
)

wezterm.on("window-config-reloaded",
  function(window, pane)
    window:toast_notification("wezterm", "configuration reloaded!", nil, 3000)
  end
)

return {
  default_cwd = "/Users/Abe",
  front_end = "WebGpu",
  color_scheme = "Abe",
  font = wezterm.font_with_fallback{
    { family = "Inconsolata", weight = "Medium" },
    { family = "Symbols Nerd Font", weight = "Light", scale = 0.9 },
  },
  font_size = 16.0,
  bold_brightens_ansi_colors = true,
  initial_cols = 160,
  initial_rows = 39,
  cursor_thickness = 1.5,
  default_cursor_style = "BlinkingBar",
  window_background_opacity = 0.95,
  macos_window_background_blur = 6,
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
  mouse_bindings = {
    { -- DO NOT OPEN HYPERLINKS ON CLICK
      event = { Up = { streak = 1, button = "Left" } },
      mods = "NONE",
      action = wezterm.action.CompleteSelection("PrimarySelection"),
    },
    { -- OPEN HYPERLINKS ON CMD + CLICK
      event = { Up = { streak = 1, button = "Left" } },
      mods = "CMD",
      action = wezterm.action.OpenLinkAtMouseCursor,
    },
  }
}
