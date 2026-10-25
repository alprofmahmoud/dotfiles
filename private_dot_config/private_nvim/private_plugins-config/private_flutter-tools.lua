require('flutter-tools').setup {
  ui = {
    border = "rounded",
    notification_style = 'native',
  },

  decorations = {
    statusline = {
      app_version = true,
      device = true,
    }
  },

  flutter_path = "/opt/flutter/bin/flutter",

  lsp = {
    on_attach = function(client, bufnr)
      -- نفس الـ keymaps بتاعتك
      local opts = { buffer = bufnr }
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'K',  vim.lsp.buf.hover,      opts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references,  opts)
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename,      opts)
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    end,
    settings = {
      showTodos = true,
      completeFunctionCalls = true,
    }
  },

  debugger = {
    enabled = false,
  },
}

-- Keymaps
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map('n', '<leader>fr', ':FlutterRun<CR>',     opts)
map('n', '<leader>fR', ':FlutterReload<CR>',  opts)
map('n', '<leader>fs', ':FlutterRestart<CR>', opts)
map('n', '<leader>fd', ':FlutterDevices<CR>', opts)
map('n', '<leader>fq', ':FlutterQuit<CR>',    opts)
