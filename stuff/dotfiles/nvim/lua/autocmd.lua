local autocmd = {}

function autocmd.setup()
	vim.cmd([[
    augroup options
      autocmd!
      autocmd TermOpen * setlocal nonumber norelativenumber
    augroup end
  ]])

	vim.cmd([[
    augroup YankHighlight
      autocmd!
      autocmd TextYankPost * silent! lua vim.highlight.on_yank({ timeout = 500, on_visual = true })
    augroup end
  ]])

	vim.cmd([[
    augroup fmt
      autocmd!
      autocmd BufWritePre * Neoformat
    augroup END
  ]])
end

return autocmd
