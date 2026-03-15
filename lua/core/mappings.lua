local bind = vim.keymap.set
local opts = { silent = true, noremap = true }

-- Modes
-- normal_mode = 'n'
-- insert_mode = 'i'
-- visual_mode = 'v'
-- visual_block_mode = 'x'
-- term_mode = 't'
-- command_mode = 'c'

bind('n', '<c-1>', ':shortcut.next-session<CR>')
bind('n', '<c-2>', ':shortcut.previous-session<CR>')
bind('n', '<C-r>', ':redo<CR>')
bind('n', '<C-u>', ':undo<CR>')
bind('n', '<C-w>', ':w<CR>')

bind('n', '<Home>', ':lua home_or_word()<CR>', opts)

-- Tabs
bind('n', 'tg', 'gT')
bind('n', 'gt', 'gt')

-- Stay in indent mode
bind('v', '<Backspace>', '<gv', opts)
bind('v', '<Tab>', '>gv', opts)

bind('i', 'jk', '<ESC>', opts)
bind('n', '<space>h', '<cmd>noh<cr>', opts)
bind('n', '<leader>e', '<cmd>Neotree toggle<CR>', opts)
bind('n', '<leader>b', '<cmd>Neotree toggle source=buffers<CR>', opts)

bind('t', '<esc>', [[<C-\><C-n>]], opts)
bind('t', 'jk', [[<C-\><C-n>]], opts)
bind('t', '<C-h>', '<cmd>wincmd h<CR>', opts)
bind('t', '<C-j>', '<cmd>wincmd j<CR>', opts)
bind('t', '<C-k>', '<cmd>wincmd k<CR>', opts)
bind('t', '<C-l>', '<cmd>wincmd l<CR>', opts)

bind('n', '<leader>fn', '<cmd>enew<cr>', opts)

-- moving between visible buffers
bind('n', '<C-h>', '<cmd>lua require("smart-splits").move_cursor_left()<CR>', opts)
bind('n', '<C-j>', '<cmd>lua require("smart-splits").move_cursor_down()<CR>', opts)
bind('n', '<C-k>', '<cmd>lua require("smart-splits").move_cursor_up()<CR>', opts)
bind('n', '<C-l>', '<cmd>lua require("smart-splits").move_cursor_right()<CR>', opts)

bind('n', '<C-Up>', '<cmd>lua require("smart-splits").resize_up()<CR>', opts)
bind('n', '<C-Down>', '<cmd>lua require("smart-splits").resize_down()<CR>', opts)
bind('n', '<C-Left>', '<cmd>lua require("smart-splits").resize_left()<CR>', opts)
bind('n', '<C-Right>', '<cmd>lua require("smart-splits").resize_right()<CR>', opts)

-- LSP
bind('n', '<leader>ld', vim.diagnostic.open_float, opts)
bind('n', '[d', vim.diagnostic.goto_prev, opts)
bind('n', ']d', vim.diagnostic.goto_next, opts)
bind('n', '<leader>q', vim.diagnostic.setloclist, opts)

-- aerial
bind('n', '<leader>lS', '<cmd>AerialToggle!<CR>')
bind('n', '<leader>ls', '<cmd>lua require("telescope").extensions.aerial.aerial()<CR>', opts)

-- terminal
bind('n', '<leader>t', '<cmd>ToggleTerm<CR>', opts)
bind('t', '<leader>t', '<cmd>ToggleTerm<CR>', opts)

-- luasnip
bind('i', '<C-j>', '<cmd>lua require("luasnip").jump(1)<CR>', opts)
bind('s', '<C-j>', '<cmd>lua require("luasnip").jump(1)<CR>', opts)
bind('i', '<C-k>', '<cmd>lua require("luasnip").jump(-1)<CR>', opts)
bind('s', '<C-k>', '<cmd>lua require("luasnip").jump(-1)<CR>', opts)

-- telescope
bind('n', 'ff', '<cmd>Telescope find_files<CR>', opts)
bind('n', 'fg', '<cmd>Telescope live_grep<CR>', opts)
bind('n', 'fb', '<cmd>Telescope buffers<CR>', opts)
bind('n', 'fh', '<cmd>Telescope help_tags<CR>', opts)

-- trouble
bind('n', '<leader>x', '<cmd>Trouble<CR>', opts)
-- bind('n', '<leader>x', '<cmd>TroubleToggle<CR>', opts)
-- bind('n', '<leader>x', '<cmd>Telescope diagnostics<CR>', opts)

-- gitsigns
bind('n', '<leader>gj', '<cmd>lua require("gitsigns").next_hunk()<CR>', opts)
bind('n', '<leader>gk', '<cmd>lua require("gitsigns").prev_hunk()<CR>', opts)
bind('n', '<leader>gl', '<cmd>lua require("gitsigns").blame_line()<CR>', opts)
bind('n', '<leader>gp', '<cmd>lua require("gitsigns").preview_hunk()<CR>', opts)
bind('n', '<leader>gh', '<cmd>lua require("gitsigns").reset_hunk()<CR>', opts)
bind('n', '<leader>gr', '<cmd>lua require("gitsigns").reset_buffer()<CR>', opts)
bind('n', '<leader>gs', '<cmd>lua require("gitsigns").stage_hunk()<CR>', opts)
bind('n', '<leader>gu', '<cmd>lua require("gitsigns").undo_stage_hunk()<CR>', opts)
bind('n', '<leader>gd', '<cmd>lua require("gitsigns").diffthis()<CR>', opts)
bind('n', '<leader>gt', '<cmd>Telescope git_status<CR>', opts)
bind('n', '<leader>gb', '<cmd>Telescope git_branches<CR>', opts)
bind('n', '<leader>gc', '<cmd>Telescope git_commits<CR>', opts)
