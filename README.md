# NixOS-Configs

My NixOS Configuration files so if I need a fresh install of NixOS it'll be WAY easier

This configuration has been tested to work on a ThinkPad L13 Yoga Gen 3, and a HP Pavilion Gaming Laptop (2020 version). Other Laptops (or Desktop PCs) will most likely still work.

Comes with Flatpak, the GNOME DE and Hyprland

use `flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo` for Flathub.org repository

# Previews
![2023-12-28-224757_hyprshot](https://github.com/fortunef/NixOS-Configs/assets/141419112/0908c90e-230a-477e-a114-60b2bdc7e3b3)
![2023-12-28-225217_hyprshot](https://github.com/fortunef/NixOS-Configs/assets/141419112/a1c0ef50-411b-43f4-98e9-7cb657b28bc9)
![2023-12-28-225256_hyprshot](https://github.com/fortunef/NixOS-Configs/assets/141419112/50e2bca0-c222-4b33-92b0-226830393926)
![nord-lake](https://github.com/fortunef/NixOS-Configs/assets/141419112/74aac9ea-3132-43c3-bc4c-10adb569c2dc)




# How to use
It is recommended to do this on a fresh install of the NixOS 23.11 GNOME Graphical ISO image on physical hardware. Also, before flashing it onto a disk or a USB or whatever, verify the SHA-256 graphically with [QuickHashGUI](https://github.com/tedsmith/quickhash) (Github) or use [Popsicle USB Flasher](https://github.com/pop-os/popsicle) (Github) which has a built in feature for that.

Copy the files from this repos /etc/nixos/ directory into any folder. Edit them according to below and when you're done, copy them to the directory of your configuration.nix file (usually /etc/nixos/) and run `sudo nixos-rebuild switch`. Sudo privileges required for almost all of that.

To disallow nonfree packages, comment out (or remove it or set it to false) line 97 (nixpkgs.config.allowUnfree = true;). With disallowing nonfree packages you'll need to remove steam.nix and nvidia.nix aswell due those software being proprietary. Refer to below for that.

If you do not want Mullvad VPN remove or comment out line 102 and 158

If you have only 1 NVIDIA GPU and want the proprietary NVIDIA drivers and have no iGPU or just don't want NVIDIA Prime Offload, remove (or comment out) lines 44 to 49 of nvidia.nix **❗❗(UNTESTED CONFIGURATION USE AT YOUR OWN RISK)❗❗**

If you have 2 NVIDIA GPUs and want the proprietary NVIDIA drivers and don't have an iGPU and you want NVIDIA Prime Offload, change line 46 of nvidia.nix from amdgpuBusId to nvidiaBusId **❗❗(UNTESTED CONFIGURATION USE AT YOUR OWN RISK)❗❗**

If you don't use a NVIDIA GPU (or don't want the proprietary NVIDIA drivers), get rid of nvidia.nix `sudo rm -rf /etc/nixos/nvidia.nix` and go into configuration.nix and comment out (or remove) line 11 (./nvidia.nix) 

If you do have an NVIDIA GPU and want the proprietary NVIDIA drivers, edit line 46 and 47 with the correct PCI Bus IDs using `lspci | grep VGA` (if that doesnt work, temporarily install pciutils with `nix-shell -p pciutils` [or [fully install it](https://search.nixos.org/packages?channel=23.11&show=pciutils&from=0&size=50&sort=relevance&type=packages&query=pciutils)]) and copy the IDs to there according to the formatting required by the [NixOS Wiki](https://nixos.wiki/wiki/Nvidia)

If you don't want Steam just remove the steam.nix file `sudo rm -rf /etc/nixos/steam.nix` and comment out (or remove) line 12 (./steam.nix) from configuration.nix

If you want my ALL packages. I installed [Nix Software Centre](https://github.com/snowfallorg/nix-software-center) (Github) but I didn't do that declaratively but with the "'nix profile' installation".

# My dots
My GTK Theme:
https://github.com/EliverLara/Nordic

My Waybar Theme:
https://github.com/BHlmaoMSD/dotfiles (I modified it a bit check this repos [$HOME/.config/waybar/](https://github.com/fortunef/NixOS-Configs/tree/main/home/quinn/.config/waybar) directory.

My Hyprland config:
https://github.com/sameemul-haque/dotfiles (I heavily modified it to make it for my liking but I based it off of that so I'm crediting them although it's currently public domain)

My Rofi theme:
https://github.com/adi1090x/rofi 



# Services
Mullvad VPN

Flatpak

Libvirtd

and the pre-installed NixOS GUI Install Services

# License
This is licensed under the MIT License. It allows you to modify this for any usage but with **ZERO** warranty and that is all. For more information, [read this](https://github.com/fortunef/NixOS-Configs/blob/main/LICENSE).
