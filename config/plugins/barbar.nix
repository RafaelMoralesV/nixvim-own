{
  plugins = {
    # Implicit enabling of this module was deprecated,
    # so I am enabling explicitely.
    web-devicons.enable = true;
    barbar = {
      enable = true;
      keymaps = {
        next.key = "<TAB>";
        previous.key = "<S-TAB>";
        close.key = "<C-w>";
      };
    };
  };
}
