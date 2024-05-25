{config, ...}: {
  plugins.toggleterm = {
    enable = true;
    settings = {
      size = ''
        function(term)
          if term.direction == "horizontal" then
            return 15
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
          end
        end
      '';
      hide_numbers = true;
      shade_terminals = false;
      start_in_insert = true;
      terminal_mappings = true;
      persist_mode = true;
      insert_mappings = false;
      close_on_exit = true;
      shell = "zsh";
      direction = "horizontal";
      auto_scroll = true;
      float_opts = {
        border = "rounded";
        title_pos = "center";
        winblend = 0;
      };
      winbar = {
        enabled = false;
        name_formatter = ''
          function(term)
            return term.name
          end
        '';
      };
    };
  };
  plugins.which-key.registrations = {
    "<leader>t".name = " Terminal";
  };
  keymaps = [
    {
      action = "<cmd>ToggleTerm direction=float name=Terminal<cr>";
      key = "<leader>tt";
      options = {
        silent = true;
        desc = "Toggleterm float";
      };
    }
    {
      action = "<cmd>ToggleTerm direction=horizontal<cr>";
      key = "<leader>th";
      options = {
        silent = true;
        desc = "Togleterm horizontal split";
      };
    }
    {
      action = "<cmd>ToggleTerm direction=vertical<cr>";
      key = "<leader>tv";
      options = {
        silent = true;
        desc = "Toggleterm vertical split";
      };
    }
  ];
}
