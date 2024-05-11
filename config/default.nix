{ pkgs, ... }: {
  # Import all your configuration modules here
  imports = [ ./plugins ];
  config = {

    globals.mapleader = " ";
    clipboard.register = "unnamedplus";
    colorschemes.catppuccin.enable = true;
  };
    options = {
      number = true;
      breakindent = true;
      shiftwidth = 2;
      relativenumber = true;
      cmdheight = 0;
      fillchars.eob = " ";
      scrolloff = 1000;
      foldenable = true;
      foldlevel = 99;
      foldlevelstart = 99;
      writebackup = false;
      virtualedit = "block";
      undofile = true;
      timeoutlen = 500;
      termguicolors = true;
      smartindent = true;
    };
}
