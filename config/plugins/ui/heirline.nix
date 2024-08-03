{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    heirline-nvim
    (pkgs.vimUtils.buildVimPlugin {
      pname = "heirline-components.nvim";
      version = "2024-29-05";
      src = pkgs.fetchFromGitHub {
        owner = "Zeioth";
        repo = "heirline-components.nvim";
        rev = "eabdefa5d62de5c104291a5fc53ef09a5e68a1d8";
        sha256 = "sha256-YrujPt6I7Ie1Nrd0pS0DOWCf8ldlTzKGiwKrkPqQ+Js=";
      };
    })
  ];
  extraConfigLua = ''

    function buffer_picker(callback)
      local tabline = require("heirline").tabline
      -- if buflist then
      local prev_showtabline = vim.opt.showtabline:get()
      if prev_showtabline ~= 2 then vim.opt.showtabline = 2 end
      vim.cmd.redrawtabline()
      ---@diagnostic disable-next-line: undefined-field
      local buflist = tabline and tabline._buflist and tabline._buflist[1]
      if buflist then
        buflist._picker_labels = {}
        buflist._show_picker = true
        vim.cmd.redrawtabline()
        local char = vim.fn.getcharstr()
        local bufnr = buflist._picker_labels[char]
        if bufnr then callback(bufnr) end
        buflist._show_picker = false
      end
      if prev_showtabline ~= 2 then vim.opt.showtabline = prev_showtabline end
      vim.cmd.redrawtabline()
      -- end
    end


        local lib = require "heirline-components.all"
        local heirline = require("heirline")
        local heirline_components = require "heirline-components.all"
        heirline_components.init.subscribe_to_events()
        heirline.load_colors(heirline_components.hl.get_colors())
        heirline.setup({
          tabline = {
              lib.component.tabline_conditional_padding(),
              lib.component.tabline_buffers(),
              lib.component.fill { hl = { bg = "bg", fg = "fg" } },
              lib.component.tabline_tabpages()
            },
            statusline = { -- UI statusbar
              hl = { fg = "fg", bg = "bg" },
              lib.component.mode(),
              lib.component.git_branch(),
              lib.component.file_info(),
              lib.component.git_diff(),
              lib.component.diagnostics(),
              lib.component.fill(),
              lib.component.cmd_info(),
              lib.component.fill(),
              lib.component.lsp(),
              lib.component.compiler_state(),
              lib.component.virtual_env(),
              lib.component.nav(),
              lib.component.mode { surround = { separator = "right" } },
            },
           opts = {
              disable_winbar_cb = function(args) -- We do this to avoid showing it on the greeter.
                local is_disabled = not require("heirline-components.buffer").is_valid(args.buf) or
                    lib.condition.buffer_matches({
                      buftype = { "terminal", "prompt", "nofile", "help", "quickfix" },
                      filetype = { "NvimTree", "neo%-tree", "dashboard", "Outline", "aerial" },
                    }, args.buf)
                return is_disabled
              end,
            },
        })
  '';

  keymaps = [
    {
      action.__raw = ''
        function()
          vim.cmd "wa"
        end
      '';
      key = "<leader>ba";
      lua = true;
      options = {
        silent = true;
        desc = "Write all changed buffers";
      };
    }
    {
      action.__raw = ''
        function()
            buffer_picker(function(bufnr)
              vim.cmd.split()
              vim.api.nvim_win_set_buf(0, bufnr)
            end)
          end
      '';
      key = "<leader>b\\";
      lua = true;
      options = {
        silent = true;
        desc = "Split buffer from tabline horizontally";
      };
    }
    {
      action.__raw = ''
        function()
            buffer_picker(function(bufnr)
              vim.cmd.vsplit()
              vim.api.nvim_win_set_buf(0, bufnr)
            end)
          end
      '';
      key = "<leader>b|";
      lua = true;
      options = {
        silent = true;
        desc = "Split buffer from tabline vertically";
      };
    }
    {
      action.__raw = ''
        function()
          buffer_picker(function(bufnr)
            vim.api.nvim_win_set_buf(0, bufnr)
          end)
        end
      '';
      key = "<leader>bb";
      lua = true;
      options = {
        silent = true;
        desc = "Select buffer from tabline";
      };
    }
    {
      action.__raw = ''
        function()
          buffer_picker(function(bufnr)
            local buftype = vim.api.nvim_get_option_value("buftype", { buf = bufnr })
            vim.cmd(("silent! %s %d"):format((force or buftype == "terminal") and "bdelete!" or "confirm bdelete", bufnr))
          end)
        end
      '';
      key = "<leader>bd";
      lua = true;
      options = {
        silent = true;
        desc = "Delete buffer from tabline";
      };
    }
    {
      action.__raw = ''
        function()
          local current = vim.api.nvim_get_current_buf()
          for _, bufnr in ipairs(vim.t.bufs) do
            if bufnr ~= current then
              local buftype = vim.api.nvim_get_option_value("buftype", { buf = bufnr })
              vim.cmd(("silent! %s %d"):format((force or buftype == "terminal") and "bdelete!" or "confirm bdelete", bufnr))
            end
          end
        end
      '';
      key = "<leader>bc";
      lua = true;
      options = {
        silent = true;
        desc = "Close all buffers except current";
      };
    }
    {
      action.__raw = ''
        function()
          local current = vim.api.nvim_get_current_buf()
          for _, bufnr in ipairs(vim.t.bufs) do
            local buftype = vim.api.nvim_get_option_value("buftype", { buf = bufnr })
            vim.cmd(("silent! %s %d"):format((force or buftype == "terminal") and "bdelete!" or "confirm bdelete", bufnr))
          end
        end
      '';
      key = "<leader>bC";
      lua = true;
      options = {
        silent = true;
        desc = "Close all buffers";
      };
    }
  ];
}
