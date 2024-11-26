return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    -- typescript languge server names different in different oses
    -- Detect the operating system
    local uname = vim.loop.os_uname()
    local os_name = uname.sysname
    local typescript_server = "tsserver"

    if os_name == "Linux" then
      typescript_server = "ts_ls"
    elseif os_name == "Darwin" then
      typescript_server = "ts_ls"
    elseif os_name:find("Windows") then
      typescript_server = "tsserver"
    end

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        typescript_server,
        "html",
        "cssls",
        "tailwindcss",
        "svelte",
        "lua_ls",
        "graphql",
        "emmet_ls",
        "prismals",
        "pyright",
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "isort", -- python formatter
        "black", -- python formatter
        "pylint",
        "eslint_d",
      },
    })
  end,
}
