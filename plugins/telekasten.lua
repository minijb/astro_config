return {
  "renerocksai/telekasten.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "renerocksai/calendar-vim",
    "nvim-telescope/telescope-media-files.nvim",
    "nvim-telescope/telescope-symbols.nvim",
  },
  config = function()
    require("telekasten").setup {
      home = vim.fn.expand "~/minijb",
    }

    -- add autoamd
    -- local group = vim.api.nvim_create_augroup("smart_markdown_enter", { clear = true })
    -- vim.api.nvim_create_autocmd("BufEnter", {
    --   group = group,
    --   callback = function()
    --     if package.loaded["telekasten"] then vim.keymap.set("i", "[[", "<cmd>Telekasten insert_link<CR>") end
    --   end,
    --   pattern = { "*.md" },
    -- })
    -- vim.api.nvim_create_autocmd("BufLeave", {
    --   group = group,
    --   callback = function()
    --     if package.loaded["telekasten"] then vim.keymap.del("i", "[[") end
    --   end,
    --   pattern = { "*.md" },
    -- })
  end,
  lazy = false,
}
