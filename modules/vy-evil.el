;; -*- lexical-binding: t; -*-

(use-package evil
  :bind
  (:map evil-insert-state-map
	      ("C-g" . evil-normal-state))
  ("C-M-u" . universal-argument)

  :init
  (evil-mode t)

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
  :after evil
  :diminish evil-collection-unimpaired-mode
  :config (evil-collection-init))

(use-package evil-escape
  :after evil
  :diminish evil-escape-mode
  :config (evil-escape-mode t)
  :custom
  (evil-escape-key-sequence "jk"))

(use-package evil-surround
  :after evil
  :config (global-evil-surround-mode t))

(provide 'vy-evil)
