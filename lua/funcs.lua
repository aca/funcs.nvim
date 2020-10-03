local M={}
local vim = vim

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

function M.remove_file()
  local f =  vim.fn.expand("%")
  print("rm", f)
  os.remove(f)
end

return M
