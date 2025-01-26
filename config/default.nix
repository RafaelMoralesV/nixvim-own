{ inputs, ... }: {
  imports = [
    #inputs.nixvim.homeManagerModules.nixvim
    ./options.nix
    ./keymaps.nix
    ./completion.nix

    ./plugins
  ];

  config = {
    # Install Man-pages
    enableMan = true;

    viAlias = true;
    vimAlias = true;

    # Highlight and remove extra white spaces
    highlight.ExtraWhitespace.bg = "red";
    match.ExtraWhitespace = "\\s\\+$";
  };
}
