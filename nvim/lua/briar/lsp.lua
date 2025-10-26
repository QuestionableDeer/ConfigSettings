--vim.diagnostic.config({
--    virtual_text = false,
--    virtual_lines = true,
--    update_in_insert = true,
--    underline = true,
--    severity_sort = true,
--    float = {
--        focusable = true,
--        style = "minimal",
--        border = "rounded",
--        source = true,
--        header = "",
--        prefix = "",
--    },
--    signs = {},
--})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        if not client then
            return
        end

        -- format and autoimport on save
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = args.buf,
            callback = function()
                if client:supports_method("textDocument/formatting") then
                    vim.lsp.buf.format({bufnr = args.buf, id = client.id })
                end
            end,
        })

        -- Enable auto-completion. Note: use C-Y to select an item.
        if client:supports_method("textDocument/completion") then
            vim.lsp.completion.enable(true, client.id, args.buf, {autotrigger = true})
        end

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer = args.buf, noremap = true, silent = true})
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer = args.buf, noremap = true, silent = true})

    end,
})

vim.api.nvim_create_autocmd({"CursorHold", "InsertLeave"}, {
    callback = function()
        local opts = {
            focusable = false,
            scope = "cursor",
            close_events = { "BufLeave", "CursorMoved", "InsertEnter" },
        }
        vim.diagnostic.open_float(opts)
    end,
})
