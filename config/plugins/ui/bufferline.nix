{
  config,
  lib,
  ...
}: {
  plugins.bufferline = {
    enable = true;
    diagnostics = "nvim_lsp";
    separatorStyle = "thin"; # “slant”, “padded_slant”, “slope”, “padded_slope”, “thick”, “thin”
    indicator = {
      style = "icon";
    };
    offsets = [
      {
        filetype = "neo-tree";
        text = "File browser";
        highlight = "Directory";
        text_align = "center";
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
