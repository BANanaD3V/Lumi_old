{...}: {
  extraConfigLua = ''
    local colors = require("catppuccin.palettes").get_palette()
    local TelescopeColor = {
    	TelescopeMatching = { fg = colors.flamingo },
    	TelescopeSelection = { fg = colors.text, bg = colors.surface0, bold = true },

    	TelescopePromptPrefix = { bg = colors.surface0 },
    	TelescopePromptNormal = { bg = colors.surface0 },
    	TelescopeResultsNormal = { bg = colors.mantle },
    	TelescopePreviewNormal = { bg = colors.mantle },
    	TelescopePromptBorder = { bg = colors.surface0, fg = colors.surface0 },
    	TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
    	TelescopePreviewBorder = { bg = colors.mantle, fg = colors.mantle },
    	TelescopePromptTitle = { bg = colors.pink, fg = colors.mantle },
    	TelescopeResultsTitle = { fg = colors.mantle },
    	TelescopePreviewTitle = { bg = colors.green, fg = colors.mantle },
    }

    for hl, col in pairs(TelescopeColor) do
    	vim.api.nvim_set_hl(0, hl, col)
    end
  '';
  plugins = {
    telescope = {
      enable = true;
      # style = "nvchad";
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
