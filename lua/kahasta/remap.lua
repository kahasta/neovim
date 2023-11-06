vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Explorer" })
-- Форматирование кода
vim.keymap.set("n", "<C-M-l>", vim.cmd.LspZeroFormat, { desc = "LspZeroFormat" })

-- Это для того чтобы листая страницу оставаться посередине
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- Это для копирования в разных режимах и буферах
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y") -- Для глобального буфера

-- Это для того чтобы во время поиска оставаться посередине
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- Это переназначенная кнопка Esc на jj
vim.keymap.set("i", "jj", "<Esc>")
-- Для замены выбранного слова во всем буфере
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
