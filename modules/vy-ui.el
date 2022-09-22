;; -*- lexical-binding: t; -*-

(use-package all-the-icons
  :defer 2
  :if (display-graphic-p))

(use-package doom-modeline
  :init (doom-modeline-mode t)
  :config
  (set-face-attribute 'mode-line nil  :height 120)
  :custom
  (doom-modeline-buffer-encoding t)
  (doom-modeline-minor-modes nil)
  (doom-modeline-enable-word-count t)
  (doom-modeline-height 30))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package pulsar
  :defer t
  :init
  (when ON-LINUX
    (pulsar-global-mode t)))

(use-package projectile
  :config (projectile-mode t)
  :bind (:map projectile-mode-map
	      ("C-c p" . projectile-command-map)))

(use-package dashboard
  :defer t

  :init
  (unless (eq window-system nil)
    (if vy/welcome
	(dashboard-setup-startup-hook)))

  :custom
  ;; (dashboard-banner-logo-title "Benvingut a Voyager Emacs!")
  (dashboard-banner-logo-title "Welcome to Voyager Emacs!")
  (dashboard-startup-banner (expand-file-name "logo/Voyager.png" user-emacs-directory))
  (dashboard-center-content t)
  
  (dashboard-items '((recents . 5)
		     (projects . 5)))

  ;;(dashboard-set-heading-icons t)
  ;;(dashboard-set-file-icons t)

  ;; (dashboard-item-names '(("Recent Files:" . "Fitxers recents:")
  ;; 			  ("Projects:" . "Projectes:")))
  (dashboard-set-init-info nil)
  (dashboard-show-shortcuts nil))

(provide 'vy-ui)
