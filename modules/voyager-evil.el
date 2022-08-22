(voyager-package-install-package 'evil)
(voyager-package-install-package 'evil-collection)
(voyager-package-install-package 'evil-escape)
(voyager-package-install-package 'undo-tree)
(voyager-package-install-package 'undo-fu)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Si volem utilitzar undo-tree en compte d'undo-fu      ;;
;; (global-undo-tree-mode)                               ;;
;; (customize-set-variable 'evil-undo-system 'undo-tree) ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(customize-set-variable 'evil-undo-system 'undo-fu)

(customize-set-variable 'evil-want-integration t)
(customize-set-variable 'evil-want-keybinding nil)
(customize-set-variable 'evil-want-C-u-scroll t)
(customize-set-variable 'evil-want-C-d-scroll t)
(customize-set-variable 'evil-respect-visual-line-mode t)

(require 'evil)
(evil-mode t)

(require 'evil-escape)
(setq-default evil-escape-key-sequence "jk")
(evil-escape-mode t)

;; Make C-g revert to normal state
(define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)

;; Rebind `universal-argument' to 'C-M-u' since 'C-u' now scrolls the buffer
(global-set-key (kbd "C-M-u") 'universal-argument)

(evil-global-set-key 'motion "j" 'evil-next-visual-line)
(evil-global-set-key 'motion "k" 'evil-previous-visual-line)

(evil-collection-init)

(provide 'voyager-evil)
