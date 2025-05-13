-- can you make the add keymaps so that when I do them it just asks for an input in the neovim command line and when I write my commit message and press enter it automatically commits it. Because right now when I press the keymap it opens the COMMIT_EDITMSG file which I don't want to see, because when I use git in the command line I do $ git commit -m "<mycommitmessage>". Also the git push keymaps doesn't ask for which branch to which, I want to enter (e.g. origin master) when I press the keymaps, because I do $ git push master master when I push to my GitHub repos. However I would like to know if I should set a mainstream for git push, which could be better.
return {
    "tpope/vim-fugitive",
    config = function()
        -- Global fugitive mappings (work anywhere)
        vim.keymap.set("n", "<leader>gs", ":Git<CR>", { desc = "Git status" })
--        vim.keymap.set("n", "<leader>ga", ":Git add .<CR>", { desc = "Git add all" })
--        vim.keymap.set("n", "<leader>gA", ":Git add %<CR>", { desc = "Git add current file" })
--        vim.keymap.set("n", "<leader>gu", ":Git reset -q %<CR>", { desc = "Git unstage current file" })
--        vim.keymap.set("n", "<leader>gc", ":Git commit<CR>", { desc = "Git commit" })
--        vim.keymap.set("n", "<leader>gp", ":Git push<CR>", { desc = "Git push" })
--        vim.keymap.set("n", "<leader>gP", ":Git pull --rebase<CR>", { desc = "Git pull (rebase)" })
--        vim.keymap.set("n", "<leader>gb", ":Git blame<CR>", { desc = "Git blame" })
--        vim.keymap.set("n", "<leader>gl", ":Git log<CR>", { desc = "Git log" })
--        vim.keymap.set("n", "<leader>gd", ":Gdiffsplit<CR>", { desc = "Git diff" })

        -- Optional: Add with specific file/path
        vim.keymap.set("n", "<leader>gaf", ":Git add ", { desc = "Git add (specify path)" })

        -- Optional: Add push with upstream setting
        vim.keymap.set("n", "<leader>gpt", ":Git push -u origin ", { desc = "Push and set upstream" })

        -- Diff mappings (for merge conflicts)
        vim.keymap.set("n", "gu", ":diffget //2<CR>", { desc = "Get diff from left (upstream)" })
        vim.keymap.set("n", "gh", ":diffget //3<CR>", { desc = "Get diff from right (head)" })

        -- Create autocmd group for fugitive buffer-specific mappings
        local jaysh_Fugitive = vim.api.nvim_create_augroup("jaysh_Fugitive", { clear = true })

        -- Set fugitive buffer-specific mappings
        vim.api.nvim_create_autocmd("FileType", {
            group = jaysh_Fugitive,
            pattern = "fugitive",
            callback = function()
                local opts = { buffer = true, remap = false }

                -- Mappings specific to the fugitive status buffer
                -- Stage/unstage files under cursor in fugitive status window
                vim.keymap.set("n", "s", ":Git add %<CR>", opts)      -- Stage the file under cursor
                vim.keymap.set("n", "S", ":Git add .<CR>", opts)      -- Stage all files
                vim.keymap.set("n", "u", ":Git reset -q %<CR>", opts) -- Unstage file under cursor
                vim.keymap.set("n", "U", ":Git reset -q<CR>", opts)   -- Unstage all files

                -- Other common operations
                vim.keymap.set("n", "cc", ":Git commit<CR>", opts)
                vim.keymap.set("n", "ca", ":Git commit --amend<CR>", opts)
                vim.keymap.set("n", "p", ":Git push<CR>", opts)
                vim.keymap.set("n", "P", ":Git pull --rebase<CR>", opts)
                vim.keymap.set("n", "r", ":Git rebase<CR>", opts)
                vim.keymap.set("n", "f", ":Git fetch<CR>", opts)
                vim.keymap.set("n", "o", ":Git checkout<CR>", opts)
                vim.keymap.set("n", "b", ":Git branch<CR>", opts)
                vim.keymap.set("n", "d", ":Gdiffsplit<CR>", opts)

                -- Add more fugitive-buffer specific mappings as needed
            end,
        })

        -- Set git status buffer specific mappings with more precise pattern
        vim.api.nvim_create_autocmd("BufWinEnter", {
            group = jaysh_Fugitive,
            pattern = "*.git/index",
            callback = function()
                -- These are specifically for the git status window
                local opts = { buffer = true, remap = false }

                -- In fugitive status buffer, use s to stage/unstage
                vim.keymap.set("n", "-", ":Silent Git add %<CR>", opts) -- Stage the file under cursor
                vim.keymap.set("v", "-", ":Silent Git add %<CR>", opts) -- Stage visual selection

                -- Helper command for silent execution
                vim.cmd([[command! -nargs=1 Silent execute ':silent !' . <q-args> | execute ':redraw!']])
            end,
        })
    end
}
