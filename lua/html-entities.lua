local htmlEntities = require('html-entities.htmlEntities')

local he = {}

local defaults = {}

he.options = defaults

-- The :HtmlEncode and :HtmlDecode commands are registered automatically on
-- startup (see plugin/html-entities.lua), so calling setup() is optional.
-- It only needs to be called to override configuration, once options exist.
function he.setup(opts) he.options = vim.tbl_deep_extend('force', defaults, opts or {}) end

function he.encode()
  local bufIndex = vim.api.nvim_get_current_buf()
  local buf = vim.api.nvim_buf_get_lines(bufIndex, 0, -1, false)

  local encodedBuf = {}
  local eob = 0
  for n, line in pairs(buf) do
    --encode
    if line ~= nil and line ~= '' and line ~= '\n' then
      local encodedLine = htmlEntities.encode(line)
      encodedBuf[n] = encodedLine
    else
      encodedBuf[n] = ''
    end
    eob = n
  end
  --update the buffer
  vim.api.nvim_buf_set_lines(bufIndex, 0, eob, false, encodedBuf)
end

function he.decode()
  local bufIndex = vim.api.nvim_get_current_buf()
  local buf = vim.api.nvim_buf_get_lines(bufIndex, 0, -1, false)

  local decodedBuf = {}
  local eob = 0
  for n, line in pairs(buf) do
    --decode
    if line ~= nil and line ~= '' and line ~= '\n' then
      local decodedLine = htmlEntities.decode(line)
      decodedBuf[n] = decodedLine
    else
      decodedBuf[n] = ''
    end
    eob = n
  end
  --update the buffer
  vim.api.nvim_buf_set_lines(bufIndex, 0, eob, false, decodedBuf)
end

return he
