return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    background = { -- :h background
      light = "latte",
      dark = "mocha",
    },
    transparent_background = not vim.g.neovide, -- disables setting the background color.
    term_colors = true,
    float = {
      transparent = true, -- enable transparent floating windows
      solid = false, -- use solid styling for floating windows, see |winborder|
    },
    auto_integrations = true, -- automatically load integrations
    integrations = {
      blink_cmp = {
        -- style = "bordered",
      },
      treesitter = true,
      treesitter_context = true,
      flash = true,
      mason = true,
      mini = {
        enable = true,
        -- indentscope_color = "pink",
      },
      gitsigns = true,
      snacks = {
        enabled = true,
        indent_scope_color = "yellow",
      },
      rainbow_delimiters = true,
      lsp_saga = true,
      which_key = false,
    },
    highlight_overrides = {
      mocha = function(mocha)
        return {
          CursorLineNr = { fg = mocha.yellow },
          TelescopeSelection = { bg = mocha.surface0 },
          FlashCurrent = { bg = mocha.peach, fg = mocha.base },
          FlashMatch = { bg = mocha.red, fg = mocha.base },
          FlashLabel = { bg = mocha.teal, fg = mocha.base },
          RenderMarkdownCode = { bg = mocha.crust },
          -- Pmenu = { bg = mocha.base },
          TreesitterContextBottom = { underline = true, sp = mocha.yellow },
          BlinkCmpKindCopilot = { fg = mocha.mauve },
        }
      end,
    },
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd("colorscheme catppuccin-mocha")
    vim.cmd.hi("statusline guibg=NONE")
  end,
}
