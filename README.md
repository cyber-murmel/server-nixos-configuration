# Server NixOS Configuration
/etc/nixos/ configuration for servers

This repos contains all non-hardware specific configuration for a NixOS server setup.

## Installation
For installation it is easiest to clone this installation via https into the config directory.
```shell
# after generation of initial configuration files
sudo git clone https://github.com/cyber-murmel/server-nixos-configuration.git /mnt/etc/nixos/server-nixos-configuration
# import repo directory in config
sudo sed -i -e 's/.\/hardware-configuration.nix/.\/hardware-configuration.nix\n      .\/server-nixos-configuration/g' /mnt/etc/nixos/configuration.nix
```

## Customization
Change the [password of the admin](users/admin.nix#L5) user.
Run `mkpasswd --method=sha-512` to enter the password interactively or `echo -ne ${PASSWORD} | mkpasswd --stdin --method=sha-512`.

Change the SSH public keys of [root](users/root.nix#L4) and [admin](users/admin.nix#L7) to you public key.

## Runtime
First add the Home Manager channel.
```shell
sudo nix-channel --add https://github.com/nix-community/home-manager/archive/release-22.05.tar.gz home-manager
sudo nix-channel --update
```

For management of the configuration after installation I advise to clone this repository with a sudo user into its home and symlink it.
```shell
git clone https://github.com/cyber-murmel/server-nixos-configuration.git ~/repos/server-nixos-configuration
sudo rm -rf /etc/nixos/server-nixos-configuration
sudo ln -s ~/repos/server-nixos-configuration /etc/nixos/server-nixos-configuration
```

Test the config.
```shell
sudo nixos-rebuild test
```
