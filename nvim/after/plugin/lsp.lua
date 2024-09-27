local lsp = require('lsp-zero')
lsp.extend_lspconfig()
require('lspconfig').tsserver.setup({})

lsp.on_attach(function(_, bufnr)
    local map = function(keys, func, desc, mode)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set(mode or 'n', keys, func, { buffer = bufnr, desc = desc, remap = false })
    end

    map("gd", function() vim.lsp.buf.definition() end, "[G]oto [D]efinition")
    map("gi", vim.lsp.buf.implementation, "[G]o to [I]mpementation")
    map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    map("gr", require('telescope.builtin').lsp_references, "[G]oto [R]eferences")
    map("<leader>vws", require('telescope.builtin').lsp_dynamic_workspace_symbols, "Workspace symbol")

    map("K", function() vim.lsp.buf.hover() end, "hover")
    map("<leader>vd", function() vim.diagnostic.open_float() end, "Diagnostic open float")
    map("[d", function() vim.diagnostic.goto_next() end, "")
    map("]d", function() vim.diagnostic.goto_prev() end, "")
    map("<leader>vca", function() vim.lsp.buf.code_action() end, "Code action")
    map("<leader>vrn", function() vim.lsp.buf.rename() end, "Rename symbol")
    -- this map is giving errors need to change it
    map("H", function() vim.lsp.buf.signature_help() end, "Signature documentation")
    map("<C-h>", function() vim.lsp.buf.signature_help() end, "Signature documentation insert mode", 'i')
end)


require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
    lsp.default_setup,
  }
})

vim.diagnostic.config({
    virtual_text = true
})

