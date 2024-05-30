{...}: {
  plugins = {
    lsp-format = {
      enable = true;
    };
    lsp = {
      enable = true;

      servers = {
        lua-ls = {
          enable = true;
          settings.telemetry.enable = false;
          extraOptions = {
            hint.enable = true;
          };
        };
        nil_ls.enable = true;
        emmet_ls = {
          enable = true;
          filetypes = ["css" "eruby" "html" "javascript" "javascriptreact" "less" "sass" "scss" "svelte" "pug" "typescriptreact" "vue"];
        };
        tsserver = {
          enable = true;
        };
        eslint = {enable = true;};
      };
    };
    which-key.registrations = {
      "<leader>l".name = " LSP";
    };
  };
  keymaps = [
    {
      action = "require('actions-preview').code_actions";
      lua = true;
      key = "<leader>la";
      options = {
        silent = true;
        desc = "LSP code actions";
      };
    }
    {
      action = "require('telescope.builtin').lsp_document_symbols";
      lua = true;
      key = "<leader>ls";
      options = {
        silent = true;
        desc = "Search symbol in buffer";
      };
    }
    {
      action = "function()
           vim.lsp.inlay_hint(0, nil)
         end";
      lua = true;
      key = "<leader>lh";
      options = {
        silent = true;
        desc = "Toggle inlay hints";
      };
    }
  ];
  extraConfigLua = ''
    vim.diagnostic.config({update_in_insert = true})
  '';
}
