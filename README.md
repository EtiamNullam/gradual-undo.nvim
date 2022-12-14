# gradual-undo.nvim

Based on an idea posted on reddit by [Flaky_Candy_6232](https://www.reddit.com/user/Flaky_Candy_6232):

https://www.reddit.com/r/neovim/comments/xij4yn/how_to_configure_undo_the_way_android_studios

## Installation

Simply use your favorite plugin manager to install it, for example:

```lua
Plug 'EtiamNullam/gradual-undo.nvim'
```

...then call:

```lua
require('gradual-undo').setup()
```

...to load with default configuration, which will override `u` and `<c-r>` in `normal` mode.

## Manual usage

Map to your own keys of choice or invoke manually by:

```lua
local gradual_undo = require('gradual-undo')

gradual_undo.jump_to_last_undo_position_or_undo()
gradual_undo.jump_to_last_redo_position_or_redo()
```
