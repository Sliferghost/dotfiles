local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require "null-ls"
local cmd_resolver = require "null-ls.helpers.command_resolver"

local opts = {
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.prettier.with {
      extra_filetypes = { "astro" },
    },
    null_ls.builtins.formatting.prismaFmt.with {
      generator_opts = {
        command = "prisma",
        args = { "format", "--schema", "$FILENAME" },
        to_stdin = false,
        to_temp_file = true,
        dynamic_command = cmd_resolver.from_node_modules(),
        -- prisma format --schema=./schema.prisma
      },
    },
    null_ls.builtins.diagnostics.eslint.with {
      extra_filetypes = { "astro" },
    },
  },
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds {
        group = augroup,
        buffer = bufnr,
      }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
}

return opts
