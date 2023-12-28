# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./nvidia.nix
      ./steam.nix
      ./hyprland.nix
      ./home-manager.nix
      #./catppuccin.nix
    ];
   
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-e1589fa5-44c5-42f8-b417-b692b240ef8e".device = "/dev/disk/by-uuid/e1589fa5-44c5-42f8-b417-b692b240ef8e";
  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Australia/Melbourne";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_AU.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_AU.UTF-8";
    LC_IDENTIFICATION = "en_AU.UTF-8";
    LC_MEASUREMENT = "en_AU.UTF-8";
    LC_MONETARY = "en_AU.UTF-8";
    LC_NAME = "en_AU.UTF-8";
    LC_NUMERIC = "en_AU.UTF-8";
    LC_PAPER = "en_AU.UTF-8";
    LC_TELEPHONE = "en_AU.UTF-8";
    LC_TIME = "en_AU.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  # Enables the K Desktop Environment
  #services.xserver.displayManager.sddm.enable = true;
  #services.xserver.desktopManager.plasma5.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "au";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

# Auto Update  
  

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.quinn = {
    isNormalUser = true;
    description = "Quinn";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
    packages = with pkgs; [
      firefox
    #  thunderbird
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  pkgs.mullvad-vpn
  pkgs.sassc
  pkgs.cinnamon.nemo-fileroller
  pkgs.conky
  pkgs.xfce.xfce4-settings
  pkgs.adw-gtk3
  pkgs.brillo
  pkgs.p7zip
  pkgs.cinnamon.nemo-with-extensions
  pkgs.protontricks
  #pkgs.cinnamon.nemo
  pkgs.gnome.zenity
  #pkgs.xfce.thunar
  #pkgs.xfce.thunar-archive-plugin
  pkgs.nwg-look
  pkgs.gnome.gnome-boxes
  pkgs.vinegar
  pkgs.xarchive
  pkgs.xarchiver
  pkgs.pavucontrol
  #pkgs.libsForQt5.dolphin
  libsForQt5.qtstyleplugin-kvantum # Hyprland?
  pkgs.hyprpaper # Very Hyprland
  pkgs.pywal # Hyprland
  pkgs.lxappearance # Hyprland
  pkgs.pamixer # Hyprland
  pkgs.wofi # Hyprland
  pkgs.kitty # Hyprland
  pkgs.waybar # Hyprland
  pkgs.gnome.gnome-disk-utility
  pkgs.networkmanagerapplet
  pkgs.gnome.gnome-software
  #pkgs.vim
  pkgs.wine-staging
  pkgs.flameshot # Hyprland
  pkgs.gnome.gnome-tweaks
  #pkgs.wine # Wine Staging better cuz 9.0
  pkgs.python311Packages.pip
  pkgs.alacritty # Hyprland
  pkgs.cliphist # Hyprland
  pkgs.zathura # Hyprland
  pkgs.rofi-wayland #Hyprland
  pkgs.dunst # Hyprland
  pkgs.swaylock-effects # Hyprland
  pkgs.ungoogled-chromium
  pkgs.mullvad-browser # I INSTALL WITH DA FLATPAK
  pkgs.neofetch
  pkgs.pridefetch
  pkgs.fastfetch
  pkgs.micro
  pkgs.steamtinkerlaunch
  pkgs.heroic
  pkgs.lutris
  pkgs.obs-studio
  pkgs.gedit
  pkgs.emacs
  pkgs.gnome.gnome-terminal
  pkgs.git
  pkgs.cmake
  pkgs.meson
  pkgs.vim-full
  pkgs.gnumake
  pkgs.starship
  pkgs.gamemode
  pkgs.eww # Hyprland
  pkgs.mangohud
  pkgs.gradience
  pkgs.latte-dock
  pkgs.python3
  pkgs.wget
  #pkgs.libsForQt5.systemsettings
  pkgs.python311Packages.icoextract
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
  ];
  
  programs.fish.enable = true;
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
  
  services.flatpak.enable = true;
  services.mullvad-vpn.enable = true;

  system.autoUpgrade = {
      enable = true;
};
#programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  #programs.nix-ld.enable = true;
  #programs.nix-ld.libraries = with pkgs; [
  # [REDACTED]
    # Add any missing dynamic libraries for unpackaged programs
    # here, NOT in environment.systemPackages
 # ];

}
