{config, ...}:
{

  hardware.graphics = {
    enable = true;
  };
  
  services.xserver.videoDrivers = [
    "modesetting"
    "nvidia"
  ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
  
  hardware.nvidia.prime  =  { 
		intelBusId  =  "PCI:0:2:0" ; 
		nvidiaBusId  =  "PCI:1:0:0" ; 
	}; 
}
