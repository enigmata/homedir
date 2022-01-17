P=function(expr)
  print(vim.inspect(expr))
  return expr
end

vim.cmd('com! -narg=1 P lua P(<args>)')
