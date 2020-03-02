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
      if hostnamectl | grep -q 'Red Hat' && [[ -d $HOME/.nix-profile ]]; then
        . $HOME/.nix-profile/etc/profile.d/nix.sh
      fi
    '';
  };

  programs.autorandr = {
    enable = true;
    profiles = {
      work = {
        fingerprint = {
          "DP-1" = "00ffffffffffff0022f0793200000000121b0104a5331d78229315a655519c27115054210800d1c0a9c081c0b3009500810081800101023a801871382d40582c4500fd1e1100001e000000fd00323c1e5011010a202020202020000000fc00485020453233320a2020202020000000ff00434e34373138313647360a2020006e";
          "DVI-I-1" = "00ffffffffffff0022f04a29010101010717010380331d782e01f5a257529f270a5054a1080081c081809500b300d1c0010101010101023a801871382d40582c4500fe1f1100001e000000fd00324c185e11000a202020202020000000fc004850204c41323330360a202020000000ff00434e433330374e5430560a20200046";
        };
        config = {
          "DP-1" = {
            enable = true;
            primary = false;
            rotate = "left";
            rate = "60.00";
            position = "0x0";
            mode = "1920x1080";
          };
          "DVI-I-1" = {
            enable = true;
            primary = true;
            rotate = "left";
            rate = "60.00";
            position = "1080x0";
            mode = "1920x1080";
          };
        };
      };
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
  };

  home.file.".vimrc".source = ./.vimrc;
  home.file.".local/bin/statusbar/battery".source = .local/bin/statusbar/battery;
  home.file.".local/bin/statusbar/wifi".source = .local/bin/statusbar/wifi;
  home.file.".config/i3blocks/config".source = .config/i3blocks/config;
}
