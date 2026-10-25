vim.g.vsnip_snippet_dir = vim.fn.expand('~/.config/nvim/snippets')
vim.api.nvim_set_hl(0, 'CmpNormal', { bg = '#002b36' })
vim.api.nvim_set_hl(0, 'CmpBorder', { fg = '#2aa198' })
vim.api.nvim_set_hl(0, 'CmpSel', { bg = '#073642' })

local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup({
    -- Snippet Engine
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered({
            border = 'rounded',
            winhighlight = 'Normal:CmpNormal,FloatBorder:CmpBorder,CursorLine:CmpSel',
            scrollbar = false,
        }),
        documentation = cmp.config.window.bordered({
            border = 'rounded',
            winhighlight = 'Normal:CmpNormal,FloatBorder:CmpBorder',
        }),
    },
    completion = {
        autocomplete = {
            require('cmp.types').lsp.CompletionTriggerKind.TriggerCharacter,
            require('cmp.types').lsp.CompletionTriggerKind.Invoked,
        },
    },
    -- Key Mappings
    mapping = cmp.mapping.preset.insert({
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-x>'] = cmp.mapping.abort(),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-l>'] = cmp.mapping.complete(),
    }),

    -- Sources
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        { name = 'path' },
    }, {
        { name = 'buffer' },
    }),

    -- Appearance
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text',
            maxwidth = 50,
        }),
    },
})

-- ============================
-- Cmdline Completion
-- ============================

-- Search completion (/ and ?)
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Command completion (:)
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})
