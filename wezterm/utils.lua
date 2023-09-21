-- https://github.com/yutkat/dotfiles/blob/main/.config/wezterm/utils.lua
-- https://gist.github.com/kgriffs/124aae3ac80eefe57199451b823c24ec

local wezterm = require "wezterm"
local nerdfonts = wezterm.nerdfonts

local M = {}

local HOME = os.getenv("HOME")

local process_icons = {
  ["aria2c"] = nerdfonts.md_cloud_download_outline,
  ["bash"] = nerdfonts.md_bash,
  ["brew"]  = nerdfonts.md_glass_mug_variant,
  ["btm"]  = nerdfonts.cod_graph_line,
  ["bubc"]  = nerdfonts.md_glass_mug_variant,
  ["bubo"]  = nerdfonts.md_glass_mug_variant,
  ["curl"] = nerdfonts.md_cloud_download_outline,
  ["git"]  = nerdfonts.dev_git,
  ["go"]  = nerdfonts.seti_go,
  ["hugo"]  = nerdfonts.md_hexagon,
  ["man"] = nerdfonts.fae_book_open_o,
  ["newsboat"] = nerdfonts.fa_newspaper_o,
  ["node"] = nerdfonts.md_nodejs,
  ["nvim"] = nerdfonts.custom_vim,
  ["python"] = nerdfonts.fae_python,
  ["ruby"] = nerdfonts.fae_ruby_o,
  ["sftp"] = nerdfonts.md_folder_network_outline,
  ["ssh"] = nerdfonts.md_folder_key_network,
  ["ticker"] = nerdfonts.md_finance,
  ["toot"] = nerdfonts.md_mastodon,
  ["vim"] = nerdfonts.dev_vim,
  ["zsh"] = nerdfonts.fa_folder_open_o,
}

function M.basename(str)
	str = string.gsub(str, "(.*[/\\])(.*)", "%2")
  str = string.gsub(str, "%s+", "") -- trim
  return str
end

function M.convert_useful_path(dir)
  if string.find(dir, HOME) then
    local cwd = dir
    cwd = string.gsub(cwd, "^file://(.*).local", "") -- remove hostname
    cwd = string.gsub(cwd, HOME, "~")
    local folders = {}
    for token in cwd:gmatch("[^/%s]+") do -- split folders
      folders[#folders + 1] = token
    end
    if (#folders > 3) then -- truncate
      return string.format("…/%s", table.concat(folders, "\n", #folders))
    end
    return cwd
  end
	return M.basename(dir)
end

function M.create_tab_title(tab, tabs, panes, config, hover, max_width)
  local pane = tab.active_pane
  local index = tab.tab_index + 1

  local user_title = pane.user_vars.panetitle
  if user_title ~= nil and #user_title > 0 then
    return wezterm.format({
      { Text = string.format(" %s: %s ", index, user_title) },
    })
  end

  local process = M.basename(pane.foreground_process_name)
  if process == "zsh" then -- "no process"
    local dir = M.convert_useful_path(pane.current_working_dir)
    return wezterm.format({
      { Text = string.format(" %s: %s  %s ", index, process_icons[process], dir) },
    })
  end

  if process_icons[pane.title] ~= nil then -- add icon
    return wezterm.format({
      { Text = string.format(" %s: %s %s ", index, process_icons[pane.title], pane.title) },
    })
  end

  return wezterm.format({
    { Text = string.format(" %s: %s ", index, pane.title) },
  })
end

return M
