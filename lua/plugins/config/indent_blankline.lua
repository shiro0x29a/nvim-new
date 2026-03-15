local ibl = require('ibl')

ibl.setup {
  indent = {
    char = '│',
    highlight = 'IblIndent',
  },
  scope = {
    enabled = true,
    show_start = true,
    show_end = true,
    highlight = 'IblScope',
  },
  whitespace = {
    highlight = 'IblWhitespace',
    remove_blankline_trail = true,
  },
}
