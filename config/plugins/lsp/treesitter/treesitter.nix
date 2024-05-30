{pkgs, ...}: {
  plugins.treesitter = {
    enable = true;
    indent = true;
    folding = true;
    nixvimInjections = true;
    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      nix
      lua
      bash
      python
      typescript
      # tsx-grammar
      javascript
    ];
  };
}
