-- -- create an augroup to easily manage autocommands
-- vim.api.nvim_create_augroup("tabstop", { clear = true })
-- -- create a new autocmd on the "User" event
-- vim.api.nvim_create_autocmd("BufEnter", {
--   desc = "change tabstop", -- nice description
--   -- triggered when vim.t.bufs is updated
--   pattern = "*", -- the pattern is the name of our User autocommand events
--   group = "tabstop", -- add the autocmd to the newly created augroup
--   callback = function()
--     vim.opt.tabstop = 2
--     vim.opt.shiftwidth = 2
--     vim.opt.softtabstop = 2
--   end,
-- })

return {
  lsp = {
    servers = {
      "glsl_analyzer",
    },
    config = {
      clangd = {
        capabilities = {
          offsetEncoding = "utf-8",
        },
      },
    },
  },
  plugins = {
    {
      "p00f/clangd_extensions.nvim", -- install lsp plugin
      init = function()
        -- load clangd extensions when clangd attaches
        local augroup = vim.api.nvim_create_augroup("clangd_extensions", { clear = true })
        vim.api.nvim_create_autocmd("LspAttach", {
          group = augroup,
          desc = "Load clangd_extensions with clangd",
          callback = function(args)
            if assert(vim.lsp.get_client_by_id(args.data.client_id)).name == "clangd" then
              require "clangd_extensions"
              -- add more `clangd` setup here as needed such as loading autocmds
              vim.api.nvim_del_augroup_by_id(augroup) -- delete auto command since it only needs to happen once
            end
          end,
        })
      end,
    },
    {
      "williamboman/mason-lspconfig.nvim",
      opts = {
        ensure_installed = { "clangd" }, -- automatically install lsp
      },
    },
  },
  mappings = {
    n = {
      ["<c-p>"] = { '"+p', desc = "paste with clipboard" },
      ["<c-y>"] = { '"+y', desc = "yank with clipboard" },
    },
  },
}
