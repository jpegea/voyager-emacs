;; -*- lexical-binding: t; -*-

(use-package all-the-icons
  :defer 0
  :if (display-graphic-p))

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

(use-package minions
  :defer t
  :init (minions-mode t))

(use-package diminish
  :disabled
  :defer t)

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

;; THEMES
(use-package doom-themes
  :defer t)
(use-package ef-themes
  :defer t)

(provide 'vy-ui)
