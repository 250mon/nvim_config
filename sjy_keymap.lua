-- VIM general
vim.keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
vim.keymap.set("n", "<ESC>", ":nohl<CR>", { desc = "Clear search highlights" })

-- Tab
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) -- go to next tab
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) -- go to previous tab
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) -- move current buffer to new tab

-- SJY
vim.keymap.set("n", "<leader>html", "<cmd>-1read $HOME/.vim/.skeleton.html<CR>5jwf>a")

-- auto-session
vim.keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore sesfor cwd" }) -- restore last workspace session for current directory
vim.keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" }) -- save workspace session for current working directory

-- conform
local conform = require("conform")

vim.keymap.set({ "n", "v" }, "<leader>mp", function()
  conform.format({
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  })
end, { desc = "Format file or range (in visual mode)" })

-- gitsigns
-- Navigation
local gs = package.loaded.gitsigns

local function map(mode, l, r, desc)
  vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
end

map("n", "]h", gs.next_hunk, "Next Hunk")
map("n", "[h", gs.prev_hunk, "Prev Hunk")

-- Actions
map("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")
map("v", "<leader>hs", function()
  gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, "Stage hunk")
map("v", "<leader>hr", function()
  gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, "Reset hunk")

map("n", "<leader>hS", gs.stage_buffer, "Stage buffer")
map("n", "<leader>hR", gs.reset_buffer, "Reset buffer")

map("n", "<leader>hu", gs.undo_stage_hunk, "Undo stage hunk")

map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")

map("n", "<leader>hb", function()
  gs.blame_line({ full = true })
end, "Blame line")
map("n", "<leader>hB", gs.toggle_current_line_blame, "Toggle line blame")

map("n", "<leader>hd", gs.diffthis, "Diff this")
map("n", "<leader>hD", function()
  gs.diffthis("~")
end, "Diff this ~")

-- Text object
map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Gitsigns select hunk")

-- lazygit
keys = {
  { "<leader>lg", "<cmd>LazyGit<cr>", desc = "Open lazy git" },
}

-- linting
local lint = require("lint")
vim.keymap.set("n", "<leader>l", function()
  lint.try_lint()
end, { desc = "Trigger linting for current file" })

-- nvim-cmp
local cmp = require("cmp")
mapping = cmp.mapping.preset.insert({
  ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
  ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
  ["<C-b>"] = cmp.mapping.scroll_docs(-4),
  ["<C-f>"] = cmp.mapping.scroll_docs(4),
  ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
  ["<C-e>"] = cmp.mapping.abort(), -- close completion window
  ["<CR>"] = cmp.mapping.confirm({ select = false }),
})

-- nvim-tree
vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
vim.keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
vim.keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer

-- substitude
local substitute = require("substitute")
vim.keymap.set("n", "s", substitute.operator, { desc = "Substitute with motion" })
vim.keymap.set("n", "ss", substitute.line, { desc = "Substitute line" })
vim.keymap.set("n", "S", substitute.eol, { desc = "Substitute to end of line" })
vim.keymap.set("x", "s", substitute.visual, { desc = "Substitute in visual mode" })

-- todo-comments
local todo_comments = require("todo-comments")
vim.keymap.set("n", "]t", function()
  todo_comments.jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
  todo_comments.jump_prev()
end, { desc = "Previous todo comment" })

-- trouble
keys = {
  { "<leader>xx", "<cmd>TroubleToggle<CR>", desc = "Open/close trouble list" },
  { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>", desc = "Open trouble workspace diagnostics" },
  { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>", desc = "Open trouble document diagnostics" },
  { "<leader>xq", "<cmd>TroubleToggle quickfix<CR>", desc = "Open trouble quickfix list" },
  { "<leader>xl", "<cmd>TroubleToggle loclist<CR>", desc = "Open trouble location list" },
  { "<leader>xt", "<cmd>TodoTrouble<CR>", desc = "Open todos in trouble" },
}

-- vim-maximizer
keys = {
  { "<leader>sm", "<cmd>MaximizerToggle<CR>", desc = "Maximize/minimize a split" },
}

-- treesitter
incremental_selection = {
  enable = true,
  keymaps = {
    init_selection = "<C-space>",
    node_incremental = "<C-space>",
    scope_incremental = false,
    node_decremental = "<bs>",
  },
},
