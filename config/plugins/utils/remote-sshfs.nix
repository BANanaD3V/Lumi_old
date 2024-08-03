{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    (pkgs.vimUtils.buildVimPlugin {
      pname = "remote-sshfs.nvim";
      version = "2024-28-05";
      src = pkgs.fetchFromGitHub {
        owner = "nosduco";
        repo = "remote-sshfs.nvim";
        rev = "e335a7a33ea1115ca6aa860e9f510ca8caf65833";
        sha256 = "sha256-yZQleP4Q0J4u4dkXQEl1UV/VfQCGAEi9gbpd8XFbk6A=";
      };
    })
  ];
  extraConfigLua =
    /*
    lua
    */
    ''
      require('remote-sshfs').setup()
    '';
}
