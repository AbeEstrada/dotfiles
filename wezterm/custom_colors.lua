local wezterm = require("wezterm")

-- local custom = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]
local custom = wezterm.color.get_builtin_schemes()["Snazzy (Gogh)"]
custom.background = "#181825"
custom.tab_bar = {
  background = "#181825",
}
custom.tab_bar.active_tab = {
  fg_color = "#FAF9F9",
  bg_color = "#AF5FFF",
  -- intensity = "Bold",
}
custom.tab_bar.inactive_tab = {
  fg_color = "#FAF9F9",
  bg_color = "#181825",
}
custom.tab_bar.inactive_tab_hover = {
  fg_color = "#AF5FFF",
  bg_color = "#FAF9F9",
  italic = false,
}
custom.tab_bar.new_tab = {
  fg_color = "#AF5FFF",
  bg_color = "#181825",
  intensity = "Bold",
}
custom.tab_bar.new_tab_hover = {
  fg_color = "#AF5FFF",
  bg_color = "#FAF9F9",
  italic = false,
  intensity = "Bold",
}

return {
  color_schemes = {
    ["AbeCustom"] = custom,
  },
  color_scheme = "Abenazzy",
}
