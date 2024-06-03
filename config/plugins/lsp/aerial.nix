{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    aerial-nvim
  ];
  extraConfigLua = ''
        require("aerial").setup({
      -- optionally use on_attach to set keymaps when aerial has attached to a buffer
      on_attach = function(bufnr)
        -- Jump forwards/backwards with '{' and '}'
        vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
        vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
      end,
    })  '';
  keymaps = [
    {
      action = "<cmd>AerialToggle!<CR>";
      key = "<leader>a";
      mode = "n";
    }
  ];
}
