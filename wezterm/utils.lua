-- https://github.com/yutkat/dotfiles/blob/main/.config/wezterm/utils.lua
-- https://gist.github.com/kgriffs/124aae3ac80eefe57199451b823c24ec

local wezterm = require "wezterm"
local nerdfonts = wezterm.nerdfonts

local M = {}

local HOME = os.getenv("HOME")

local OUTLINE_FOLDER_OPEN = nerdfonts.fa_folder_open_o

local process_icons = {
  ["btm"]  = nerdfonts.md_chart_donut_variant,
  ["curl"] = nerdfonts.md_arrow_down_box,
  ["git"]  = nerdfonts.dev_git,
  ["newsboat"] = nerdfonts.fa_newspaper_o,
  ["node"] = nerdfonts.md_nodejs,
  ["sftp"] = nerdfonts.md_console_network,
}

function M.basename(s)
  return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

function M.convert_useful_path(dir)
  if string.find(dir, HOME) then
    local cwd = dir
    cwd = string.gsub(cwd, "^file://(.*).local", "") -- remove hostname
    cwd = string.gsub(cwd, HOME, "~")
    local folders = {}
    for token in cwd:gmatch("[^/%s]+") do -- split
      folders[#folders + 1] = token
    end
    if (#folders > 3) then -- truncate
      return string.format("…/%s", table.concat(folders, '\n', #folders))
    end
    return cwd
  end
  return M.basename(dir)
end

function M.create_tab_title(tab, tabs, panes, config, hover, max_width)
  local index = tab.tab_index + 1

  local user_title = tab.active_pane.user_vars.panetitle
  if user_title ~= nil and #user_title > 0 then
    return wezterm.format({
      { Text = string.format(" %s: %s ", index, user_title) },
    })
  end

  local title = M.basename(tab.active_pane.foreground_process_name)
  if title == "zsh" then -- no process
    local dir = M.convert_useful_path(tab.active_pane.current_working_dir)
    title = string.format("%s  %s", OUTLINE_FOLDER_OPEN , dir)
  end

  if process_icons[title] ~= nil then -- add icon
    return wezterm.format({
      { Text = string.format(" %s: %s %s ", index, process_icons[title], title) },
    })
  end

  return wezterm.format({
    { Text = string.format(" %s: %s ", index, title) },
  })
end

return M
