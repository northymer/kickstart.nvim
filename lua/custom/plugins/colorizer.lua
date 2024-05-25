-- Plugin for in-terminal displaying of hex colors
return {
  'norcalli/nvim-colorizer.lua',
  config = function()
    require('colorizer').setup()
  end,
}
