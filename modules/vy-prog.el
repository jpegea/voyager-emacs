;; -*- lexical-binding: t; -*-

(add-hook 'prog-mode-hook (lambda ()
			    (display-line-numbers-mode)
			    (hl-line-mode)
			    (electric-pair-mode)))

(use-package magit
  :defer t)

(require 'git-commit)

(use-package flycheck
  :defer t)

(use-package yasnippet
  :defer t
  :ensure yasnippet-snippets
  :config (yas-reload-all)
  :hook
  (lsp-mode . yas-minor-mode))

(use-package company
  :defer t
  :hook (lsp-mode . company-mode)
  :bind
  (:map company-active-map
	("<tab>" . company-complete-selection))
  (:map lsp-mode-map
	("<tab>" . company-indent-or-complete-common)))

(use-package lsp-mode
  :defer t
  :init
  (setq lsp-keymap-prefix "C-c l")
  :config
  (lsp-enable-which-key-integration t)
  :custom
  (lsp-headerline-breadcrumb-enable nil))

(use-package lsp-ui
  :defer t
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (lsp-ui-doc-enable t))

(use-package treemacs
  :defer t
  :ensure treemacs-all-the-icons
  :ensure treemacs-projectile
  :config
  (require 'treemacs-all-the-icons)
  (treemacs-load-theme "all-the-icons")
  :bind ("C-c o" . treemacs)
  :custom (treemacs-width 27))

(use-package lsp-treemacs
  :defer t
  :after (lsp-mode treemacs))

(provide 'vy-prog)
