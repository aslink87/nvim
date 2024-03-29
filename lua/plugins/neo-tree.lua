local M = {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    event = "VeryLazy",
    branch = "v2.x",
    requires = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },
    keys = {
        {
            "<leader>fe",
            function()
              require("neo-tree.command").execute({ toggle = true, dir = require("lazyvim.util").get_root() })
            end,
            desc = "Explorer NeoTree (root dir)",
        },
        {
            "<leader>fE",
            function()
              require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
            end,
            desc = "Explorer NeoTree (cwd)",
        },
        { "<leader>e", "<leader>fe", desc = "Explorer NeoTree (root dir)", remap = true },
        { "<leader>E", "<leader>fE", desc = "Explorer NeoTree (cwd)",      remap = true },
    },
    deactivate = function()
      vim.cmd([[Neotree close]])
    end,
    init = function()
      vim.g.neo_tree_remove_legacy_commands = 1
      if vim.fn.argc() == 1 then
        local stat = vim.loop.fs_stat(vim.fn.argv(0))
        if stat and stat.type == "directory" then
          require("neo-tree")
        end
      end
    end,
    opts = {
        default_component_configs = {
            indent = {
                indent_size = 2,
                padding = 1,
            },
        },
        filesystem = {
            bind_to_cwd = false,
            follow_current_file = true,
            hide_by_name = {
                "node_modules"
            },
        },
        window = {
            width = 40,
            mappings = {
                ["<space>"] = "none",
            },
            position = "right",
        },
    },
}

return M
