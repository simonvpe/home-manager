{ config, pkgs, ... }:

let machine = import ./machine.nix;
in {
  home.stateVersion = "20.03";

  imports = [ ./machine.nix ];

  home.packages = with pkgs; [
     htop               # shows what resources applications use
     i3blocks           # status bar for i3
     iftop              # shows active network connections
     jq                 # like sed for json
     linuxPackages.perf # performance monitor applications
     nload              # show network transfer load
     powerline-fonts    # we like fonts
     ripgrep            # like grep, but better
     strace             # trace what applications do
     vim                # edit the shit out of files
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

  programs.firefox = {
    enable = true;
    enableIcedTea = true;
    # https://gitlab.com/rycee/nur-expressions/-/blob/master/pkgs/firefox-addons/addons.json
    extensions = with pkgs.nur.repos.rycee.firefox-addons; [
      bitwarden
      octotree
      privacy-badger
      vim-vixen
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

  programs.alacritty = {
    enable = true;
  };

  programs.bash = {
    enable = true;
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
  };

  home.file.".vimrc".source = ./.vimrc;
  home.file.".config/i3blocks/config".source = .config/i3blocks/config;
}
