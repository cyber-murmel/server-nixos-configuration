{ config, pkgs, ... }:
{
  users.users.admin = {
    isNormalUser = true;
    hashedPassword = "$6$Rj2KVboc.eXZp7eU$4CmgybO/Gl54ANPi3rciQLXzSNUMiNlxdrOfqEGDhpgKSDe9TOIWwybHXIUyIadtnal4c5aSMN54LelpzTGrk1";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEV51AU9cxPREjuzlQ5F9+7l1NeduMMGFPii+w9y4ZzH marble@nixos"
    ];
    extraGroups = [
      "wheel"
    ];
  };

  imports = [
    <home-manager/nixos>
  ];

  home-manager.users.admin = {
    home.stateVersion = config.system.stateVersion;

    home.packages = with pkgs; [
      yt-dlp
    ];
  };
}
