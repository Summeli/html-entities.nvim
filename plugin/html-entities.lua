if vim.g.loaded_html_entities then return end
vim.g.loaded_html_entities = true

vim.api.nvim_create_user_command(
  'HtmlEncode',
  function() require('html-entities').encode() end,
  { desc = 'HTML-encode the current buffer' }
)

vim.api.nvim_create_user_command(
  'HtmlDecode',
  function() require('html-entities').decode() end,
  { desc = 'HTML-decode the current buffer' }
)
