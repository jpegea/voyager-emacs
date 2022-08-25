;; -*- lexical-binding: t; -*-

;; Clean UI
(unless ON-TERMUX
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1))

(set-fringe-mode 20) ;; Margins

(setq ring-bell-function 'ignore)

;; Load Voyager's theme
(load-theme vy/theme t)

;; Startup

(setq inhibit-startup-message t)

(add-hook 'emacs-startup-hook
	  (lambda ()
	    (message "Welcome Voyager! Emacs loaded in %s."
		     (emacs-init-time))))


;; Add the modules folder to the path
(add-to-list 'load-path (expand-file-name "modules/" user-emacs-directory))


;; Find the voyager's config file
(defvar voyager-config-file (expand-file-name "init.el" voyager-config-path)
  "The voyager's config file.")


;; Find the voyager's custom modules
(defvar voyager-custom-modules (expand-file-name "modules/" voyager-config-path)
  "The voyager's custom modules.")

(unless (file-exists-p voyager-custom-modules)
  (mkdir voyager-custom-modules t))

(add-to-list 'load-path (expand-file-name voyager-custom-modules))


;; Personal init.el
(when (file-exists-p voyager-config-file)
  (load voyager-config-file nil 'nomessage))


;; custom.el
(setq custom-file (expand-file-name "custom.el" voyager-config-path))
(when (file-exists-p custom-file)
  (load custom-file nil 'nomessage))

;; Make GC pauses faster by decreasing the threshold.
(setq gc-cons-threshold (* 2 1000 1000))
