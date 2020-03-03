{ pkgs, ...}:
{
  home.packages = with pkgs; [
    buildah            # builds OCI containers
    docker             # runs OCI containers
    docker-compose     # start collections of docker containers
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

  home.file.".local/bin/statusbar/battery".source = .local/bin/statusbar/battery;
  home.file.".local/bin/statusbar/wifi".source = .local/bin/statusbar/wifi;
  home.file.".config/i3blocks/config".source = .config/i3blocks/laptop;
  home.file.".local/bin/terminal".source = ./.local/bin/terminal.laptop;
  home.file.".local/bin/launcher".source = ./.local/bin/launcher.laptop;
}
