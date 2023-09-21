local wezterm = require "wezterm"

-- wezterm.font("Inconsolata", { weight="Black" })
-- wezterm.font("Inconsolata", { weight="ExtraBold" })
-- wezterm.font("Inconsolata", { weight="Bold" })
-- wezterm.font("Inconsolata", { weight="DemiBold" })
-- wezterm.font("Inconsolata", { weight="Medium" })
-- wezterm.font("Inconsolata", { weight="Regular" })
-- wezterm.font("Inconsolata", { weight="Light" })
-- wezterm.font("Inconsolata", { weight=275 })

return {
  {
    intensity = "Bold",
    italic = true,
    font = wezterm.font_with_fallback({
      { family = "Inconsolata", weight = "Bold" },
      { family = "Symbols Nerd Font Mono", weight = "Regular", scale = 0.9 },
      { family = "Apple Color Emoji", scale = 2 },
    }),
  },
  {
    intensity = "Bold",
    italic = false,
    font = wezterm.font_with_fallback({
      { family = "Inconsolata", weight = "Bold" },
      { family = "Symbols Nerd Font Mono", weight = "Regular", scale = 0.9 },
      { family = "Apple Color Emoji", scale = 2 },
    }),
  },
  {
    intensity = "Half",
    italic = true,
    font = wezterm.font_with_fallback({
      { family = "Inconsolata", weight = "Regular" },
      { family = "Symbols Nerd Font Mono", weight = "Regular", scale = 0.9 },
      { family = "Apple Color Emoji", scale = 2 },
    }),
  },
  {
    intensity = "Half",
    italic = false,
    font = wezterm.font_with_fallback({
      { family = "Inconsolata", weight = "Regular" },
      { family = "Symbols Nerd Font Mono", weight = "Regular", scale = 0.9 },
      { family = "Apple Color Emoji", scale = 2 },
    }),
  },
}
