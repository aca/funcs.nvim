local M = {}
local vim = vim

function M.yankpath()
    local fp = vim.call("expand", "%:p")
    fp = fp:gsub(vim.call("expand", "~"), "~")

    local curpos = vim.fn.getcurpos()

    print(fp .. ":" .. curpos[2])
    if fp == "" then
        return
    end

    if vim.call("executable", "pbcopy") then
        vim.call("system", "pbcopy", fp .. ":" .. curpos[2])
    else
        error("pbcopy not found")
    end
end

function M.remove_file()
    local f = vim.fn.expand("%")
    print("rm", f)
    os.remove(f)
    vim.api.nvim_exec('bd!', true)
end

function M.rename(newname)
  vim.api.nvim_exec('write', true)
  print(newname)
  local f = vim.fn.expand("%")
  os.rename(f, newname)
  vim.api.nvim_exec('bd!', true)
  vim.api.nvim_exec('e ' .. newname, true)
end

function M.open_nextfile()
  local cwd = vim.fn.expand('%:p:h')
  local lst = vim.fn.systemlist("cd " .. cwd .. ' && find . -maxdepth 1 -not -type d | sort | sed -e "s/^.\\///" ')
  local index={}
  for k,v in pairs(lst) do
     index[v]=k
  end

  local cur_idx = index[vim.fn.expand("%:t")]
  if cur_idx == nil then
    -- file not saved
    vim.api.nvim_exec('e ' .. cwd .. '/' .. lst[#lst], true)
    return
  end
  if lst[cur_idx+1] == nil then
    print("open_nextfile: reached end")
    return
  end
  vim.api.nvim_exec('e ' .. cwd .. '/' .. lst[cur_idx+1], true)
end

function M.open_prevfile()
  local cwd = vim.fn.expand('%:p:h')
  local lst = vim.fn.systemlist("cd " .. cwd .. ' && find . -maxdepth 1 -not -type d | sort | sed -e "s/^.\\///" ')
  local index={}
  for k,v in pairs(lst) do
     index[v]=k
  end

  local cur_idx = index[vim.fn.expand("%:t")]
  if cur_idx == nil then
    -- file not saved
    vim.api.nvim_exec('e ' .. cwd .. '/' .. lst[#lst], true)
    return
  end
  if lst[cur_idx-1] == nil then
    print("open_prevfile: reached end")
    return
  end
  vim.api.nvim_exec('e ' .. cwd .. '/' .. lst[cur_idx-1], true)
end

return M
