{ lib, ... }:
let
  intoKeymapObject = obj: {
    key = builtins.elemAt (builtins.attrNames obj) 0;
    action = builtins.elemAt (builtins.attrValues obj) 0;
    mode = obj.mode;
    options.desc = obj.desc or "";
  };

  addMode = mode: obj: let base = { mode = mode; }; in base // obj;
in {
  globals = {
    mapleader = " ";
    maplocalleader = " ";
  };

  keymaps = let
    normal = map (obj: intoKeymapObject (addMode "n" obj)) [
      {
        "<Space>" = "<NOP>";
      }

      # Esc to clear search results
      {
        "<esc>" = ":noh<CR>";
      }

      # fix Y behaviour
      {
        Y = "y$";
      }

      # back and fourth between the two most recent files
      {
        "<C-c>" = ":b#<CR>";
      }

      # close by Ctrl+q
      { "<C-q>" = ":q<CR>"; }
      {
        "<leader>q" = ":q<CR>";
        desc = "Quit NixVim";
      }

      # save by Space+s or Ctrl+s
      {
        "<leader>w" = ":w<CR>";
        desc = "Save buffer";
      }

      # navigate to left/right window
      { "<C-h>" = "<C-w>h"; }
      {
        "<C-l>" = "<C-w>l";
      }

      # Press 'H', 'L' to jump to start/end of a line (first/last character)
      { L = "$"; }
      {
        H = "^";
      }

      # resize with arrows
      { "<C-Up>" = ":resize -2<CR>"; }
      { "<C-Down>" = ":resize +2<CR>"; }
      { "<C-Left>" = ":vertical resize +2<CR>"; }
      {
        "<C-Right>" = ":vertical resize -2<CR>";
      }

      # move current line up/down
      # M = Alt key
      { "<M-k>" = ":move-2<CR>"; }
      { "<M-j>" = ":move+<CR>"; }
    ];

    visual = map (obj: intoKeymapObject (addMode "v" obj)) [
      # better indenting
      { ">" = ">gv"; }
      { "<" = "<gv"; }
      { "<TAB>" = ">gv"; }
      {
        "<S-TAB>" = "<gv";
      }

      # move selected line / block of text in visual mode
      { "K" = ":m '<-2<CR>gv=gv"; }
      { "J" = ":m '>+1<CR>gv=gv"; }
    ];
  in lib.nixvim.keymaps.mkKeymaps { options.silent = true; } (normal ++ visual);
}
