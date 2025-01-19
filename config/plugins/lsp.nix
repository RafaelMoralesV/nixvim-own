{
  programs.nixvim = {
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
          clangd.enable = true;
          lua_ls.enable = true;
          texlab.enable = true;
          nil_ls.enable = true;
          gopls.enable = true;
          phpactor = {
            enable = true;
            filetypes = [ "php" "phtml" "blade" ];
          };

          rust_analyzer = {
            enable = true;
            installCargo = false;
            installRustc = false;
          };
        };
      };
    };
  };
}
