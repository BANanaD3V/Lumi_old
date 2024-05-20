{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    highlight-undo-nvim
  ];
  extraConfigLua = ''
        require("highlight-undo").setup({

    hlgroup = "CurSearch",
          duration = 150,
          keymaps = {
            { "n", "u",     "undo", {} }, -- If you remap undo/redo, change this
            { "n", "<C-r>", "redo", {} },
          },
    })

              -- Also flash on undo.
              vim.api.nvim_create_autocmd("TextYankPost", {
                desc = "Highlight yanked text",
                pattern = "*",
                callback = function() vim.highlight.on_yank() end,
              })
  '';
}
