# html-entities.nvim
nvim html entities plugin. HTML encode / decode files with this plugin

This plugin is based on [htmlEntities-for-lua](https://github.com/TiagoDanin/htmlEntities-for-lua) by TiagoDanin: 

# Status

This plugin is under active development, the HtmlEncode and Decode should work. Contributions are accepted, if you have more ideas how to do this. 

# Requirements

- `nvim 0.9+`

# Installation

The `:HtmlEncode` and `:HtmlDecode` commands are registered automatically on
startup, no `setup()` call is required.

```lua
-- lazy.nvim
{
  'Summeli/html-entities.nvim',
  cmd = { 'HtmlEncode', 'HtmlDecode' }, -- lazy-load on first use
}

-- packer.nvim
use { 'Summeli/html-entities.nvim' }
```

# How to use

Run one of the commands against the current buffer:

```vim
:HtmlEncode
:HtmlDecode
```

`:HtmlEncode` replaces special characters (e.g. `<`, `&`, `é`) in the current
buffer with their HTML entity equivalents (e.g. `&lt;`, `&amp;`, `&eacute;`).
`:HtmlDecode` reverses this, turning HTML entities back into their characters.

# Configuration

This plugin currently has no configuration options. `setup()` is exposed for
future options and is safe to call, but not required:

```lua
require('html-entities').setup()
```

# Contributors

Contributions are welcome. If you have an idea for a feature you'd like to see added, submit a PR rquest
