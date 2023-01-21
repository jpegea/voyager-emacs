;; -*- lexical-binding: t; -*-

;; Increase the GC threshold for faster startup
;; The default is 800 kilobytes.  Measured in bytes.
(setq gc-cons-threshold most-positive-fixnum)
;; (setq gc-cons-threshold (* 50 1000 1000))

(setq inhibit-startup-message t)
(setq initial-major-mode 'fundamental-mode)
(setq initial-scratch-message nil)

(setq frame-title-format (list "%b - Voyager Emacs"))

;; Set default coding system (especially for Windows)
(set-default-coding-systems 'utf-8)
(customize-set-variable 'large-file-warning-threshold 100000000) ;; change to ~100 MB


;; Tema predeterminat
(defvar vy/theme
  nil
  "Voyager Emacs theme.")

;; Pantalla de benvinguda
(defvar vy/welcome
  t
  "Dashboard on init")


;; Platform
(defconst ON-LINUX (eq system-type 'gnu/linux)
  "Non-nil if running on GNU/Linux.")
(defconst ON-MAC (eq system-type 'darwin)
  "Non-nil if running on Mac.")
(defconst ON-WINDOWS (memq system-type '(windows-nt ms-dos cygwin))
  "Non-nil if running on Windows.")

;; If you're using Termux change this in your personal config.
(defvar ON-TERMUX nil
  "Non-nil if running on Termux.")

;; Modus theme options
(setq modus-themes-mode-line '(borderless accented))

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


;; Clean UI
(unless ON-TERMUX
  (tool-bar-mode -1))
(menu-bar-mode -1)
(add-to-list 'default-frame-alist '(vertical-scroll-bars))

;; Stop anoying beep
(setq ring-bell-function 'ignore)


;; Load Voyager's theme
(if vy/theme
    (load-theme vy/theme t))
