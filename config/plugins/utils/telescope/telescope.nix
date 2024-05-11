{...}: {
  plugins = {
    telescope = {
      enable = true;
      extensions = {
        fzf-native = {
          enable = true;
        };
      };
      keymaps = {
        "<leader>ff" = {
          action = "find_files";
          options.desc = "Telescope Files";
        };
        "<leader>fg" = {
          action = "live_grep";
          options.desc = "Telescope Grep";
        };
      };
      settings.defaults = {
        mappings = {
          i = {
            "<esc>" = {
              __raw = ''
                function(...)
                  return require("telescope.actions").close(...)
                end'';
            };
          };
        };
      };
    };
    which-key.registrations = {
      "<leader>f".name = " Find";
    };
  };
}
