return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 15,
        open_mapping = [[<c-\>]],
        direction = "float", -- options: 'horizontal', 'vertical', 'tab', 'float'
        float_opts = {
          border = "curved",
          winblend = 3,
        },
        shade_terminals = true,
        shading_factor = 2,
      })
    end,
  },
}
