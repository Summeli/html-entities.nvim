local htmlEntities = require("html-entities.htmlEntities")

local he = {}

-- This function is supposed to be called explicitly by users to configure this
-- plugin
function he.setup()
   -- avoid setting global values outside of this function. Global state
   -- mutations are hard to debug and test, so having them in a single
   -- function/module makes it easier to reason about all possible changes
   -- he.options = with_defaults(options)

   -- do here any startup your plugin needs, like creating commands and
   -- mappings that depend on values passed in options
   vim.api.nvim_create_user_command("HtmlEncode", he.encode, {})
   vim.api.nvim_create_user_command("HtmlDecode", he.decode, {})
end

function he.encode()
   local buf = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  
   local encodedBuf = {}
   local eob = 0;
   for n,line in pairs(buf) do 
      --encode
     if (line ~= nil and line ~= '' and line ~='\n') then
	local encodedLine = htmlEntities.encode(line)
	encodedBuf[n] = encodedLine
      else
         encodedBuf[n] = ''
      end
      eob = n
   end
   --update the buffer
   vim.api.nvim_buf_set_lines(0, 0, eob, false, encodedBuf)
end

function he.decode()
   local buf = vim.api.nvim_buf_get_lines(0, 0, -1, false)

   local decodedBuf = {}
   local eob = 0;
   for n,line in pairs(buf) do
      --decode
     if (line ~= nil and line ~= '' and line ~='\n') then
        local decodedLine = htmlEntities.decode(line)
        decodedBuf[n] = decodedLine
      else
         decodedBuf[n] = ''
      end
      eob = n
   end
   --update the buffer
   vim.api.nvim_buf_set_lines(0, 0, eob, false, decodedBuf)
end

he.options = nil

return he
