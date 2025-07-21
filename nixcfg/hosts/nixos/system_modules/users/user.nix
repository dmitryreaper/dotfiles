{pkgs, ...}:
{
  users.users.dima = {
    isNormalUser = true;
    description = "dima";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };
}
