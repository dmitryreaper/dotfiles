{pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    pulseaudio
  ];
}
