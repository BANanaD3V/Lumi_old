{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    otter-nvim
  ];

  extraConfigLua = ''
    require("otter").activate({ "lua" }, true, true, nil)
  '';
}
