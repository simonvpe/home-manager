{ pkgs, ...}:
{
  home.packages = with pkgs; [
    buildah            # builds OCI containers
    docker             # runs OCI containers
    docker-compose     # start collections of docker containers
    gnupg              # encryption
    minikube           # run kuberenetes locally
  ];

  programs.git = {
    enable = true;
    userName = "Simon Pettersson";
    userEmail = "simon.v.pettersson@gmail.com";
  };

  programs.bash = {
    bashrcExtra = ''
      export PATH=$HOME/.local/bin:$PATH
    '';
  };

  programs.termite = {
    enable = true;
  };

  programs.rofi = {
    enable = true;
    theme = "c64";
    terminal = "$HOME/.local/bin/terminal";
  };

#   programs.firefox.profiles = {
#     home = {
#       name = "home";
#       isDefault = true;
#     };
#   };

  home.file.".config/i3blocks/config".source = .config/i3blocks/desktop;
  home.file.".local/bin/terminal".source = ./.local/bin/terminal.desktop;
  home.file.".local/bin/launcher".source = ./.local/bin/launcher.desktop;
  home.file.".local/bin/workproxy".source = ./.local/bin/workproxy.desktop;
  home.file.".ssh/config".source = ./.ssh/config.desktop;
  home.file.".mozilla/proxy.pac".source = ./.mozilla/proxy.pac;
}
