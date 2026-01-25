{ pkgs, ... }:
let
  # FIX: We define a single, unified Treesitter package here.
  # The "two different versions" error occurs because Nixvim's main module
  # and its sub-plugins (like refactor) can sometimes try to pull in different 
  # derivations of nvim-treesitter (e.g., one with grammars and one without).
  treesitterPackage = pkgs.vimPlugins.nvim-treesitter.withAllGrammars;
in {
  plugins = {
    treesitter = {
      enable = true;

      # We force the use of our unified package to prevent collisions
      package = treesitterPackage;

      nixvimInjections = true;
      # We set nixGrammars to false because 'withAllGrammars' already
      # includes them; letting Nixvim try to install them again causes conflicts.
      nixGrammars = false;

      folding.enable = true;
      settings = {
        highlight.enable = true;
        indent.enable = true;
      };
    };

    treesitter-refactor = {
      enable = true;
      # FIX: Explicitly passing the same package here ensures that this
      # sub-plugin doesn't try to pull in a second, "raw" version of Treesitter.
      package = treesitterPackage;

      settings = {
        highlightDefinitions = {
          enable = true;
          # Set to false if you have an `updatetime` of ~100.
          clear_on_cursor_move = false;
        };
      };
    };

    # Now safe to enable: provides better highlight injections for Nix files
    hmts.enable = true;
  };
}
