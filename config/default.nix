{ ... }: {
  imports = [
    #inputs.nixvim.homeManagerModules.nixvim
    ./options.nix
    ./keymaps.nix
    ./completion.nix

    ./plugins
  ];

  config = { };
}
