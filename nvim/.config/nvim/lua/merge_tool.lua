local vim = vim

vim.api.nvim_create_user_command('CallMergeKeepLeft',
    function(opts)
        local lastsearch = vim.fn.getreg('/')
        vim.fn.setreg('/', "<<<<<<<")
        vim.cmd.normal('Ndd')
        vim.fn.setreg('/', "|||||||")
        vim.cmd.normal('nV')
        vim.fn.setreg('/', ">>>>>>>")
        vim.cmd.normal('nd')
        vim.fn.setreg('/', lastsearch)
    end,
    {}
)

vim.api.nvim_create_user_command('CallMergeKeepBoth',
    function(opts)
        local lastsearch = vim.fn.getreg('/')
        vim.fn.setreg('/', "<<<<<<<")
        vim.cmd.normal('Ndd')
        vim.fn.setreg('/', "|||||||")
        vim.cmd.normal('nV')
        vim.fn.setreg('/', "=======")
        vim.cmd.normal('nd')
        vim.fn.setreg('/', ">>>>>>>")
        vim.cmd.normal('ndd')
        vim.fn.setreg('/', lastsearch)
    end,
    {}
)

vim.api.nvim_create_user_command('CallMergeKeepRight',
    function(opts)
        local lastsearch = vim.fn.getreg('/')
        vim.fn.setreg('/', "<<<<<<<")
        vim.cmd.normal('NV')
        vim.fn.setreg('/', "=======")
        vim.cmd.normal('nd')
        vim.fn.setreg('/', ">>>>>>>")
        vim.cmd.normal('ndd')
        vim.fn.setreg('/', lastsearch)
    end,
    {}
)

if vim.api.nvim_get_option_value('diff', { win = 0 }) == true then
    vim.keymap.set('n', '<LEADER>a', function() vim.cmd.CallMergeKeepLeft() end)
    vim.keymap.set('n', '<LEADER>u', function() vim.cmd.CallMergeKeepBoth() end)
    vim.keymap.set('n', '<LEADER>i', function() vim.cmd.CallMergeKeepRight() end)
end
