{
  programs.nixvim = {
    plugins.lazygit = {
      enable = true;

      settings = {
        floating_window_winblend = 10;
      };
    };

    keymaps = [
      {
        action = ":LazyGit<CR>";
        key = "<leader>gg";
        options = {
          silent = true;
        };
      }
    ];
  };
}
