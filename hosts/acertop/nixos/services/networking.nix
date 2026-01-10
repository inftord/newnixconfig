{
  networking = {
    networkmanager.enable = true;
    hostName = "acertop";
    nameservers = [ "127.0.0.1" "::1" ];
    # If using dhcpcd:
    dhcpcd.extraConfig = "nohook resolv.conf";
  };
  hardware.wirelessRegulatoryDatabase = true;  
}
