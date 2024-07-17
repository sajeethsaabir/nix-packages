{ pkgs, ... }: {
  # This is required information for home-manager to do its job
  home = {
    stateVersion = "23.11";
    username = "zuko";
    homeDirectory = "/Users/zuko";
    packages = [
      
      pkgs.gnupg
      pkgs.fastfetch
      pkgs.htop
      pkgs.tmux
      pkgs.zellij
      pkgs.alacritty
      pkgs.kitty
      pkgs.jdk17
      pkgs.vlc-bin
      pkgs.nmap
      pkgs.gobuster
      pkgs.wireshark
      pkgs.bettercap
      pkgs.sqlmap
      pkgs.john
      pkgs.aircrack-ng
      pkgs.gofish
      pkgs.dirb
      pkgs.dirbuster
      pkgs.maven
      pkgs.chromium
    ];
  };
  programs.home-manager.enable = true;
  # I use fish, but bash and zsh work just as well here. This will setup
  # the shell to use home-manager properly on startup, neat!
  # programs.fish.enable = true;
}
