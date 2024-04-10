local wezterm = require "wezterm"
local act = wezterm.action

-- https://wezfurlong.org/wezterm/config/default-keys.html?h=default

return {
  -- Send Ctrl + s
  { key = "s",          mods = "CMD",        action = act.SendString("\x13") }, -- C-s
  -- Try to use menu shortcut
  { key = "|",          mods = "CTRL|SHIFT", action = wezterm.action.DisableDefaultAssignment },

  { key = "p",          mods = "CMD|SHIFT",  action = act.ActivateCommandPalette },
  { key = "{",          mods = "CMD|SHIFT",  action = act.MoveTabRelative(-1) },
  { key = "}",          mods = "CMD|SHIFT",  action = act.MoveTabRelative(1) },
  { key = "LeftArrow",  mods = "SHIFT|CMD",  action = act { ActivateTabRelative = -1 } },
  { key = "RightArrow", mods = "SHIFT|CMD",  action = act { ActivateTabRelative = 1 } },
  { key = "UpArrow",    mods = "ALT|CMD",    action = act.ActivatePaneDirection "Up" },
  { key = "DownArrow",  mods = "ALT|CMD",    action = act.ActivatePaneDirection "Down" },
  { key = "LeftArrow",  mods = "ALT|CMD",    action = act.ActivatePaneDirection "Left" },
  { key = "RightArrow", mods = "ALT|CMD",    action = act.ActivatePaneDirection "Right" },

  { key = "l",          mods = "ALT",        action = act.ShowLauncher },
  { key = "9",          mods = "ALT",        action = act.ShowLauncherArgs { flags = "FUZZY|TABS" } },
  { key = "0",          mods = "ALT",        action = act.ShowLauncherArgs { flags = "FUZZY|WORKSPACES" } },
  { key = "w",          mods = "CMD",        action = act.CloseCurrentPane { confirm = true } },
  { key = "q",          mods = "CMD",        action = act.QuitApplication },
  { key = "f",          mods = "CTRL|CMD",   action = act.ToggleFullScreen },
  { key = "z",          mods = "CTRL|SHIFT", action = act.TogglePaneZoomState },

  { key = "b",          mods = "ALT",        action = act.RotatePanes("CounterClockwise") },
  { key = "0",          mods = "CMD|SHIFT",  action = act.PaneSelect { alphabet = "1234567890" } },
  { key = "-",          mods = "CMD|SHIFT",  action = act.SplitVertical { domain = "CurrentPaneDomain" } },
  { key = "|",          mods = "CMD|SHIFT",  action = act.SplitHorizontal { domain = "CurrentPaneDomain" } },

  { key = "UpArrow",    mods = "SHIFT",      action = act.ScrollByLine(-1) },
  { key = "DownArrow",  mods = "SHIFT",      action = act.ScrollByLine(1) },
  { key = "PageUp",     mods = "SHIFT",      action = act.ScrollByPage(-1) },
  { key = "PageDown",   mods = "SHIFT",      action = act.ScrollByPage(1) },
  {
    key = "K",
    mods = "CTRL|SHIFT",
    action = act.Multiple {
      act.ClearScrollback "ScrollbackAndViewport",
      act.SendKey { key = "L", mods = "CTRL" },
    },
  },
  {
    key = "U",
    mods = "SHIFT|CTRL",
    action = wezterm.action.CharSelect {
      copy_on_select = true,
      copy_to = "ClipboardAndPrimarySelection",
    },
  },
  {
    key = "W",
    mods = "CTRL|SHIFT",
    action = act.PromptInputLine {
      description = wezterm.format {
        { Attribute = { Intensity = "Bold" } },
        { Foreground = { Color = "#A9DD4E" } },
        { Text = "Enter name for new workspace" },
      },
      action = wezterm.action_callback(function(window, pane, line)
        if line then
          window:perform_action(
            act.SwitchToWorkspace { name = line },
            pane
          )
        end
      end),
    },
  },

  { key = "r",          mods = "CMD",        action = act.ReloadConfiguration },
  { key = "m",          mods = "CMD",        action = act.Hide },
  { key = "h",          mods = "CMD",        action = act.HideApplication },
  { key = "c",          mods = "CMD",        action = act.CopyTo "Clipboard" },
  { key = "v",          mods = "CMD",        action = act.PasteFrom "Clipboard" },
  { key = "t",          mods = "CMD",        action = act.SpawnCommandInNewTab { cwd = "~" }, },
  { key = "n",          mods = "CMD",        action = act.SpawnCommandInNewTab { cwd = "~" } },
  { key = "n",          mods = "CMD|SHIFT",  action = act.SpawnCommandInNewWindow { cwd = "~" } },
  { key = "f",          mods = "CTRL|SHIFT", action = act { Search = { CaseSensitiveString = "" } } },

  -- { key = "LeftArrow",  mods = "CMD",        action = act.SendString "\x01" },
  -- { key = "RightArrow", mods = "CMD",        action = act.SendString "\x05" },
  -- { key = "LeftArrow",  mods = "ALT",        action = act.SendString "\x1bb" },
  -- { key = "RightArrow", mods = "ALT",        action = act.SendString "\x1bf" },

  { key = "LeftArrow",  mods = "CTRL|SHIFT", action = "DisableDefaultAssignment" },
  { key = "RightArrow", mods = "CTRL|SHIFT", action = "DisableDefaultAssignment" },

  { key = "1",          mods = "CMD",        action = act { ActivateTab = 0 } },
  { key = "2",          mods = "CMD",        action = act { ActivateTab = 1 } },
  { key = "3",          mods = "CMD",        action = act { ActivateTab = 2 } },
  { key = "4",          mods = "CMD",        action = act { ActivateTab = 3 } },
  { key = "5",          mods = "CMD",        action = act { ActivateTab = 4 } },
  { key = "6",          mods = "CMD",        action = act { ActivateTab = 5 } },
  { key = "7",          mods = "CMD",        action = act { ActivateTab = 6 } },
  { key = "8",          mods = "CMD",        action = act { ActivateTab = 7 } },
  { key = "9",          mods = "CMD",        action = act { ActivateTab = -1 } },

  { key = "0",          mods = "CMD",        action = act.ResetFontSize },
  { key = "=",          mods = "CMD",        action = act.IncreaseFontSize },
  { key = "-",          mods = "CMD",        action = act.DecreaseFontSize },
}
