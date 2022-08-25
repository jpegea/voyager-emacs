;; -*- lexical-binding: t; -*-

(use-package evil
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
  (evil-undo-system 'undo-redo)) ;; from Emacs 28

(use-package evil-collection
  :init (evil-collection-init))

(use-package evil-escape
  :init (evil-escape-mode t)
  :custom
  (evil-escape-key-sequence "jk"))

(use-package evil-surround
  :ensure t
  :init
  (global-evil-surround-mode 1))

(provide 'vy-evil)
