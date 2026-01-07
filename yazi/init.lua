-- https://yazi-rs.github.io/docs/configuration/yazi#manager.linemode
function Linemode:size_and_mtime()
  local mtime = math.floor(self._file.cha.mtime or 0)
  local time
  if mtime == 0 then
    time = ""
  elseif os.date("%Y", mtime) == os.date("%Y") then
    time = os.date("%b %d %H:%M", mtime)
  else
    time = os.date("%b %d  %Y", mtime)
  end
  local file_size = self._file:size()
  local size = "-"
  if file_size then
    size = ya.readable_size and ya.readable_size(file_size) or tostring(file_size)
  end

  return string.format("%s %s", size, time)
end

-- https://yazi-rs.github.io/docs/tips#symlink-in-status
Status:children_add(function(self)
  local h = self._current.hovered
  if h and h.link_to then
    return " -> " .. tostring(h.link_to)
  else
    return ""
  end
end, 3300, Status.LEFT)
