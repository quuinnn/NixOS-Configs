# NixOS-Configs

My NixOS Configuration files so if I need a fresh install of NixOS it'll be WAY easier

Comes with Flatpak and the GNOME DE

use `flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo` for Flathub.org repository

# How to use
Copy the files from this repos /etc/nixos/ to your the location of your configuration.nix file (usually /etc/nixos/) and edit them as needed

To disallow nonfree packages, comment out (or remove it or set it to false) line 97 (nixpkgs.config.allowUnfree = true;). With disallowing nonfree packages you'll need to remove steam.nix and nvidia.nix aswell due those software being proprietary. Refer to below for that.

If you don't use a NVIDIA GPU (or don't want the proprietary NVIDIA drivers), get rid of nvidia.nix `sudo rm -rf /etc/nixos/nvidia.nix` and go into configuration.nix and comment out (or remove) line 11 (./nvidia.nix) 

If you do, edit line 46 and 47 with the correct PCI Bus IDs using `lspci | grep VGA` (if that doesnt work, temporarily install pciutils with `nix-shell -p pciutils` [or [fully install it](https://search.nixos.org/packages?channel=23.11&show=pciutils&from=0&size=50&sort=relevance&type=packages&query=pciutils)]) and copy the IDs to there according to the [NixOS Wiki](https://nixos.wiki/wiki/Nvidia)

If you don't want Steam just remove the steam.nix file `sudo rm -rf /etc/nixos/steam.nix` and comment out (or remove) line 12 (./steam.nix) from configuration.nix

After you've finished, run `sudo nixos-rebuild switch --upgrade` to upgrade your system and apply the changes
## Packages in order as in the configuration.nix file
mullvad-vpn (Mullvad VPN)

sassc (sassc)

gnome.gnome-disk-utility (GNOME Disks)

gnome.gnome-software (GNOME Software)

vim (Vi Improved)

gnome.gnome-tweaks (GNOME Tweaks)

wine (Wine)

fish (Friendly Interactive Shell)

ungoogled-chromium (ungoogled chromium)

neofetch (neofetch)

pridefetch (pridefetch)

fastfetch (fastfetch)

micro (micro)

gedit (gedit)

emacs (GNU Emacs)

gnome.gnome-terminal (GNOME Terminal)

git (Linus Torvalds's git protocol)

starship (StarShip)

gamemode (Gamemode)

mangohud (MangoHud)

python3 (Python3)

python311Packages.icoextract (icoextract)

# Services
Mullvad VPN

Flatpak
