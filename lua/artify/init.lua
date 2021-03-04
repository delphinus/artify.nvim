return function(str, type)
  local tbl = require'artify.definitions'[type]
  if tbl then
    local _
    str, _ = str:gsub('.', function(c) return tbl[c] or c end)
  else
    vim.api.nvim_echo(
      {{'[Artify] unknown type: '..type, 'WarningMsg'}},
      true,
      {}
    )
  end
  return str
end
