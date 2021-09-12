vim.cmd([[
  autocmd BufRead,BufNewFile .prettierrc,.babelrc,.releaserc set filetype=json
  autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc
]])
