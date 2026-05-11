return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter")
        configs.setup({
            ensure_installed = {"lua", "c", "javascript" , "python" ,"cpp",
                                "go", "gomod", "gowork", "gosum", -- Go ecosystem
                                "rust", "bash", "typescript", "tsx",
                                "html", "css",                    -- Web dev
                                "json", "yaml", "markdown",       -- Configs & Docs
                                "regex", "vim", "vimdoc", "query" -- Core Neovim
            },
            highlight = { enable = true },
            indent = { enable = true }
        })
    end
}
