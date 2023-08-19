;; -*- lexical-binding: t; -*-

(use-package tex
  :ensure auctex

  :custom
  (TeX-auto-save t)
  (TeX-parse-self t)
  (TeX-master nil)
  (TeX-debug-bad-boxes t)
  (TeX-debug-warnings t)
  ;; (LaTeX-indent-level 4)

  :hook
  ;; (LaTeX-mode . turn-on-auto-fill)
  (LaTeX-mode . turn-on-reftex)
  (LaTeX-mode . yas-minor-mode-on)
  (LaTeX-mode . company-mode)
  (LaTeX-mode . display-line-numbers-mode)
  (LaTeX-mode . toggle-word-wrap)
  ;;(LaTeX-mode . hl-line-mode)

  :bind (:map LaTeX-mode-map
	      ("C-<return>" . TeX-save-compile-and-clean)
	      ("C-c M-q" . LaTeX-fill-paragraph)
	      ("C-c C-S-e" . LaTeX-change-environment)
	      ("C-c i" . indent-region)
	      ("C-c C-f b" . LaTeX-find-matching-begin)
	      ("C-c C-f e" . LaTeX-find-matching-end))

  :config
  (defun TeX-save-compile-and-clean ()
    (interactive)
    (save-buffer)
    (TeX-command "LaTeX" 'TeX-master-file))

  (company-auctex-init))


(use-package company-auctex
  :defer t
  :config (company-auctex-init))

(provide 'lang-latex)
