local M = {}

M.general = {
  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "Window left" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "Window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "Window up" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "Window right" },

    ["˚"] = { ":m .-2<CR>==", "Move line up" },
    ["∆"] = { ":m .+1<CR>==", "Move line down" },
  },
  v = {
    ["∆"] = { ":m '>+1<CR>gv=gv", "Move line down" },
    ["˚"] = { ":m '<-2<CR>gv=gv", "Move line up" },

    ["<C-p>"] = { "y'>p", "Duplicate lines" },
  },
}

M.todo = {
  n = {
    ["<leader>ft"] = { "<cmd>TodoTelescope<CR>", "Open TODOs" },
  },
}

M.harpoon = {
  n = {
    ["<leader>ha"] = {
      function()
        local harpoon = require "harpoon"
        harpoon:list():append()
      end,
      "Add file to list",
    },
    ["<leader>ht"] = { "<cmd>Telescope harpoon marks<CR>", "Open marks" },
    ["<leader>hm"] = {
      function()
        local harpoon = require "harpoon"
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      "Show menu",
    },
    ["<leader>1"] = {
      function()
        local harpoon = require "harpoon"
        harpoon:list():select(1)
      end,
      "Navigate to file 1",
    },
    ["<leader>2"] = {
      function()
        local harpoon = require "harpoon"
        harpoon:list():select(2)
      end,
      "Navigate to file 2",
    },
    ["<leader>3"] = {
      function()
        local harpoon = require "harpoon"
        harpoon:list():select(3)
      end,
      "Navigate to file 3",
    },
    ["<leader>4"] = {
      function()
        local harpoon = require "harpoon"
        harpoon:list():select(4)
      end,
      "Navigate to file 4",
    },
  },
}

M.leap = {
  n = {
    ["fw"] = { "<Plug>(leap-forward)", "Leap forward" },
    ["Fw"] = { "<Plug>(leap-backward)", "Leap backward" },
  },
}

return M
