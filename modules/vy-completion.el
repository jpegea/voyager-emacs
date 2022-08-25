;; -*- lexical-binding: t; -*-

(use-package vertico
  :init (vertico-mode t)
  :custom (vertico-cycle t)
  :bind (:map vertico-map
	      ("C-j" . vertico-next)
	      ("C-k" . vertico-previous)))

(use-package marginalia
  :init (marginalia-mode t))

(use-package consult
  :bind
  ("C-s" . consult-line)
  ("M-g g" . consult-goto-line)
  (:map minibuffer-local-map
	("C-r" . consult-history)))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package which-key
  :diminish which-key-mode
  :config
  (which-key-mode)
  :custom
  (which-key-idle-delay 1))

(use-package yasnippet
  :config (yas-reload-all)
  :hook (LaTeX-mode . yas-minor-mode))

(use-package yasnippet-snippets)

(provide 'vy-completion)
