vim.cmd([[
  autocmd BufNewFile,BufRead * if &filetype ==# '' | set filetype=null | endif
]])
