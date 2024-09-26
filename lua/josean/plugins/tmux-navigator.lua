return {
  "christoomey/vim-tmux-navigator",
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
  },
  keys = {
    { "<m-kleft>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
    { "<m-kdown>", "<cmd><C-U>TmuxNavigateDown<cr>" },
    { "<m-kup>", "<cmd><C-U>TmuxNavigateUp<cr>" },
    { "<m-kright>", "<cmd><C-U>TmuxNavigateRight<cr>" },
    { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
  },
  config = function()
    -- Disable default key mappings
    vim.g.tmux_navigator_no_mappings = 1
  end,
}
