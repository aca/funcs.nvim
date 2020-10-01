local M={}
local vim = vim

-- yankpath: copy current path to clipboard
function M.yankpath()
  local fp = vim.call('expand', '%:p')
  fp = fp:gsub(vim.call('expand', '~'), "~")

  local curpos = vim.fn.getcurpos()

  print(fp .. ":" .. curpos[2])
  if fp == "" then
    return
  end

  if vim.call("executable", "pbcopy") then
    vim.call("system", "pbcopy" , fp .. ":" .. curpos[2] )
  else
    error("pbcopy not found")
  end
end

return M

