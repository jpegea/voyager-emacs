;; -*- lexical-binding: t; -*-

(use-package evil
  :defer t
  
  :init (evil-mode t)

  :bind
  (:map evil-insert-state-map
	      ("C-g" . evil-normal-state))
  ("C-M-u" . universal-argument)

  :config
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  :custom
  (evil-want-integration t)
  (evil-want-keybinding nil)
  (evil-want-C-u-scroll t)
  (evil-want-C-d-scroll t)
  (evil-respect-visual-line-mode t)
  (evil-undo-system 'undo-redo)) ;; Emacs 28 best emacs version

(use-package evil-collection
  :defer t
  :init (evil-collection-init))

(use-package evil-escape
  :defer t
  :init (evil-escape-mode t)
  :custom
  (evil-escape-key-sequence "jk"))

(use-package evil-surround
  :defer t
  :ensure t
  :init
  (add-hook 'prog-mode-hook 'evil-surround-mode))

(provide 'vy-evil)
