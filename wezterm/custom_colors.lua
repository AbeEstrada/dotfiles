local wezterm = require("wezterm")

-- local custom = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]
local custom = wezterm.color.get_builtin_schemes()["Snazzy (base16)"]
custom.background = "#191B26"
custom.tab_bar = {
  background = "#191B26",
}
custom.tab_bar.active_tab = {
  fg_color = "#BD93F9",
  bg_color = "#191B26",
  intensity = "Bold",
}
custom.tab_bar.inactive_tab = {
  fg_color = "#686868",
  bg_color = "#191B26",
}
custom.tab_bar.inactive_tab_hover = {
  fg_color = "#EFF0EB",
  bg_color = "#191B26",
  italic = false,
}
custom.tab_bar.new_tab = {
  fg_color = "#EFF0EB",
  bg_color = "#191B26",
  intensity = "Bold",
}
custom.tab_bar.new_tab_hover = {
  fg_color = "#BD93F9",
  bg_color = "#191B26",
  italic = false,
  intensity = "Bold",
}

return {
  color_schemes = {
    ["AbeCustom"] = custom,
  },
  color_scheme = "Abenazzy",
  -- color_scheme = "AbeCustom",
}
