{pkgs, ...}: {
  plugins.hop = {
    enable = true;
  };
  keymaps = [
    {
      action = "<cmd>HopWord<CR>";
      key = "<enter>";
      mode = "n";
      options = {
        silent = true;
        desc = "Hop for words";
      };
    }
  ];
}
