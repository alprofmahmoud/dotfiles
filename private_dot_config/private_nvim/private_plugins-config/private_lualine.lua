require('lualine').setup({
    options = {
        theme = 'solarized_dark',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        globalstatus = true,
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = {
            {
                'branch',
                icon = '\u{e0a0}',
                fmt = function(name)
                    local modified = vim.fn.system('git status --porcelain 2>/dev/null')
                    if modified ~= '' then
                        return name .. ' ●'
                    end
                    return name
                end,
            },
            'diff',
            'diagnostics',
        },
        lualine_c = {{ 'filename', path = 1}},
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
    },
    inactive_sections = {
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
    },
})
