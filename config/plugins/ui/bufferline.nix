{...}: {
  plugins.bufferline = {
    enable = true;
    diagnostics = "nvim_lsp";
    highlights = "require(\"catppuccin.groups.integrations.bufferline\").get()";
    separatorStyle = "thin"; # “slant”, “padded_slant”, “slope”, “padded_slope”, “thick”, “thin”
    offsets = [
      {
        filetype = "neo-tree";
        text = "Neo-tree";
        highlight = "Directory";
        text_align = "left";
      }
    ];
  };
  keymaps = [
    {
      action = "<cmd>BufferLinePick<CR>";
      key = "<leader>bb";
      options = {
        silent = true;
        desc = "Select buffer from tabline";
      };
    }
  ];
  plugins.which-key.registrations = {
    "<leader>b".name = " Buffers";
  };
}
