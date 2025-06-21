return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local colors = {
      base     = "#191724",
      surface  = "#1f1d2e",
      overlay  = "#26233a",
      muted    = "#6e6a86",
      subtle   = "#908caa",
      text     = "#e0def4",
      love     = "#eb6f92",
      gold     = "#f6c177",
      rose     = "#ebbcba",
      pine     = "#31748f",
      foam     = "#9ccfd8",
      iris     = "#c4a7e7",
    }

    require("lualine").setup({
      options = {
        theme = {
          normal = {
            a = { fg = colors.foam, bg = "none", gui = "bold" },
            b = { fg = colors.text, bg = colors.surface },
            c = { fg = colors.text, bg = "none" },
          },
          insert = {
            a = { fg = colors.pine, bg = "none", gui = "bold" },
          },
          visual = {
            a = { fg = colors.iris, bg = "none", gui = "bold" },
          },
          command = {
                a = { fg = colors.gold, bg = "none", gui = "bold"}
        },
          replace = {
            a = { fg = colors.love, bg = "none", gui = "bold" },
          },
          inactive = {
            a = { fg = colors.muted, bg = "none" },
            b = { fg = colors.muted, bg = "none" },
            c = { fg = colors.muted, bg = "none" },         },
        },
        component_separators = "",
        section_separators = "",
        globalstatus = true,
      },
      sections = {
        lualine_a = { { "mode" } },
        lualine_b = { "branch", "diff" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "lsp_status" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = { "diagnostics" },
        lualine_z = {  },
      },
    })
  end,
}

