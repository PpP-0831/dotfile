vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
vim.keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
