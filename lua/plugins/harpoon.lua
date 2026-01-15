return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()

    --harpoon keymaps
    vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "harpoon: [A]dd file" })
    vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "harpoon: Toggle [E]ditor" })
    vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "harpoon: Go to file [1]" })
    vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "harpoon: Go to file [2]" })
    vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "harpoon: Go to file [3]" })
    vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "harpoon: Go to file [4]" })
    vim.keymap.set("n", "<leader>p", function() harpoon:list():prev() end, { desc = "harpoon: [P]revious file" })
    vim.keymap.set("n", "<leader>n", function() harpoon:list():next() end, { desc = "harpoon: [N]ext file" })



  end,
}
