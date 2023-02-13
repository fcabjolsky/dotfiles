local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.nvim_workspace()
lsp.ensure_installed({
    'tsserver',
    'sumneko_lua',
    'rust_analyzer',
})

lsp.configure('sumneko_lua', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc, remap = false })
    end

    nmap("gd", function() vim.lsp.buf.definition() end, "[G]oto [D]efinition")
    nmap("gi", vim.lsp.buf.implementation, "[G]o to [I]mpementation")
    nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap("gr", require('telescope.builtin').lsp_references, "[G]oto [R]eferences")
    nmap("<leader>vws", require('telescope.builtin').lsp_dynamic_workspace_symbols, "Workspace symbol")

    nmap("K", function() vim.lsp.buf.hover() end, "hover")
    nmap("<leader>vd", function() vim.diagnostic.open_float() end, "")
    nmap("[d", function() vim.diagnostic.goto_next() end, "")
    nmap("]d", function() vim.diagnostic.goto_prev() end, "")
    nmap("<leader>vca", function() vim.lsp.buf.code_action() end, "Code action")
    nmap("<leader>vrn", function() vim.lsp.buf.rename() end, "Rename symbol")
    -- this map is giving errors need to change it
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end,
        { buffer = bufnr, desc = "Signature documentation", remap = false })
end)

require 'lspconfig'.eslint.setup {}

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
