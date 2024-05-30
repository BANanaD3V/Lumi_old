{...}: {
  imports = [
    ./lsp.nix
    ./coq.nix
    ./lint.nix
    ./none-ls.nix
    ./nvim-cmp.nix
    ./treesitter
    ./typescript.nix
    ./lspsaga.nix
    ./conform-nvim.nix
    ./trouble.nix
    ./smart-splits.nix
    ./actions-preview.nix
    ./nvim-autopairs.nix
  ];
}
