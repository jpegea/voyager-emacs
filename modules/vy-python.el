;; -*- lexical-binding: t; -*-

(use-package flycheck)

(use-package lsp-mode
  :defer t
  :init
  (setq lsp-keymap-prefix "C-c l")
  :config
  (lsp-enable-which-key-integration t)
  :hook (python-mode . lsp)
  :custom
  (lsp-headerline-breadcrumb-enable nil))

(use-package lsp-ui
  :defer t ;; Maybe not necessary?
  :after lsp-mode
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (lsp-ui-doc-enable t)
  ;; :custom
  ;; (lsp-ui-doc-position 'bottom)
  )

(use-package lsp-treemacs
  :after (lsp-mode treemacs))

(use-package company
  :defer t
  :after lsp-mode
  :hook (lsp-mode . company-mode)
  :bind
  (:map company-active-map
	("<tab>" . company-complete-selection))
  (:map lsp-mode-map
	("<tab>" . company-indent-or-complete-common))
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0))

(use-package yasnippet
  :defer t
  :config (yas-reload-all)
  :hook (python-mode . yas-minor-mode))

(provide 'vy-python)
