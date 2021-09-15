vim.cmd([[
  autocmd BufRead,BufNewFile .prettierrc,.babelrc,.eslintrc,.releaserc set filetype=json
  autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc
]])
