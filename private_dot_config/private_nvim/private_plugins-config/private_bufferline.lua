local bufferline = require('bufferline')

bufferline.setup({
    options = {
        mode = "buffers",
        style_preset = bufferline.style_preset.default,
        numbers = "ordinal",
        close_command = "bdelete! %d",
        right_mouse_command = "bdelete! %d",
        separator_style = "slant",
        -- separator_style = { '\u{E0B0}', '\u{E0B2}' },
        indicator = {
            style = 'underline',
        },
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = false,
        always_show_bufferline = true,
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                text_align = "center",
                separator = true,
            },
        },
    },
    highlights = function()
        local active_bg = vim.fn.synIDattr(vim.fn.hlID("Normal"), "bg#")
        local inactive_bg = vim.fn.synIDattr(vim.fn.hlID("TabLine"), "bg#")
        local inactive_fg = vim.fn.synIDattr(vim.fn.hlID("TabLine"), "fg#")
        local active_fg = vim.fn.synIDattr(vim.fn.hlID("Normal"), "fg#")
        return {
            fill = { bg = inactive_bg },
            background = { fg = inactive_fg, bg = inactive_bg },
            buffer_selected = { fg = active_fg, bg = active_bg, bold = true, italic = true },
            buffer_visible = { fg = inactive_fg, bg = inactive_bg },
            numbers = { fg = inactive_fg, bg = inactive_bg },
            numbers_selected = { fg = active_fg, bg = active_bg, bold = true },
            separator = { fg = inactive_bg, bg = inactive_bg },
            separator_selected = { fg = inactive_bg, bg = active_bg },
        }
    end
})
