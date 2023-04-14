local wezterm = require "wezterm"

-- https://wezfurlong.org/wezterm/config/default-keys.html?h=default

return {
  { key = "p", mods = "CMD|SHIFT", action = wezterm.action.ActivateCommandPalette },

  { key = "{", mods = "SHIFT|ALT", action = wezterm.action.MoveTabRelative(-1) },
  { key = "}", mods = "SHIFT|ALT", action = wezterm.action.MoveTabRelative(1) },

  { key = "b", mods = "ALT", action = wezterm.action.RotatePanes("CounterClockwise") },
  { key = "w", mods = "CMD", action = wezterm.action.CloseCurrentPane { confirm = true } },
  { key = "q", mods = "CMD", action = wezterm.action.QuitApplication },
  { key = "z", mods = "CTRL", action = wezterm.action.TogglePaneZoomState },
  { key = "0", mods = "CMD|SHIFT", action = wezterm.action.PaneSelect { alphabet = "1234567890" } },
  { key = "-", mods = "CMD|SHIFT", action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" } },
  { key = "|", mods = "CMD|SHIFT", action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" } },
  { key = "LeftArrow" , mods = "SHIFT|CMD",  action = wezterm.action{ ActivateTabRelative = -1 } },
  { key = "RightArrow", mods = "SHIFT|CMD",  action = wezterm.action{ ActivateTabRelative =  1 } },

  { key = "UpArrow",    mods = "SHIFT|CTRL", action = wezterm.action.ActivatePaneDirection "Up" },
  { key = "DownArrow",  mods = "SHIFT|CTRL", action = wezterm.action.ActivatePaneDirection "Down" },
  { key = "LeftArrow",  mods = "SHIFT|CTRL", action = wezterm.action.ActivatePaneDirection "Left" },
  { key = "RightArrow", mods = "SHIFT|CTRL", action = wezterm.action.ActivatePaneDirection "Right" },

  { key = "r", mods = "CMD", action = wezterm.action.ReloadConfiguration },
  { key = "f", mods = "CTRL|CMD", action = wezterm.action.ToggleFullScreen },
  { key = "m", mods = "CMD", action = wezterm.action.Hide },
  { key = "h", mods = "CMD", action = wezterm.action.HideApplication },
  { key = "c", mods = "CMD", action = wezterm.action.CopyTo "Clipboard" },
  { key = "v", mods = "CMD", action = wezterm.action.PasteFrom "Clipboard" },
  { key = "t", mods = "CMD", action = wezterm.action.SpawnCommandInNewTab { cwd = "~" }, },
  { key = "n", mods = "CMD", action = wezterm.action.SpawnCommandInNewTab { cwd = "~" } },
  { key = "n", mods = "CMD|SHIFT", action = wezterm.action.SpawnCommandInNewWindow { cwd = "~" } },
  { key = "f", mods = "CTRL|SHIFT", action = wezterm.action { Search = { CaseSensitiveString = "" } } },

  { key = "LeftArrow",  mods = "CMD", action = wezterm.action.SendString "\x01" },
  { key = "RightArrow", mods = "CMD", action = wezterm.action.SendString "\x05" },
  { key = "LeftArrow",  mods = "ALT", action = wezterm.action.SendString "\x1bb" },
  { key = "RightArrow", mods = "ALT", action = wezterm.action.SendString "\x1bf" },

  { key = "1", mods = "CMD", action = wezterm.action { ActivateTab = 0 } },
  { key = "2", mods = "CMD", action = wezterm.action { ActivateTab = 1 } },
  { key = "3", mods = "CMD", action = wezterm.action { ActivateTab = 2 } },
  { key = "4", mods = "CMD", action = wezterm.action { ActivateTab = 3 } },
  { key = "5", mods = "CMD", action = wezterm.action { ActivateTab = 4 } },
  { key = "6", mods = "CMD", action = wezterm.action { ActivateTab = 5 } },
  { key = "7", mods = "CMD", action = wezterm.action { ActivateTab = 6 } },
  { key = "8", mods = "CMD", action = wezterm.action { ActivateTab = 7 } },
  { key = "9", mods = "CMD", action = wezterm.action { ActivateTab = -1 } },

  { key = "0", mods = "CMD", action = wezterm.action.ResetFontSize },
  -- { key = "=", mods = "CMD", action = wezterm.action.IncreaseFontSize },
  -- { key = "-", mods = "CMD", action = wezterm.action.DecreaseFontSize },
}
