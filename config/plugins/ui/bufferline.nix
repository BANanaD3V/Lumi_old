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
    {
      action = "<cmd>BufferLineCloseOthers<CR>";
      key = "<leader>bc";
      options = {
        silent = true;
        desc = "Close all buffers except current";
      };
    }
    {
      action = "<cmd>BufferLinePickClose<CR>";
      key = "<leader>bC";
      options = {
        silent = true;
        desc = "Delete buffer from tabline";
      };
    }
    {
      action = "<cmd>BufferLineCloseLeft<CR>";
      key = "<leader>bl";
      options = {
        silent = true;
        desc = "Close all buffers to the left";
      };
    }
    {
      action = "<cmd>BufferLineCloseRight<CR>";
      key = "<leader>br";
      options = {
        silent = true;
        desc = "Close all buffers to the right";
      };
    }
    {
      action = "<cmd>BufferLineTogglePin<CR>";
      key = "<leader>bp";
      options = {
        silent = true;
        desc = "Pin current buffer";
      };
    }
    {
      action = ''
        function()
          select_buffer_apply(function(buf_id)
            vim.cmd("horizontal sb" .. buf_id)
          end)
        end
      '';
      lua = true;
      key = "<leader>b\\";
      options = {
        silent = true;
        desc = "Horizontal split buffer from tabline";
      };
    }
  ];
  plugins.which-key.registrations = {
    "<leader>b".name = " Buffers";
  };
}
