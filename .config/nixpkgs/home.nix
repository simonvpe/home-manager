{ config, pkgs, ... }:
{
  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "19.09";

  home.packages = [
     pkgs.buildah
     pkgs.docker
     pkgs.git
     pkgs.htop
     pkgs.jq
     pkgs.linuxPackages.perf
     pkgs.powerline-fonts
     pkgs.ripgrep
     pkgs.strace
     pkgs.vim
     pkgs.i3blocks
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
