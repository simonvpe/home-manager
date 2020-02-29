{ config, pkgs, ... }:

let
  xmonad = pkgs.xmonad-with-packages.override {
    packages = self: [ self.xmonad-contrib self.xmonad-extras self.xmobar ];
  };
in {
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
     pkgs.git
     pkgs.htop
     pkgs.buildah
     pkgs.docker
     pkgs.powerline-fonts
     pkgs.jq
     pkgs.ripgrep
  ];

  xsession = {
    enable = true;
    windowManager.command = "${xmonad}/bin/xmonad";
  };

  programs.firefox = {
    enable = true;
    enableIcedTea = true;
  };

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };

  programs.home-manager = {
    enable = true;
  };

  programs.git = {
    enable = true;
    userName = "Simon Pettersson";
    userEmail = "simon.v.pettersson@gmail.com";
  };

  programs.vim = {
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

  home.file.".vimrc".source = ./configs/.vimrc;
  #home.file.".bashrc".source = ./configs/.bashrc;
  #home.file.".fzf.bash".source = ./configs/.fzf.bash;
  #home.file.".fzf/shell/key-bindings.bash".source = ./configs/.fzf/shell/key-bindings.bash;
}
