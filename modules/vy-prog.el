;; -*- lexical-binding: t; -*-

(add-hook 'prog-mode-hook (lambda ()
			    (display-line-numbers-mode)
			    (hl-line-mode)
			    (electric-pair-local-mode)))

(add-hook 'emacs-lisp-mode-hook #'prettify-symbols-mode)

(use-package magit
  :defer t
  :init
  (require 'git-commit))

(use-package flycheck
  :defer t)

(use-package yasnippet
  :ensure yasnippet-snippets
  :config
  (yas-reload-all)
  :hook
  (lsp-mode . yas-minor-mode))

(use-package company
  :hook (lsp-mode . company-mode)
  :bind
  (:map company-active-map
	("<tab>" . company-complete-selection))
  ;; (:map lsp-mode-map
  ;; 	("<tab>" . company-indent-or-complete-common))
  )

(use-package lsp-mode
  :defer t
  :config
  (setq lsp-keymap-prefix "C-c l")
  (lsp-enable-which-key-integration t)
  :custom
  (lsp-headerline-breadcrumb-enable nil))

(use-package lsp-ui
  :after lsp-mode
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (lsp-ui-doc-enable t))

(use-package treemacs
  :ensure treemacs-all-the-icons
  :ensure treemacs-projectile
  :ensure lsp-treemacs
  :config
  (require 'treemacs-all-the-icons)
  (treemacs-load-theme "all-the-icons")
  :bind ("C-c o p" . treemacs)
  :custom (treemacs-width 27))

(use-package tree-sitter
  :defer t
  :ensure tree-sitter-langs)

(provide 'vy-prog)
