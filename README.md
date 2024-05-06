# html-entities.nvim
nvim html entities plugin. HTML encode / decode files with this plugin

This plugin is based on [htmlEntities-for-lua](https://github.com/TiagoDanin/htmlEntities-for-lua) by TiagoDanin: 

## Installation

```lua
-- packer.nvim
use {'Summeli/html-entities.nvim', config = function()
  require('html-entities').setup()
end}

-- lazy.nvim
{'Summeli/html-entities.nvim', config = true}
```


## How to use
to encode, use: 
```lua
HtmlEncode
```
and to decode
```lua
HtmlDecode
```
## Contributors

Contributions are welcome. If you have an idea for a feature you'd like to see added, submit a PR rquest
