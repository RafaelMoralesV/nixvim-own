{
  programs.nixvim = {
    keymaps = [
      {
        mode = "n";
        key = "<leader>e";
        action = ":Neotree action=focus reveal toggle<CR>";
        options.silent = true;
        options.desc = "Open Neotree";
      }
      {
        mode = "n";
        key = "<leader>o";
        action = ":Neotree action=focus reveal<CR>";
        options.silent = true;
        options.desc = "Focus Neotree";
      }
    ];

    plugins.neo-tree = {
      enable = true;

      closeIfLastWindow = true;
      window = {
        width = 30;
        autoExpandWidth = true;
      };
    };
  };
}
