{ ... }:
{
  plugins = {
    treesitter = {
      enable = true;

      # Let nixvim manage the package + grammars itself (default:
      # pkgs.vimPlugins.nvim-treesitter, now the "main" branch rewrite,
      # with all grammars installed reproducibly via Nix). Overriding
      # `package`/`grammarPackages` with a raw pkgs.vimPlugins.nvim-treesitter.*
      # value pulls in query files that don't match this module's expectations,
      # which is what was silently breaking Nix (and other) highlighting.
      nixvimInjections = true;

      # highlight/indent/folding are top-level now, not nested under
      # `settings` -- `settings` is reserved for require('nvim-treesitter').setup()
      # (the new main-branch API) and nesting these here was a no-op.
      highlight.enable = true;
      indent.enable = true;
      folding.enable = true;
    };

    # treesitter-refactor is no longer maintained and doesn't work with
    # the main nvim-treesitter branch (it needs the old `nvim-treesitter.configs`
    # API, which no longer exists). This is also the real source of the
    # "two different versions of nvim-treesitter" error. Dropped for now --
    # see chat for alternatives if you want the highlight-definitions feature back.
  };
}
