{
  plugins = {
    lsp-format.enable = true;
    lsp-lines.enable = true;
    lsp-status.enable = true;

    lsp = {
      enable = true;
      keymaps = {
        silent = true;
        diagnostic = {
          # Navigate in diagnostics
          "<leader>k" = "goto_prev";
          "<leader>j" = "goto_next";
        };

        lspBuf = {
          gd = "definition";
          gD = "references";
          gt = "type_definition";
          gi = "implementation";
          K = "hover";
          "<F2>" = "rename";
          "<leader>la" = "code_action";
        };
      };

      servers = {
        # For C and C++
        clangd.enable = true;

        # For LUA
        lua_ls.enable = true;

        # For LaTeX
        texlab.enable = true;

        # For Nix
        nixd.enable = true;

        # For GOlang
        gopls.enable = true;

        # For Dart and Flutter
        dartls.enable = true;

        # For PHP
        phpactor = {
          enable = true;
          filetypes = [ "php" "phtml" "blade" ];
        };

        # For Rust
        rust_analyzer = {
          enable = true;
          installCargo = true;
          installRustc = true;
        };
      };
    };
  };
}
