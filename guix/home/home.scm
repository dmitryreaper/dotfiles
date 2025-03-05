;; This is a sample Guix Home configuration which can help setup your
;; home directory in the same declarative manner as Guix System.
;; For more information, see the Home Configuration section of the manual.
(define-module (home)
  #:use-module (gnu home)
  #:use-module (gnu home services)
  #:use-module (gnu home services shells)
  #:use-module (gnu services)
  #:use-module (gnu system shadow)
  #:use-module (gnu packages wm)
  #:use-module (gnu packages image-viewers)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages compton)
  #:use-module (gnu packages java)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages fonts)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages image)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages telegram)  
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages libreoffice)
  #:use-module (gnu packages sdl)
  #:use-module (nongnu packages chrome)
  #:use-module (nongnu packages dotnet))

(define home-config
  (home-environment
   (packages (list
			  xset
			  xinput
			  setxkbmap
			  font-terminus
			  xmonad
			  ghc-xmonad-contrib
			  ;; programs
			  flameshot
			  telegram-desktop
			  libreoffice
			  google-chrome-stable
	          emacs
			  feh
		 	  picom
			  rofi
			  rxvt-unicode
			  polybar
			  ;; dev
			  dotnet
			  ;; libs
			  sdl2
			  sdl2-gfx
			  sdl2-image
			  sdl2-mixer
			  sdl2-net
			  sdl2-ttf
			  ;; utils
			  bluez
			  btop
			  htop
			  pulseaudio
			  pavucontrol))

   (services
      (list
        ;; Uncomment the shell you wish to use for your user:
        ;(service home-bash-service-type)
        ;(service home-fish-service-type)
										;(service home-zsh-service-type)
        (service home-files-service-type
         `((".guile" ,%default-dotguile)))

        (service home-xdg-configuration-files-service-type
         `(("gdb/gdbinit" ,%default-gdbinit)
           ("nano/nanorc" ,%default-nanorc)))))))

home-config
