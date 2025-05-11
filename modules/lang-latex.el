;; -*- lexical-binding: t; -*-

(use-package tex
  :ensure auctex

  :custom
  (TeX-auto-save t)
  (TeX-parse-self t)
  (TeX-master nil)
  (TeX-debug-bad-boxes t)
  (TeX-debug-warnings t)
  (TeX-command-extra-options "-shell-escape")
  (TeX-output-dir "output")
  (LaTeX-verbatim-environments '("verbatim" "verbatim*" "Verbatim" "Verbatim*" "filecontents" "filecontents*" "lstlisting"))

  :hook
  ;; (LaTeX-mode . turn-on-auto-fill)
  (LaTeX-mode . turn-on-reftex)
  (LaTeX-mode . yas-minor-mode-on)
  (LaTeX-mode . company-mode)
  ;; (LaTeX-mode . display-line-numbers-mode)
  (LaTeX-mode . toggle-word-wrap)
  ;; (LaTeX-mode . hl-line-mode)

  :bind (:map LaTeX-mode-map
	      ("C-<return>" . TeX-save-compile-and-clean)
	      ("C-c M-q" . LaTeX-fill-paragraph)
	      ("C-c C-S-e" . LaTeX-change-environment)
	      ("C-c i" . indent-region))

  :config
  (defun TeX-save-compile-and-clean () ;; Falta acabar
    (interactive)
    (save-buffer)
    (TeX-command "LaTeX" 'TeX-master-file))
  (company-auctex-init))


(use-package company-auctex
  :defer t
  :config (company-auctex-init))

;; Testing
;; (use-package lsp-ltex
;;   :ensure t
;;   :hook (LaTeX-mode . (lambda ()
;; 						(require 'lsp-ltex)
;; 						(lsp)))
;;   :init
;;   (setq lsp-ltex-version "16.0.0")
;;   (setq-default lsp-ltex-language "ca-ES"))

(provide 'lang-latex)
