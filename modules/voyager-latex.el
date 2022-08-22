(voyager-package-install-package 'auctex)
(require 'tex)

(setq TeX-auto-save t)
(setq TeX-parse-self t)

(setq-default TeX-master nil)

(add-hook 'LaTeX-mode-hook #'turn-on-auto-fill)

;; RefTeX
(require 'reftex)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)

;; Completions
(add-hook 'LaTeX-mode-hook 'company-mode)

(voyager-package-install-package 'company-auctex)
(require 'company-auctex)
(company-auctex-init)

(voyager-package-install-package 'latex-preview-pane)


;; (defun insert-backslash ()
;;   (interactive)
;;   (insert "\\"))

;; (define-key LaTeX-mode-map (kbd "jj") 'insert-backslash)

(provide 'voyager-latex)
