;; -*- lexical-binding: t; -*-

;; Increase the GC threshold for faster startup
;; The default is 800 kilobytes.  Measured in bytes.
(setq gc-cons-threshold (* 50 1000 1000))

;; Tema predeterminat
(when (or (>= 28.1 (string-to-number emacs-version))
	  (package-installed-p 'modus-themes))
  (setq modus-themes-mode-line '(borderless accented))
  (load-theme 'modus-vivendi t))

;; Netejar UI
(setq inhibit-startup-message t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(set-fringe-mode 10)

(setq ring-bell-function 'ignore)

;; Per a millorar el rendiment
(setq initial-major-mode 'fundamental-mode)
;; (setq initial-scratch-message
;;       "Benvingut a Voyager Emacs!\n\n")
(setq initial-scratch-message
      "Aquest buffer no es guardarà\n\n")

(defvar voyager-config-path
  (expand-file-name ".voyager-emacs" (getenv "HOME"))
  "The voyager's configuration folder.")

(add-to-list 'load-path (expand-file-name voyager-config-path))

(unless (file-exists-p voyager-config-path)
  (mkdir voyager-config-path t))


;; NATIVE COMPILE??

;; Load the early config file if it exists
(let ((early-config-path (expand-file-name "early-init.el" voyager-config-path)))
  (when (file-exists-p early-config-path)
    (load early-config-path nil 'nomessage)))
