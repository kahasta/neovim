local wk = require("which-key")
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

-- Nvim-tree file Explorer
vim.keymap.set("n", "<C-n>", "<cmd> Neotree %:h <CR>", { desc = "Next Buffer" })

-- vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
-- vim.keymap.set('n', '<C-p>', builtin.git_files, {})
-- vim.keymap.set('n', '<leader>ps', function()
-- 	builtin.grep_string({search = vim.fn.input("Grep > ")});
-- end)
-- vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
--

vim.keymap.set('n', '<F2>', "<cmd>lua vim.diagnostic.goto_next()<CR>")

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
            o = { vim.cmd.FlutterOutlineToggle, "Flutter Outline" },
            p = { vim.cmd.FlutterPubGet, "Flutter Pub Get" },
        }
        ,
        b = {
            name = "Buffer",
            b = { "<cmd> Telescope buffers <CR>", "Show open Buffers" },
            c = { vim.cmd.BufferClose, "BufferClose" },
            C = { "<cmd>BufferClose!<CR>", "BufferClose --force" }
        },

        d = {
            name = "Debug",
            b = { ":lua require'dap'.toggle_breakpoint()<CR>", "toggle breakpoint" }
        },

        f = {
            name = "Flash Commands",
            j = { function()
                require("flash").jump()
            end, "Flash jump" },
        },

        o = {
            name = "Open...",
            t = { vim.cmd.ToggleTerm, "Open Terminal" },
            r = { "<cmd>lua require('telescope').extensions.recent_files.pick()<CR>", "Open Recents" },

        },
        p = {
            name = "Telescope",
            -- v = { '<cmd> NvimTreeFindFileToggle %:h <CR>', "Explorer" },
            v = { '<cmd> Neotree %:h <CR>', "Explorer" },
            f = { function()
                require('telescope.builtin').find_files({ cwd = require('telescope.utils').buffer_dir() })
            end, "Find files in current dir" },
            p = { function()
                require('telescope.builtin').find_files()
            end, "Find files in project directory" },
            a = { require('telescope').extensions.live_grep_args.live_grep_args, "Find all" },
            s = { function()
                require('telescope.builtin').grep_string({ search = vim.fn.input("Grep > ") });
            end, "Grep search" },
            h = { "<cmd> Telescope help_tags <CR>", "Help page" },
            z = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },

        },

        P = {
            name = "Projects",
            p = { vim.cmd.ProjectMgr, "Start ProjectMgr" },
        },

        m = {
            name = "Bookmarks",
            a = { ":lua require'harpoon.mark'.add_file()<CR>", "Add bookmark" },
            l = { ":lua require'harpoon.ui'.toggle_quick_menu()<CR>", "Open bookmarks" },

        },

        n = {
            name = "Neovim Commands",
            l = { ":Lazy<CR>", "Lazy" },
            t = { vim.cmd.TransparentToggle, "Transparent Toggle" },
        },

        s = {
            name = "Search",
            s = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Search word and Replace in buffer" },
        },

        t = {
            name = "Themes",
            t = { ":lua require'themeCycler'.open()<CR>", "Themes choose" },
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
            e = { "<cmd>Telescope diagnostics<CR>", "Telescope errors, warnings etc" },
            l = { function() vim.lsp.buf.references() end, "references" },
            r = { function() vim.lsp.buf.rename() end, "lsp rename" },
            h = { function() vim.lsp.buf.signature_help() end, "signature help" },
            o = { vim.cmd.AerialToggle, "Quick navigation Aerial" },
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
            name = "Flash Commands",
            j = { function()
                require("flash").jump()
            end, "Flash jump" },

        },

        z = {
            name = "True Zen in visual",
            v = { ":'<,'>TZNarrow<CR>", "arrow zen visual" },

        },
    }
})
