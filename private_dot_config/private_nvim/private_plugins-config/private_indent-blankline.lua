local ok, ibl = pcall(require, 'ibl')
if ok then
    ibl.setup({
        indent = {
            -- Vertical dashed line
            char = '╎',
        },
        scope = {
            enabled = true,
            char = '╎',
            show_start = true,
            show_end = false,
        },
        -- Hide indent lines on blank lines
        whitespace = {
            remove_blankline_trail = true,
        },
    })
end
