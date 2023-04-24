vim.keymap.set("n", "<leader>gs", vim.cmd.Git,{ desc = "Git fugitive" } )
vim.keymap.set("n", "<leader>gbm", function() vim.cmd.Git({ args = { "blame" } }) end, { desc = "[G]it [B]lame [M]e" })
vim.keymap.set("n", "gj", "<cmd>diffget //2<CR>", {desc = "Get changes from right"})
vim.keymap.set("n", "gf", "<cmd>diffget //3<CR>", {desc = "Get changes from left"})
