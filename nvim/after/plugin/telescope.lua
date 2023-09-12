local builtin = require('telescope.builtin')
local telescope = require('telescope')
telescope.setup { file_ignore_patterns = { "node_modules", "dist" }, }
telescope.load_extension("git_worktree")

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pg', builtin.git_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', "<leader>dl", "<cmd>Telescope diagnostics<cr>")
vim.keymap.set('n', "<leader>del", function ()
 builtin.diagnostics({ severity = "error"})
end)

vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end, { desc = "Telescope grep" })
vim.keymap.set('n', '<leader>pps', function()
    builtin.grep_string({ cwd = "/Users/frontm/Documents/FrontM/Bitbucket/"..vim.fn.input("Path > "), search = vim.fn.input("Grep > ") });
end, { desc = "Telescope grep in work dir" })
