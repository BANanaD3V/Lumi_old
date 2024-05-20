{pkgs, ...}: {
  plugins.smart-splits = {
    enable = true;
  };

  keymaps = [
    {
      action = "function() require('smart-splits').move_cursor_left() end";
      key = "<C-h>";
      mode = "n";
      lua = true;
    }
    {
      action = "function() require('smart-splits').move_cursor_down() end";
      key = "<C-j>";
      mode = "n";
      lua = true;
    }
    {
      action = "function() require('smart-splits').move_cursor_up() end";
      key = "<C-k>";
      mode = "n";
      lua = true;
    }
    {
      action = "function() require('smart-splits').move_cursor_right() end";
      key = "<C-l>";
      mode = "n";
      lua = true;
    }
    {
      action = "function() require('smart-splits').resize_up() end";
      key = "<C-Up>";
      mode = "n";
      lua = true;
    }
    {
      action = "function() require('smart-splits').resize_down() end";
      key = "<C-Down>";
      mode = "n";
      lua = true;
    }
    {
      action = "function() require('smart-splits').resize_left() end";
      key = "<C-Left>";
      mode = "n";
      lua = true;
    }
    {
      action = "function() require('smart-splits').resize_right() end";
      key = "<C-Right>";
      mode = "n";
      lua = true;
    }
  ];
}
