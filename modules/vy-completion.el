;; -*- lexical-binding: t; -*-

(use-package vertico
  :defer t
  :init (vertico-mode t)
  :custom (vertico-cycle t)
  :bind (:map vertico-map
	      ("C-j" . vertico-next)
	      ("C-k" . vertico-previous)))

(use-package marginalia
  :defer t
  :init (marginalia-mode t))

(use-package consult
  :defer t
  :bind
  ("C-s" . consult-line)
  ("M-g g" . consult-goto-line)
  (:map minibuffer-local-map
	("C-r" . consult-history)))

(use-package orderless
  :defer t
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package which-key
  :defer t
  :diminish which-key-mode
  :config
  (which-key-mode)
  :custom
  (which-key-idle-delay 1))

(provide 'vy-completion)
