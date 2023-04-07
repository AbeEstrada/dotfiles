-- https://github.com/yutkat/dotfiles/blob/main/.config/wezterm/utils.lua
local wezterm = require "wezterm"

local M = {}

local SOLID_FOLDER_OPEN = utf8.char(0xf0770)

function M.basename(s)
	return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

function M.convert_home_dir(path)
	local cwd = path
	local home = os.getenv("HOME")
	cwd = cwd:gsub("^" .. home .. "/", "~/")
	if cwd == "" then
		return path
	end
	return cwd
end

function M.convert_useful_path(dir)
	local cwd = M.convert_home_dir(dir)
	return M.basename(cwd)
end

function M.create_tab_title(tab, tabs, panes, config, hover, max_width)
  local index = tab.tab_index + 1

  local user_title = tab.active_pane.user_vars.panetitle
  if user_title ~= nil and #user_title > 0 then
    return "  " .. index .. ": " .. user_title .. "  "
  end

  local title = wezterm.truncate_right(M.basename(tab.active_pane.foreground_process_name), max_width)
  if title == "zsh" then
    local dir = string.gsub(tab.active_pane.title, "(.*[: ])(.*)]", "%2")
    dir = M.convert_useful_path(dir)
    title = SOLID_FOLDER_OPEN .. " " .. wezterm.truncate_left(dir, max_width)
  end

  return "  " .. index .. ": " .. title .. "  "
end

return M
