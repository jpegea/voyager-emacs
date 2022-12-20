;; -*- lexical-binding: t; -*-


;; Startup
(add-hook 'emacs-startup-hook
	  (lambda ()
	    (message "Welcome Voyager! Emacs loaded in %s."
		     (emacs-init-time))))


;; Packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))


;; Use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package benchmark-init
  :config
  ;; To disable collection of benchmark data after init is done.
  (add-hook 'after-init-hook 'benchmark-init/deactivate))


;; auto-update packages
(use-package auto-package-update
  :defer t
  :config
  (add-hook 'auto-package-update-before-hook
	    (lambda () (message "I will update packages now"))))


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
