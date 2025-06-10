return {
    {
        "github/copilot.vim",
        event = 'VeryLazy',
        config = function()
            vim.keymap.set('n', "<leader>c",
                function()
                    if vim.b.copilot_enabled == true or vim.b.copilot_enabled == nil then
                        vim.cmd("Copilot disable")
                        vim.b.copilot_enabled = false
                        print("Copilot disabled")
                    elseif vim.b.copilot_enabled == false then
                        vim.cmd("Copilot enable")
                        vim.b.copilot_enabled = true
                        print("Copilot enabled")
                    end
                end,
                { noremap = false, silent = true, desc = "Toggle Copilot" }
            )
        end,
    },
    -- vim.keymap.set('n', "<leader>c",
    --     function()
    --         -- Your original logic should now work correctly because b:copilot_enabled will always be defined
    --         if vim.b.copilot_enabled then
    --             vim.cmd("Copilot disable")
    --             vim.b.copilot_enabled = false
    --             print("Copilot disabled")
    --         else
    --             vim.cmd("Copilot enable")
    --             vim.b.copilot_enabled = true
    --             print("Copilot enabled")
    --         end
    --     end, { noremap = true, silent = true }
    -- ),

    -- vim.keymap.set('n', "<leader>c",
    --     function()
    --         local is_copilot_enabled = vim.b.copilot_enabled ~= nil and vim.b.copilot_enabled
    --         if is_copilot_enabled then
    --             vim.cmd("Copilot disable")
    --             vim.b.copilot_enabled = false
    --             -- print("Copilot disabled")
    --             -- print("DEBUG: b.copilot_enabled = " .. tostring(vim.b.copilot_enabled))
    --         else
    --             vim.cmd("Copilot enable")
    --             vim.b.copilot_enabled = true
    --             -- print("Copilot enabled")
    --             -- print("DEBUG: b.copilot_enabled = " .. tostring(vim.b.copilot_enabled))
    --         end
    --     end),
    {
        "nvim-lua/plenary.nvim",
        name = "plenary"
    },
}
