{ config, pkgs, ... }:

let machine = import ./machine.nix;
    all-hies = import (fetchTarball "https://github.com/infinisil/all-hies/tarball/master") {};
in {
  home.stateVersion = "20.03";

  imports = [ ./machine.nix ];

  home.packages = with pkgs; [
     i3blocks           # status bar for i3
     xtrlock-pam        # a simple lock screen
     cmatrix            # matrix stuff for thelock screen
     xautolock          # automatic lock screen
     iftop              # shows active network connections
     jq                 # like sed for json
     linuxPackages.perf # performance monitor applications
     nload              # show network transfer load
     powerline-fonts    # we like fonts
     ripgrep            # like grep, but better
     strace             # trace what applications do
     sysstat            # sar and more
     tuir               # terminal UI for reddit
     googler            # Googles in the console
     up                 # A tool for writing Linux pipes with instant live preview
     (all-hies.selection { selector = p: { inherit(p) ghc865; }; })
  ];

  xsession = {
    enable = true;
    windowManager = {
      i3.enable = true;
      i3.package = pkgs.i3-gaps;
      i3.config = null;
      i3.extraConfig = builtins.readFile .config/i3/config;
    };
  };

  programs.htop = {
    enable = true;
  };

  programs.firefox = {
    enable = true;
    enableIcedTea = true;
    # https://gitlab.com/rycee/nur-expressions/-/blob/master/pkgs/firefox-addons/addons.json
    extensions = with pkgs.nur.repos.rycee.firefox-addons; [
      bitwarden
      privacy-badger
      vim-vixen
      adsum-notabs
    ];
  };

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };

  programs.home-manager = {
    enable = true;
  };

  programs.bash = {
    enable = true;
    initExtra = ''
      # use bat as man pager for some colors
      export MANPAGER="sh -c 'col -b | bat -l man -p'"
      export EDITOR=nvim
    '';
    shellAliases = {
      "cat" = "bat";
      ".."  = "cd ..";
      "google" = "googler";
    };
 };

  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = false;
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = false;
    enableFishIntegration = false;
    settings = {
      prompt_order = [
        "username"
        "directory"
        "git_branch"
        "kubernetes"
        "nodejs"
        "python"
      ];
    };
  };

  # bat, a cat clone with wings
  programs.bat = {
    enable = true;
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    withPython3 = true;
    extraPython3Packages = (ps: with ps; [
      python-language-server
      pylint
      pep8
    ]);
    withNodeJs = true;
    plugins = with pkgs.vimPlugins; [
      # Colors
      awesome-vim-colorschemes

      # The rest
      ale
      fzf-vim                   # A command-line fuzzy finder
      indentLine                # A vim plugin to display the indention levels with thin vertical lines
      rainbow_parentheses       # Simpler Rainbow Parentheses
      semshi                    # Semantic Highlighting for Python in Neovim
      vim-airline               # lean & mean status/tabline for vim that's light as air
      vim-better-whitespace     # Better whitespace highlighting for Vim
      vim-commentary            # Comment stuff out
      vim-eunuch                # Helpers for UNIX
      vim-fugitive              # A Git wrapper so awesome, it should be illegal
      vim-hoogle                # Vim plugin used to query hoogle
      vim-nix                   # Vim configuration files for Nix
      vim-sensible              # Defaults everyone can agree on
      vim-signify               # Show a diff using Vim its sign column
      vim-surround              # Quoting/parenthesizing made simple
    ];
    extraConfig = ''
      " General settings
      colors materialbox
      syntax on
      set number relativenumber
      set ff=unix
      set tabstop=4
      set shiftwidth=4
      set expandtab
      set cursorline
      set list
      set listchars=tab:>-
      set noswapfile
      set nobackup

      " Ripgrep and Fzf bindings
      nnoremap <C-b> :Buffers<Cr>
      nnoremap <C-t> :Files<Cr>
      nnoremap <C-h> :Rg<Cr>
      nnoremap <C-l> :BLines<Cr>
      nnoremap <C-L> :Lines<Cr>

      " Setup rainbow_parentheses
      au VimEnter * RainbowParenthesesToggle
      au Syntax * RainbowParenthesesLoadRound
      au Syntax * RainbowParenthesesLoadSquare
      au Syntax * RainbowParenthesesLoadBraces

      " Whitespace settings
      let g:strip_whitespace_on_save = 1
      let g:strip_whitespace_confirm = 0
    '';
  };


  programs.zathura = {
    enable = true;
  };

  home.file.".local/bin/zeke".source = ./.local/bin/zeke;
  home.file.".local/bin/lock".source = ./.local/bin/lock;
}
