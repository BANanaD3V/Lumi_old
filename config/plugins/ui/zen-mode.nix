{...}: {
  plugins.zen-mode = {
    enable = true;
    settings = {
      plugins = {
        gitsigns = {
          enabled = true;
        };
        options = {
          enabled = true;
          ruler = false;
          showcmd = false;
        };
        tmux = {
          enabled = false;
        };
        twilight = {
          enabled = false;
        };
      };
      window = {
        backdrop = 0.95;
        height = 1;
        options = {
          signcolumn = "no";
        };
        width = 0.8;
      };
    };
  };
}
