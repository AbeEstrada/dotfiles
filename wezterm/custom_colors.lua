local wezterm = require("wezterm")

-- local custom = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]
local custom = wezterm.color.get_builtin_schemes()["tokyonight_moon"]
custom.background = "#1e1e2e"
custom.tab_bar = {
  background = "#1e1e2e",
}
custom.tab_bar.active_tab = {
  fg_color = "#BD93F9",
  bg_color = "#1e1e2e",
  intensity = "Bold",
}
custom.tab_bar.inactive_tab = {
  fg_color = "#686868",
  bg_color = "#1e1e2e",
}
custom.tab_bar.inactive_tab_hover = {
  fg_color = "#EFF0EB",
  bg_color = "#1e1e2e",
  italic = false,
}
custom.tab_bar.new_tab = {
  fg_color = "#EFF0EB",
  bg_color = "#1e1e2e",
  intensity = "Bold",
}
custom.tab_bar.new_tab_hover = {
  fg_color = "#BD93F9",
  bg_color = "#1e1e2e",
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
