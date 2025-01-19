{ pkgs, ... }: {
  programs.nixvim.plugins.none-ls = {
    enable = true;

    sources.formatting = {
      blade_formatter = {
        enable = true;
        package = pkgs.blade-formatter;
      };
      clang_format.enable = true;
      nixfmt.enable = true;
      prettierd.enable = true;
      pint = {
        enable = true;
        package = null;
      };
    };
  };
}
