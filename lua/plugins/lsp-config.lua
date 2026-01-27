return {

    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",

        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {"lua_ls","clangd","cmake","cssls",
                                    "html","pyright","ts_ls","tailwindcss",},
                automatic_enable=false,
            })
            vim.diagnostic.config({
                virtual_text = true,
                underline = true
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        --event = { "BufReadPre", "BufNewFile" },
        ft = {
            "c",                -- C
            "cpp",              -- C++
            "objc",             -- Objective-C
            "objcpp",           -- Objective-C++
            "python",           -- Python
            "javascript",       -- JavaScript
            "javascriptreact",  -- React/JSX
            "typescript",       -- TypeScript 
            "typescriptreact",  -- TSX
            "html",             -- HTML
            "css",              -- CSS
            "scss",             -- SCSS (Sass)
            "lua"               -- Lua
    },
        dependencies = {
            'saghen/blink.cmp',
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },

        opts = {
            servers = {
                clangd={
                    cmd = {
                        vim.fn.stdpath("data") .. "/mason/bin/clangd",
                        "--background-index", --scan all files for info and definitions
                        "--clang-tidy=false",
                        "--header-insertion=iwyu",   -- Auto-import headers 
                        "--completion-style=detailed", -- richer completion info
                        "--function-arg-placeholders=true", -- Add placeholders for fn args"
                        "--query-driver=/usr/bin/g++,/usr/bin/gcc,/usr/bin/*gcc*,/usr/bin/clang",
                    },

                    single_file_support = true,

                    root_dir = function(fname)
                        local util = require("lspconfig.util")
                -- Try standard roots
                        local root = util.root_pattern(".git", "compile_commands.json", "compile_flags.txt")(fname)
                -- DEBUG PRINT: This will show up in :messages
                        if root then
                            return root
                        end
                        local file_dir = vim.fs.dirname(fname)
                        return file_dir
                    end,

                    on_attach = function(client, bufnr)
                        client.server_capabilities.semanticTokensProvider = nil
                    end,

                    init_options = {
                        usePlaceholders = true,
                        completeUnimported = true,
                        clangdFileStatus = true,
                    },

                },

                lua_ls = {
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" }, -- Fixes the warning
                            },
                            workspace = {
                                checkThirdParty = false,
                                -- Make the server aware of Neovim runtime files
                                library = {
                                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                    [vim.fn.stdpath("config") .. "/lua"] = true,
                                },
                            },
                            telemetry = { enable = false },
                        },
                    },
                },
                pyright = {},
                ts_ls = {},
                cssls = {},
                html = {},
            }
        },

        config = function(_, opts)
            local lspconfig = require('lspconfig')
            for server, config in pairs(opts.servers) do
                -- passing config.capabilities to blink.cmp merges with the capabilities in your
                -- `opts[server].capabilities, if you've defined it
                config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
                lspconfig[server].setup(config)
            end
        end
    },
}
