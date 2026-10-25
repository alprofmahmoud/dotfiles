-- nvim-tree Configuration
-- Disable netrw (required)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local function on_attach(bufnr)
    local api = require("nvim-tree.api")
    local opts = { buffer = bufnr, noremap = true, silent = true }

    -- Default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- Open file in the same window
    vim.keymap.set("n", "<CR>", api.node.open.edit, opts)
    vim.keymap.set("n", "o", api.node.open.edit, opts)
    vim.keymap.set("n", "<2-LeftMouse>", api.node.open.edit, opts)
end

require("nvim-tree").setup({
    on_attach = on_attach,
    -- Show hidden files
    filters = {
        dotfiles = false,
        custom = {},
        exclude = {},
    },
    -- Follow current file and update root
    update_focused_file = {
        enable = true,
        update_root = true,
        ignore_list = {},
    },
    -- Sync root with current working directory
    respect_buf_cwd = true,
    sync_root_with_cwd = true,
    -- Icons and renderer
    renderer = {
        highlight_opened_files = "none",
        indent_markers = {
            enable = true,
        },
        icons = {
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
            },
        },
    },
    -- Git integration
    git = {
        enable = true,
        ignore = false,
    },
    -- Window settings
    view = {
        width = 30,
        side = "left",
        preserve_window_proportions = true,
    },
    -- File open behavior
    actions = {
        open_file = {
            quit_on_open = false,
            resize_window = true,
            window_picker = {
                enable = false,
            },
        },
    },
    -- Diagnostics icons
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
            error = "✘",
            warning = "⚠",
            hint = "",
            info = "",
        },
    },
})

-- Fix cursorline when opening file from nvim-tree
vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        if vim.bo.filetype ~= "NvimTree" then
            vim.wo.cursorline = true
            vim.wo.cursorcolumn = true
        end
    end,
})
-- Open nvim-tree on startup if no file is specified
vim.api.nvim_create_autocmd("VimEnter", {

    callback = function()
        if vim.fn.argc() == 0 then
            require("nvim-tree.api").tree.open()
        end
    end,
})
-- Keymaps
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>nf", ":NvimTreeFindFile<CR>")
vim.keymap.set("n", "<leader>nr", ":NvimTreeRefresh<CR>")
vim.keymap.set("n", "<leader>nc", ":NvimTreeCollapse<CR>")
