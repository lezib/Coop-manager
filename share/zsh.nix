{ lib, pkgs, inputs, ... }:
let 
  # directory of all functions
  functionsDir = ../shell;

  # Names of the files containing the functions
  modules = [
    "nvimfzf.zsh"
    "cdfzf.zsh"
    "autopush.zsh"
  ];

  makePath = list: builtins.map (name: "/" + functionsDir + "/" + name) list;
  getContent = list: builtins.map (path: lib.fileContents path) list;

  # load all file
  allFunctions = lib.concatStrings (getContent (makePath modules));
in {
  programs.zsh = {
    enable = true;

    # Small plugins
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    autocd = true;

    shellAliases = { 
      c = "clear";
      ls = "eza --icons --color=always"; # eza is just a ls but prettier
      la = "eza -a --icons --color=always";
      ll = "eza -al --icons --color=always";
      lsl = "eza -l --icons --color=always";

      # git aliases
      gs = "git status";
      gl = "git log";
      ga = "git add";
      gm = "git commit";
      gmm = "git commit -m";
      gt = "git tag -ma";
      gp = "git push";
      gpt = "git push --follow-tags";
      gsw = "git switch";
      gb = "git branch";

      # advanced
      glg = "git log --all --oneline --graph";
      gap = "git add -p";
      gsh = "git show";
      gg = "autopush"; # defined in shellscripts

      # sql aliases
      sql-server = "initdb --locale \"$LANG\" -E UTF8; postgres -k \"$PGHOST\"";
      sql-setup = "createuser -s postgres; createdb -U postgres roger_roger; pg_restore -U postgres -O -d roger_roger ~/afs/ing1/sql/roger_roger.dump";
      sql-run = "psql roger_roger";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "sudo"
      ];
      theme = "terminalparty"; # can be changed
    };

    initContent = allFunctions; # allFunctions is defined at the beginning

    dirHashes = {
      dl = "$HOME/Downloads"; # can be used to shorten some path (only in `pwd`)
    };
  };
}
