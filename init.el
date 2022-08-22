;; -*- lexical-binding: t; -*-

(add-hook 'emacs-startup-hook
	  (lambda ()
	    (message "Welcome Voyager! Emacs loaded in %s."
		     (emacs-init-time))))

;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; Add the modules folder to the path
(add-to-list 'load-path (expand-file-name "modules/" user-emacs-directory))

;; Set default coding system (especially for Windows)
(set-default-coding-systems 'utf-8)
(customize-set-variable 'large-file-warning-threshold 100000000) ;; change to ~100 MB

;; Check the system used
(defconst ON-LINUX   (eq system-type 'gnu/linux))
(defconst ON-MAC     (eq system-type 'darwin))
(defconst ON-BSD     (or ON-MAC (eq system-type 'berkeley-unix)))
(defconst ON-WINDOWS (memq system-type '(cygwin windows-nt ms-dos)))

;; Change the value of `ON-TERMUX' in `.voyager-emacs/init.el'
(defvar ON-TERMUX nil
  "If non-nil indicates Voyager Emacs running on Android")

;; Find the voyager's configuration file
(defvar voyager-config-file (expand-file-name  "init.el" voyager-config-path)
  "The voyager's configuration file.")

;; Find the voyager's custom modules
(defvar voyager-custom-modules (expand-file-name "modules/" voyager-config-path)
  "The voyager's custom modules.")

(add-to-list 'load-path (expand-file-name voyager-custom-modules))

(unless (file-exists-p voyager-custom-modules)
  (mkdir voyager-custom-modules t))

;; Load voyager's configuration file
(when (file-exists-p voyager-config-file)
  (load voyager-config-file nil 'nomessage))

;; Set custom file
(customize-set-variable 'custom-file
			(expand-file-name "custom.el" voyager-config-path))

;; Load custom file
(when (file-exists-p custom-file)
  (load custom-file nil 'nomessage))


;; Make GC pauses faster by decreasing the threshold.
(setq gc-cons-threshold (* 2 1000 1000))
