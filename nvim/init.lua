require("briar")

vim.lsp.enable('clangd')
vim.lsp.enable('pyright')
vim.lsp.enable('bashls')
vim.lsp.enable('ocamllsp')
vim.lsp.enable('rust_analyzer')

vim.lsp.config('rust_analyzer', {
    settings = {
        ["rust-analyzer"] = {
            checkOnSave = {
                command = 'clippy',
            },
            diagnostics = {
                enable = true,
                experimental = {
                    enable = true,
                },
            },
        },
    },
})
