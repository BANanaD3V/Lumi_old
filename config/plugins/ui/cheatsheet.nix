{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    (pkgs.vimUtils.buildVimPlugin {
      pname = "nvcheatsheet.nvim";
      version = "2024-02-27";
      src = pkgs.fetchFromGitHub {
        owner = "smartinellimarco";
        repo = "nvcheatsheet.nvim";
        rev = "618850d2a14ac82f8d9bc560cce923d728e7424a";
        sha256 = "sha256-SaYgT/ic2HeMWrSC+JdwD8q4nK9erIbDP1EzVNL5Wyk=";
      };
    })
  ];
  extraConfigLua = ''
          local nvcheatsheet = require('nvcheatsheet')
                  nvcheatsheet.setup(
              {
                -- Default header
                header = {
                  "                                      ",
                  "                                      ",
                  "                                      ",
                  "█▀▀ █░█ █▀▀ ▄▀█ ▀█▀ █▀ █░█ █▀▀ █▀▀ ▀█▀",
                  "█▄▄ █▀█ ██▄ █▀█ ░█░ ▄█ █▀█ ██▄ ██▄ ░█░",
                  "                                      ",
                  "                                      ",
                  "                                      ",
                },
                -- Example keymaps (this doesn't create any)
                keymaps = {
                  ['Oil'] = {
                    { 'Toggle oil (closes without saving)', '<leader>q' },
                    { 'Select entry', '⏎' },
                    { 'Select entry', 'l' },
                    { 'Go to parent', 'h' },
                    { 'Open vertical split', '⌃v' },
                    { 'Open horizontal split', '⌃x' },
                    { 'Go to current working directory', '.' },
                  },
                  ['Cmp'] = {
                    { 'Select entry', '⌃f' },
                    { 'Next result - Jump to next snippet placeholder', '⌃n' },
                    { 'Previous result - Jump to previous snippet placeholder', '⌃p' },
                    { 'Scroll up in preview', '⌃u' },
                    { 'Scroll down in preview', '⌃d' },
                    { 'Abort autocompletion', '⌃e' },
                  },
                  ['Comment'] = {
                    { 'Comment line toggle', 'gcc' },
                    { 'Comment block toggle', 'gbc' },
                    { 'Comment visual selection', 'gc' },
                    { 'Comment visual selection using block delimiters', 'gb' },
                    { 'Comment out text object line wise', 'gc<motion>' },
                    { 'Comment out text object block wise', 'gb<motion>' },
                    { 'Add comment on the line above', 'gcO' },
                    { 'Add comment on the line below', 'gco' },
                    { 'Add comment at the end of line', 'gcA' },
                  },
                },
              }
              )

      local colors = require("catppuccin.palettes").get_palette "mocha"
          local CheatsheetColor = {
          	NvChAsciiHeader = { fg = colors.lavender },
          	NvChSection = { bg = colors.base },

      NvCheatsheetWhite = { bg = colors.white, fg = colors.crust },
      NvCheatsheetGray = { bg = colors.teal, fg = colors.crust  },
      NvCheatsheetBlue = { bg = colors.blue, fg = colors.crust  },
      NvCheatsheetCyan = { bg = colors.sapphire, fg = colors.crust  },
      NvCheatsheetRed = { bg = colors.red, fg = colors.crust  },
      NvCheatsheetGreen = { bg = colors.green, fg = colors.crust  },
      NvCheatsheetYellow = { bg = colors.yellow, fg = colors.crust  },
      NvCheatsheetOrange = { bg = colors.peach, fg = colors.crust  },
      NvCheatsheetPurple = { bg = colors.mauve, fg = colors.crust  },
      NvCheatsheetMagenta = { bg = colors.pink, fg = colors.crust  },
    }

          for hl, col in pairs(CheatsheetColor) do
          	vim.api.nvim_set_hl(0, hl, col)
          end

              vim.keymap.set('n', '<leader>uc', nvcheatsheet.toggle)
  '';
}
