local htmlEntities = require("html-entities.htmlEntities")

print("kissa")

local he = {}

local function with_defaults(options)
   return {
      name = options.name or "John Doe"
   }
end

-- This function is supposed to be called explicitly by users to configure this
-- plugin
function he.setup(options)
   -- avoid setting global values outside of this function. Global state
   -- mutations are hard to debug and test, so having them in a single
   -- function/module makes it easier to reason about all possible changes
   he.options = with_defaults(options)

   -- do here any startup your plugin needs, like creating commands and
   -- mappings that depend on values passed in options
   vim.api.nvim_create_user_command("HtmlEncode", he.encode, {})
   vim.api.nvim_create_user_command("HtmlDecode", he.decode, {})
end

function he.encode()
   print("koira")
end

function he.decode()
   print("papukaija")
end

he.options = nil

return he
