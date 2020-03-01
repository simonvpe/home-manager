{ config, pkgs, ... }:
{
  home.stateVersion = "20.03";

  home.packages = [
     pkgs.buildah            # builds OCI containers
     pkgs.docker             # runs OCI containers
     pkgs.docker-compose     # start collections of docker containers
     pkgs.git                # versions source code
     pkgs.htop               # shows what resources applications use
     pkgs.i3blocks           # status bar for i3
     pkgs.iftop              # shows active network connections
     pkgs.jq                 # like sed for json
     pkgs.linuxPackages.perf # performance monitor applications
     pkgs.nload              # show network transfer load
     pkgs.powerline-fonts    # we like fonts
     pkgs.ripgrep            # like grep, but better
     pkgs.strace             # trace what applications do
     pkgs.vim                # edit the shit out of files
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

  programs.git = {
    enable = true;
    userName = "Simon Pettersson";
    userEmail = "simon.v.pettersson@gmail.com";
  };

  programs.bash = {
    enable = true;
    bashrcExtra = ''
      export PATH=$HOME/.local/bin:$PATH
    '';
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
  home.file.".local/bin/statusbar/battery".source = .local/bin/statusbar/battery;
  home.file.".local/bin/statusbar/wifi".source = .local/bin/statusbar/wifi;
  home.file.".config/i3blocks/config".source = .config/i3blocks/config;
}
