{ config, lib, inputs, ... }:

let cfg = config.nixvim-config;
in {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./options.nix
    ./keymaps.nix
    ./completion.nix

    ./plugins
  ];

  options.nixvim-config = { enable = lib.mkEnableOption "Enable NixVim"; };

  config = lib.mkIf cfg.enable {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;

    luaLoader.enable = true;

    # Highlight and remove extra white spaces
    highlight.ExtraWhitespace.bg = "red";
    match.ExtraWhitespace = "\\s\\+$";
  };
}
