local neogit = require('neogit')

-- ============================
-- Neogit Setup
-- ============================
neogit.setup({
    -- General Settings
    disable_hint = false,
    disable_context_highlighting = false,
    disable_signs = false,
    graph_style = "unicode",

    -- Git Services
    git_services = {
        ["github.com"] = {
            commit = "https://github.com/%s/commit/%s",
            pull_request = "https://github.com/%s/pull/%s",
            tree = "https://github.com/%s/tree/%s"
        },
    },

    -- Integrations (outside git_services)
    integrations = {
        diffview = true,
    },
})

-- ============================
-- Key Mappings
-- ============================

-- Status
vim.keymap.set('n', '<leader>gs', ':Neogit<CR>',
    { desc = 'Git Status' })

-- Commit
vim.keymap.set('n', '<leader>gc', ':Neogit commit<CR>',
    { desc = 'Git Commit' })

-- Push
vim.keymap.set('n', '<leader>gp', ':Neogit push<CR>',
    { desc = 'Git Push' })

-- Push Current Branch
vim.keymap.set('n', '<leader>gP', function()
    local branch = vim.fn.system('git branch --show-current'):gsub('\n', '')
    neogit.action('push', 'push_current_branch', { 'origin', branch })()
end, { desc = 'Git Push Current Branch' })

-- Pull
vim.keymap.set('n', '<leader>gl', ':Neogit pull<CR>',
    { desc = 'Git Pull' })

-- Add All
vim.keymap.set('n', '<leader>ga', ':Neogit add .<CR>',
    { desc = 'Git Add All' })

-- Diff
vim.keymap.set('n', '<leader>gd', ':DiffviewOpen<CR>',
    { desc = 'Git Diff' })

-- New Branch
vim.keymap.set('n', '<leader>gn', ':Neogit branch_create<CR>',
    { desc = 'Git New Branch' })

-- Checkout Branch
vim.keymap.set('n', '<leader>gB', ':Neogit checkout<CR>',
    { desc = 'Git Checkout Branch' })
