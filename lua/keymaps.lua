-- [[ Basic Keymaps ]]
--
local opts = { noremap = true, silent = true }
-- note <C-v> is super useful for column select and has multi cursor effect
--  See `:help vim.keymap.set()`
local map = vim.keymap

-- Diagnostic keymaps
map.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
map.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
map.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
map.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
map.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
map.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
map.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
map.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--
--  See `:help wincmd` for a list of all window commands
--  See `:help notations` for how to represent different keys
--  Note that terminal might not diffrentiate <S-h> vs. <H>
--  Note: haven't gotten ctrl + shift to work in the form of <C-S-1>
--  Also there is built in repeat effect for keys like <S> and <C> so that you can hold them down and another key and it's effect will be repeated. Seems like an OS level thing
map.set('n', '<S-f>', '<S-j>', { desc = '[F]use lines' }) -- need to remmap join lines

map.set('n', '<S-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map.set('n', '<S-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map.set('n', '<S-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' }) -- gave up trying to remap <S-k>
map.set('n', '<S-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })

-- move window
map.set('n', '<S-r>', '<C-w>R', { desc = 'Rotate window' })
map.set('n', '<S-x>', '<C-w>x', { desc = 'Exchange window' })
map.set('n', '<S-right>', '<C-w>L', { desc = 'Move the window right' })
map.set('n', '<S-left>', '<C-w>H', { desc = 'Move the window left' })
map.set('n', '<S-up>', '<C-w>K', { desc = 'Move the window up' })
map.set('n', '<S-down>', '<C-w>J', { desc = 'Move the window down' })

-- resize window
map.set('n', '<C-=>', '<C-w>=', { desc = 'Resize windows to have the same height and width' })
map.set('n', '<C-Bslash>', '<C-w>_', { desc = 'Resize windows to have max height' })
map.set('n', '<C-Enter>', '<C-w>|', { desc = 'Resize windows to have max width' })
map.set('n', '<C-right>', '<C-w>>', { desc = 'Resize window to be horizontally larger' })
map.set('n', '<C-left>', '<C-w><', { desc = 'Resize window to horizontally smaller' })
map.set('n', '<C-up>', '<C-w>+', { desc = 'Resize window to be vertically larger' })
map.set('n', '<C-down>', '<C-w>-', { desc = 'resize window to be vertically smaller' })

-- Split window
map.set('n', 'ss', ':split<Return>', opts)
map.set('n', 'sv', ':vsplit<Return>', opts)
map.set('n', '<leader>1', ':Vex<Return>', opts)
map.set('n', '<leader>1h', ':Vex<Return>', opts)
map.set('n', '<leader>1l', ':Vex!<Return>', opts)
map.set('n', '<leader>1j', ':Hex<Return>', opts)
map.set('n', '<leader>1k', ':Hex!<Return>', opts)

-- Increment / Decrement
map.set('n', '+', '<C-a>', opts)
map.set('n', '-', '<C-x>', opts)

-- Copy all
map.set('n', '<C-a>', 'gg<S-v>Gy<C-o>')

-- Open config file
map.set('n', '<leader>;', ':vsplit ~/.config/nvim/init.lua<Return>')
