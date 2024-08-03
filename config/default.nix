{pkgs, ...}: {
  # Import all your configuration modules here
  imports = [
    ./plugins
    ./colorscheme.nix
    # ./autocmds.nix
  ];
  config = {
    globals = {
      mapleader = " ";
      vinsyn_embed = "alpPrj";
    };
    clipboard.register = "unnamedplus";
    opts = {
      showtabline = 2;
      breakindent = true;
      shiftwidth = 2;
      number = true;
      relativenumber = false;
      cmdheight = 0;
      fillchars.eob = " ";
      scrolloff = 999;
      foldenable = true;
      foldlevel = 99;
      foldlevelstart = 99;
      writebackup = false;
      virtualedit = "block";
      undofile = true;
      inccommand = "split";
      incsearch = true;
      timeoutlen = 500;
      termguicolors = true;
      smartindent = true;
      cursorline = true;
      cursorlineopt = "number";
      listchars = {
        tab = "-->";
      };
    };
    performance = {
      combinePlugins = {
        enable = true;
      };
    };
  };
}
