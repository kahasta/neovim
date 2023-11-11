local wk = require("which-key")
vim.g.mapleader = " "
-- Форматирование кода
vim.keymap.set("n", "<C-M-l>", vim.cmd.LspZeroFormat, { desc = "LspZeroFormat" })

-- Это для того чтобы листая страницу оставаться посередине
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Это для того чтобы во время поиска оставаться посередине
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- Это переназначенная кнопка Esc на jj
vim.keymap.set("i", "jj", "<Esc>")


vim.keymap.set("n", "<M-Tab>", vim.cmd.BufferNext, { desc = "Next Buffer" })

-- vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
-- vim.keymap.set('n', '<C-p>', builtin.git_files, {})
-- vim.keymap.set('n', '<leader>ps', function()
-- 	builtin.grep_string({search = vim.fn.input("Grep > ")});
-- end)
-- vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
--

vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)

wk.register({
    mode = "n",
    ["<leader>"] = {
        a = {
            name = "Flutter Commands",
            s = { vim.cmd.FlutterRun, "Flutter Run" },
            r = { vim.cmd.FlutterRestart, "Flutter Restart" },
            e = { vim.cmd.FlutterEmulators, "Flutter Emulators" },
            p = { vim.cmd.FlutterPubGet, "Flutter Pub Get" },
        }
        ,
        b = {
            name = "Buffer",
            c = { vim.cmd.BufferClose, "BufferClose" },
        },

        d = {
            name = "Debug",
            b = { ":lua require'dap'.toggle_breakpoint()<CR>", "toggle breakpoint" }
        },

        f = {
            name = "Hop Commands",
            w = { vim.cmd.HopWord, "Hop Word" },
            c = { vim.cmd.HopChar1, "Hop Char" },
            a = { vim.cmd.HopAnywhere, "Hop Anywhere" },
        },

        o = {
            name = "Open...",
            t = { vim.cmd.ToggleTerm, "Open Terminal" },
            r = { "<cmd>lua require('telescope').extensions.recent_files.pick()<CR>", "Open Recents" },

        },
        p = {
            name = "Telescope",
            v = { vim.cmd.Ex, "Explorer" },
            f = { require('telescope.builtin').find_files, "Find files" },
            s = { function()
                require('telescope.builtin').grep_string({ search = vim.fn.input("Grep > ") });
            end, "Grep search" },

        },

        P = {
            name = "Projects",
            p = { vim.cmd.ProjectMgr, "Start ProjectMgr" },
        },

        n = {
            name = "Neovim Commands",
            p = { ":PackerSync<CR>", "PackerSync" },
        },

        s = {
            name = "Search",
            s = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Search word and Replace in buffer" },

        },

        y = {
            name = "Copy",
            y = { "\"+y", "Copy local buffer" },
            Y = { "\"+Y", "Copy global buffer" }

        },


        u = {
            vim.cmd.UndotreeToggle, "Undo Tree"
        },
        v = {
            name = "Lsp",
            w = { function() vim.lsp.buf.workspace_symbol() end, "Lsp workspace" },
            d = { function() vim.diagnostic.open_float() end, "Diagnostic open_float" },
            a = { function() vim.lsp.buf.code_action() end, "Code action" },
            l = { function() vim.lsp.buf.references() end, "references" },
            r = { function() vim.lsp.buf.rename() end, "lsp rename" },
            h = { function() vim.lsp.buf.signature_help() end, "signature help" },
        },

        w = {
            name = "Windows",
            m = { vim.cmd.WindowsMaximize, "Windows Maximize" },
            e = { vim.cmd.WindowsEqualize, "Windows Equalize" },
            v = { vim.cmd.WindowsMaximizeVertically, "Windows Maximize Vertically" },
            h = { vim.cmd.WindowsMaximizeHorizontally, "Windows Maximize Horizontally" },
            r = { vim.cmd.WinResizerStartResize, "Resize Windows" },

        },

    }
})

wk.register({
    mode = 'v',
    ["<leader>"] = {
        y = {
            name = "Copy",
            y = { "\"+y", "Copy local buffer" },
            Y = { "\"+Y", "Copy global buffer" }

        },
        f = {
            name = "Hop Commands",
            w = { vim.cmd.HopWord, "Hop Word" },
            c = { vim.cmd.HopChar1, "Hop Char" },
            a = { vim.cmd.HopAnywhere, "Hop Anywhere" },
        },
    }
})
