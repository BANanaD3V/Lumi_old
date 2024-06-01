{pkgs, ...}: {
  plugins.smart-splits = {
    enable = true;
    settings = {
      at_edge = "wrap";
    };
  };

  keymaps = [
    {
      action.__raw = "function() require('smart-splits').move_cursor_left({ at_edge = 'wrap' }) end";
      key = "<C-h>";
      mode = "n";
    }
    {
      action.__raw = "function() require('smart-splits').move_cursor_down({ at_edge = 'wrap' }) end";
      key = "<C-j>";
      mode = "n";
    }
    {
      action.__raw = "function() require('smart-splits').move_cursor_up({ at_edge = 'wrap' }) end";
      key = "<C-k>";
      mode = "n";
    }
    {
      action.__raw = "function() require('smart-splits').move_cursor_right({ at_edge = 'wrap' }) end";
      key = "<C-l>";
      mode = "n";
    }
    {
      action.__raw = "function() require('smart-splits').resize_up() end";
      key = "<C-Up>";
      mode = "n";
    }
    {
      action.__raw = "function() require('smart-splits').resize_down() end";
      key = "<C-Down>";
      mode = "n";
    }
    {
      action.__raw = "function() require('smart-splits').resize_left() end";
      key = "<C-Left>";
      mode = "n";
    }
    {
      action.__raw = "function() require('smart-splits').resize_right() end";
      key = "<C-Right>";
      mode = "n";
    }
  ];
}
