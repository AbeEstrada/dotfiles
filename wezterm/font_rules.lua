local wezterm = require "wezterm"

return {
  {
    intensity = "Bold",
    italic = true,
    font = wezterm.font_with_fallback({
      { family = "Inconsolata", weight = "Bold" },
      { family = "Symbols Nerd Font", weight = "Regular", scale = 0.9 },
      { family = "Apple Color Emoji", scale = 2 },
    }),
  },
  {
    intensity = "Bold",
    italic = false,
    font = wezterm.font_with_fallback({
      { family = "Inconsolata", weight = "Bold" },
      { family = "Symbols Nerd Font", weight = "Regular", scale = 0.9 },
      { family = "Apple Color Emoji", scale = 2 },
    }),
  },
  {
    intensity = "Half",
    italic = true,
    font = wezterm.font_with_fallback({
      { family = "Inconsolata", weight = "Medium" },
      { family = "Symbols Nerd Font", weight = "Regular", scale = 0.9 },
      { family = "Apple Color Emoji", scale = 2 },
    }),
  },
  {
    intensity = "Half",
    italic = false,
    font = wezterm.font_with_fallback({
      { family = "Inconsolata", weight = "Medium" },
      { family = "Symbols Nerd Font", weight = "Regular", scale = 0.9 },
      { family = "Apple Color Emoji", scale = 2 },
    }),
  },
}
