# gradual-undo.nvim

Based on an idea posted on reddit by [Flaky_Candy_6232](https://www.reddit.com/user/Flaky_Candy_6232/): https://www.reddit.com/r/neovim/comments/xij4yn/how_to_configure_undo_the_way_android_studios

## Usage

To load with default configuration, which will override `u` in `normal` mode.

```lua
require('gradual-undo').setup()
```

### Manual usage

Map to your own key of choice or invoke manually by `require('gradual-undo').jump_to_last_undo_position_or_undo()`.
