local M = {}

function M:peek(job)
  local start, cache = os.clock(), ya.file_cache(job)
  if not cache then return end

  local ok, err = self:preload(job)
  if not ok or err then
    return ya.preview_widget(job, err)
  end

  -- Delay to prevent flickering during fast scrolling
  ya.sleep(math.max(0, 0.05 + start - os.clock()))

  local _, err = ya.image_show(cache, job.area)
  ya.preview_widget(job, err)
end

function M:seek(job)
  -- sips doesn't support easy page specific extraction like pdftoppm,
  -- so seek behavior is limited to simple peeks here.
  ya.emit("peek", { 0, only_if = job.file.url })
end

function M:preload(job)
  local cache = ya.file_cache(job)
  if not cache or fs.cha(cache) then
    return true
  end

  local output, err = Command("sips")
      :arg("-s"):arg("format"):arg("jpeg")
      :arg("-s"):arg("formatOptions"):arg("70")
      :arg(tostring(job.file.path))
      :arg("--out"):arg(tostring(cache))
      :output()

  if not output or not output.status.success then
    return false, Err("sips failed: %s", output and output.stderr or err)
  end

  return ya.image_precache(Url(cache), cache)
end

return M
