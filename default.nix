{ pkgs, ...}:

{
  imports = [
    # system
    ./boot.nix
    ./datetime.nix
    ./locale.nix
    # ./media
    # ./network
    # ./nfs.nix
    ./ssh.nix
    ./users/root.nix
    ./vim.nix

    # user
    # ./home
    ./users/admin.nix
  ];

  # automatically update and reboot early in the morning
  system.autoUpgrade = {
    enable = true;
    allowReboot = true;
    dates = "6:00";
    randomizedDelaySec = "60min";
  };

  # set of globally (not user-specific) available packages
  environment.systemPackages = with pkgs; [
    # hardware readout
    dmidecode
    pciutils
    usbutils

    # monitoring
    htop
    bottom
    s-tui

    # network debugging
    nmap
    tcpdump
    termshark

    # revision control
    git

    # sensors
    lm_sensors

    # utils
    curl
    file
    fd
    ripgrep
    tmux
    wget
  ];
}
