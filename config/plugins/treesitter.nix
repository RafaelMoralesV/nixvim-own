{
  programs.nixvim = {
    plugins = {
      treesitter = {
        enable = true;

        nixvimInjections = true;
        nixGrammars = false;

        folding = true;
        settings = {
          ensure_installed = [ "blade" ];
          highlight.enable = true;
          indent.enable = true;
        };
      };

      treesitter-refactor = {
        enable = true;
        highlightDefinitions = {
          enable = true;
          # Set to false if you have an `updatetime` of ~100.
          clearOnCursorMove = false;
        };
      };

      hmts.enable = true;
    };

    # Add tree-sitter-blade
    extraConfigLuaPost = ''
      local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
      parser_config.blade = {
        install_info = {
          url = "https://github.com/EmranMR/tree-sitter-blade";
          files = { "src/parser.c" };
          branch = "main";
        };
        filetype = "blade";
      };
    '';

    # Set the *.blade.php file to be filetype of blade
    extraConfigVim = ''
      augroup BladeFiltypeRelated
        au BufNewFile,BufRead *.blade.php set ft=blade
      augroup END
    '';
  };
}
