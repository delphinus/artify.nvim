# artify.nvim

Yet another fork of [sainnhe/artify.vim][].

[sainnhe/artify.vim]: https://github.com/sainnhe/artify.vim

## Motivation

The original artify.vim is written by Vimscript and runs too slowly to use heavily. I have rewritten it with Lua on Neovim and achieved blazingly fast speed.

##### Run 10000 times both to compare

<details><summary>A simple benchmark</summary>

```lua
local s = os.clock()
for i = 1, 10000 do
  vim.cmd[[call Artify('foo', 'bold')]]
end
print(os.clock() - s)

local artify = require'artify'
s = os.clock()
local result = {}
for i = 1, 10000 do
  table.insert(result, artify('foo', 'bold'))
end
print(os.clock() - s)
```
</details>

| artify.vim | artify.nvim          |
|------------|----------------------|
| 6.314065 s | 0.0061699999999973 s |

Simply x1000 speed!!

## Usage

artyfy.nvim has almost the same interface as artify.vim.

```lua
local artify = require'artify'

artify('foo', 'bold') --> 𝐟𝐨𝐨
artify('foo', 'italic') --> 𝑓𝑜𝑜
artify('foo', 'monospace') --> 𝚏𝚘𝚘
```

## Example

### lualine.nvim

[hoob3rt/lualine.nvim][] is a pure Lua plugin to show fully-customizable statusline. You can integrate it with artify.nvim.

[hoob3rt/lualine.nvim]: https://github.com/hoob3rt/lualine.nvim

```lua
local artify = require'artify'
local lualine = require'lualine'
local mode = require'lualine.components.mode'
lualine.sections.lualine_a = {
  function()
    return artify(mode(), 'monospace')
  end,
}
```

<img width="719" alt="スクリーンショット 0003-03-04 19 03 09" src="https://user-images.githubusercontent.com/1239245/109947305-82af1280-7d1c-11eb-9fd7-95d9b3b869b0.png">

It is showing special characters for the mode: 𝙽𝙾𝚁𝙼𝙰𝙻
