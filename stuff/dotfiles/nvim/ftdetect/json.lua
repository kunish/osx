vim.cmd([[
  augroup json
    autocmd BufRead,BufNewFile .prettierrc,.babelrc,.releaserc set filetype=json
    autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc
  augroup end
]])
