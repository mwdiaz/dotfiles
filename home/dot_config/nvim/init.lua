vim.opt.syntax = 'on'
vim.opt.ruler = true

local function format_git_commit()
  vim.opt_local.spell = true
  vim.opt_local.expandtab = true
  vim.opt_local.shiftwidth = 4
  vim.opt_local.tabstop = 4
  vim.opt_local.textwidth = 72
  vim.opt_local.colorcolumn = '+1'

  local function strip_trailing_whitespace()
    local l = vim.fn.line('.')
    local c = vim.fn.col('.')
    vim.cmd('%s/\\s\\+$//e')
    vim.fn.cursor(l, c)
  end

  vim.api.nvim_create_autocmd('BufWritePre', {
    buffer = 0,
    callback = strip_trailing_whitespace
  })
end

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'gitcommit',
  callback = format_git_commit
})
