{...}: {
  plugins.neo-tree = {
    enable = true;
    popupBorderStyle = "NC";
    filesystem = {
      hijackNetrwBehavior = "open_current";
      followCurrentFile = {
        enabled = true;
        leaveDirsOpen = false;
      };
    };
    buffers = {
      followCurrentFile = {
        enabled = true;
        leaveDirsOpen = false;
      };
    };
  };
  keymaps = [
    {
      action = "<cmd>Neotree toggle<CR>";
      key = "<leader>e";
      mode = "n";
      options = {
        silent = true;
        desc = "Toggle neotree";
      };
    }
    {
      action.__raw = ''
          function()
          if vim.bo.filetype == "neo-tree" then
            vim.cmd.wincmd "p"
          else
            vim.cmd.Neotree "focus"
          end
        end
      '';
      lua = true;
      key = "<leader>o";
      mode = "n";
      options = {
        desc = "Focus neotree";
        silent = true;
      };
    }
  ];
}
