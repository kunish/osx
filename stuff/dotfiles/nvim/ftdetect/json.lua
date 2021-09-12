vim.cmd([[
  augroup json
    autocmd BufRead,BufNewFile .prettierrc,.babelrc,.releaserc setfiletype json
  augroup end
]])
