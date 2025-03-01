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
  #:use-module (gnu packages xdisorg))

(define home-config
  (home-environment
   (packages (list
			  i3-wm
			  i3status
			  rofi
			  rxvt-unicode))
    (services
      (list
        ;; Uncomment the shell you wish to use for your user:
        ;(service home-bash-service-type)
        ;(service home-fish-service-type)
        ;(service home-zsh-service-type)

        (service home-files-service-type
         `((".guile" ,%default-dotguile)
           (".Xdefaults" ,%default-xdefaults)))

        (service home-xdg-configuration-files-service-type
         `(("gdb/gdbinit" ,%default-gdbinit)
           ("nano/nanorc" ,%default-nanorc)))))))

home-config
