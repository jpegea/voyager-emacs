;; -*- lexical-binding: t; -*-

;; Increase the GC threshold for faster startup
;; The default is 800 kilobytes.  Measured in bytes.
(setq gc-cons-threshold (* 50 1000 1000))

(setq initial-major-mode 'fundamental-mode)
(setq initial-scratch-message "Fes en este buffer el que et done la gana\n\n")

;; Set default coding system (especially for Windows)
(set-default-coding-systems 'utf-8)
(customize-set-variable 'large-file-warning-threshold 100000000) ;; change to ~100 MB

;; Packages
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; Tema predeterminat
(use-package doom-themes)
(setq modus-themes-mode-line '(borderless accented))
(defvar vy/theme
  (if (>= 28.1 (string-to-number emacs-version))
      'modus-vivendi
    'doom-gruvbox)
  "Voyager Emacs theme.")

;; Platform
(defconst ON-LINUX   (eq system-type 'gnu/linux))
(defconst ON-MAC     (eq system-type 'darwin))
(defconst ON-BSD     (or ON-MAC (eq system-type 'berkeley-unix)))
(defconst ON-WINDOWS (memq system-type '(cygwin windows-nt ms-dos)))

;; If you're using Termux change this in your personal config.
(setq-default ON-TERMUX nil)

;; Personal config path
(defvar voyager-config-path
  (expand-file-name ".voyager-emacs" (getenv "HOME"))
  "The voyager's config folder.")

(add-to-list 'load-path (expand-file-name voyager-config-path))

(unless (file-exists-p voyager-config-path)
  (mkdir voyager-config-path t))

;; Personal early-init.el
(let ((early-config-path (expand-file-name "early-init.el" voyager-config-path)))
  (when (file-exists-p early-config-path)
    (load early-config-path nil 'nomessage)))
