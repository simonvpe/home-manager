{ pkgs, ... }:
{
  home.packages = with pkgs; [
    dmenu
  ];

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

  programs.bash = {
    bashrcExtra = ''
      export GITHUB_HOST=sesol-git002.getingegroup.local
      export GITHUB_USER=simon.pettersson@getinge.com
      export PATH=$HOME/.local/bin:$PATH
      . $HOME/.nix-profile/etc/profile.d/nix.sh
      . /opt/rh/rh-git29/enable
      . /opt/rh/rh-python36/enable
      unset LANG # Dunno why this is needed but locale is fucked up without it
    '';
 };

 home.file.".config/i3blocks/config".source = ./.config/i3blocks/work;
 home.file.".local/bin/terminal".source = ./.local/bin/terminal.work;
 home.file.".local/bin/launcher".source = ./.local/bin/launcher.work;
}
