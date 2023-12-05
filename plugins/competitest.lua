return {
  "xeluxee/competitest.nvim",
  dependencies = "MunifTanjim/nui.nvim",
  config = function() require("competitest").setup() end,
  cmd = {
    "CompetiTest add_testcase",
    "CompetiTest edit_testcase",
    "CompetiTest run",
  },
}
