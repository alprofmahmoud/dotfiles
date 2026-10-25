local ok, gitsigns = pcall(require, 'gitsigns')
if not ok then return end

vim.o.winborder = 'rounded'

vim.api.nvim_set_hl(0, 'GitSignsAdd',    { link = 'DiffAdd' })
vim.api.nvim_set_hl(0, 'GitSignsChange', { link = 'DiffChange' })
vim.api.nvim_set_hl(0, 'GitSignsDelete', { link = 'DiffDelete' })

gitsigns.setup({
    signs = {
        add          = { text = '▎' },
        change       = { text = '▎' },
        delete       = { text = '' },
        topdelete    = { text = '' },
        changedelete = { text = '▎' },
        untracked    = { text = '▎' },
    },
    current_line_blame = false,
    current_line_blame_opts = {
        delay = 500,
    },
})

vim.keymap.set('n', '<leader>hp', gitsigns.preview_hunk)
