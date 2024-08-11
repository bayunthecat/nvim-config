return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {},
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "gopls",
        "gofumpt",
        "golines",
        "goimports-reviser",
        "clangd",
        "clang-format",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "go",
        "java",
        "c",
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "leoluz/nvim-dap-go",
    },
    ft = "go",
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      local dapgo = require "dap-go"

      dapgo.setup()
      dapui.setup()

      vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "Debugger toggle breakpoint" })
      vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Debugger continue" })

      vim.keymap.set("n", "<leader>dut", dapgo.debug_test, { desc = "Debug test (closest to the cursor)" })
      vim.keymap.set("n", "<leader>dul", dapgo.debug_last_test, { desc = "Debug last run test" })

      vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Debug step over" })
      vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Debug into" })

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
  },
}
