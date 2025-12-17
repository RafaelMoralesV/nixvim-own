{
  plugins = {
    treesitter = {
      enable = true;

      nixvimInjections = true;
      nixGrammars = false;

      folding = true;
      settings = {
        highlight.enable = true;
        indent.enable = true;
      };
    };

    treesitter-refactor = {
      enable = true;
      settings = {
        highlightDefinitions = {
          enable = true;
          # Set to false if you have an `updatetime` of ~100.
          clear_on_cursor_move = false;
        };
      };
    };

    hmts.enable = true;
  };
}
