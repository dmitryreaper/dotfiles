;; This is an operating system configuration generated
;; by the graphical installer.
;;
;; Once installation is complete, you can learn and modify
;; this file to tweak the system configuration, and pass it
;; to the 'guix system reconfigure' command to effect your
;; changes.

;; Indicate which modules to import to access the variables
;; used in this configuration.
(use-modules (gnu)
             (nongnu packages linux)
             (gnu services xorg)
             (gnu services sysctl))
(use-service-modules desktop networking ssh xorg)

(use-package-modules java)

(operating-system
  (kernel linux)
  (firmware (list linux-firmware))
  (locale "en_US.utf8")
  (timezone "Europe/Minsk")
  (keyboard-layout (keyboard-layout "us" "altgr-intl"))
  (host-name "guix")

  ;; The list of user accounts ('root' is implicit).
  (users (cons* (user-account
                  (name "dima")
                  (comment "Dima")
                  (group "users")
                  (home-directory "/home/dima")
                  (supplementary-groups '("wheel" "netdev" "audio" "video")))
                %base-user-accounts))

  ;; Packages installed system-wide.  Users can also install packages
  ;; under their own account: use 'guix search KEYWORD' to search
  ;; for packages and 'guix install PACKAGE' to install a package.
  (packages (append (list (specification->package "i3-wm")
                          (specification->package "openjdk@17.0.10")
                          (specification->package "openjdk@20.0.2"))
                    %base-packages))

  ;; Below is the list of system services.  To search for available
  ;; services, run 'guix system search KEYWORD' in a terminal.
  (services
   (append (list (set-xorg-configuration
                   (xorg-configuration (keyboard-layout keyboard-layout)))
                 ;; This is the default list of services we
                 ;; are appending to.
                 (service bluetooth-service-type))
           %desktop-services))

  ;; Bootloader configuration with dual boot support for Windows
  (bootloader (bootloader-configuration
               (bootloader grub-efi-bootloader)
               (targets (list "/boot/efi"))
               (keyboard-layout keyboard-layout)
               (menu-entries
                (list
                 ;; Entry for Guix System
                 (menu-entry
                  (label "Guix System")
                  (linux "/gnu/store/...-linux/vmlinuz")
                  (initrd "/gnu/store/...-linux-initrd/initrd")
                  (device (uuid "f5908e11-e4c3-4985-b288-84f9d544929e")))

                 ;; Entry for Windows
                 (menu-entry
                  (label "Windows Boot Manager")
                  (linux "/EFI/Microsoft/Boot/bootmgfw.efi")
                  (device (uuid "14C8-34BC")))))))

  ;; Mapped devices for encrypted root partition
  (mapped-devices (list (mapped-device
                          (source (uuid
                                   "f5908e11-e4c3-4985-b288-84f9d544929e"))
                          (target "guix")
                          (type luks-device-mapping))))

  ;; File systems configuration
  (file-systems (cons* (file-system
                         (mount-point "/")
                         (device "/dev/mapper/guix")
                         (type "ext4")
                         (dependencies mapped-devices))
                       (file-system
                         (mount-point "/boot/efi")
                         (device (uuid "14C8-34BC"
                                       'fat32))
                         (type "vfat")) %base-file-systems)))
