;; -*- lexical-binding: t; -*-

(setq-default tab-width 4) ;; Set 4 spaces for tabs instead of 8

(add-hook 'prog-mode-hook (lambda ()
			    (display-line-numbers-mode)
			    (hl-line-mode)
			    (electric-pair-local-mode)))

(add-hook 'emacs-lisp-mode-hook #'prettify-symbols-mode)

(use-package magit
  :init
  (require 'git-commit))

(use-package yasnippet
  :ensure yasnippet-snippets
  :config
  (yas-reload-all)
  (setq yas-triggers-in-field t)
  :hook
  (lsp-mode . yas-minor-mode))

(use-package company
  :hook (lsp-mode . company-mode)
  :bind
  (:map company-active-map
		("<tab>" . company-complete-selection)))

(use-package company-box
  :hook (company-mode . company-box-mode))

(use-package lsp-mode
  :defer t
  :config
  (setq lsp-keymap-prefix "C-c l")
  :custom
  (lsp-headerline-breadcrumb-enable nil))

(use-package lsp-ui
  :after lsp-mode
  :hook (lsp-mode . lsp-ui-mode))

(use-package flycheck
  :defer t)

(use-package treemacs
  :ensure treemacs-all-the-icons
  :config
  (require 'treemacs-all-the-icons)
  (treemacs-load-theme "all-the-icons")
  :bind ("C-c o p" . treemacs)
  :custom (treemacs-width 27))

(provide 'vy-prog)
