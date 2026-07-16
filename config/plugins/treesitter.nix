{ pkgs, ... }:
let
  treesitterPackage = pkgs.vimPlugins.nvim-treesitter.withAllGrammars;
in
{
  plugins = {
    treesitter = {
      enable = true;

      package = treesitterPackage;

      nixvimInjections = true;
      nixGrammars = false;

      folding.enable = true;
      settings = {
        highlight.enable = true;
        indent.enable = true;
      };
    };

    treesitter-refactor = {
      enable = true;
      package = treesitterPackage;

      settings = {
        highlightDefinitions = {
          enable = true;
          clear_on_cursor_move = false;
        };
      };
    };
  };
}
