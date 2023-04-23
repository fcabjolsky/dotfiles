vim.keymap.set("n", "<leader>gs", vim.cmd.Git,{ desc = "Git fugitive" } )
vim.keymap.set("n", "<leader>gbm", function() vim.cmd.Git({ args = { "blame" } }) end, { desc = "[G]it [B]lame [M]e" })
