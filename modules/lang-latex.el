;; -*- lexical-binding: t; -*-

(use-package tex
  :ensure auctex

  :custom
  (TeX-auto-save t)
  (TeX-parse-self t)
  (TeX-master nil)

  :hook
  (LaTeX-mode . turn-on-auto-fill)
  (LaTeX-mode . turn-on-reftex)
  (LaTeX-mode . yas-minor-mode)
  (LaTeX-mode . company-mode)

  :config
  (company-auctex-init))

(use-package company-auctex
  :defer t
  :config (company-auctex-init))

(provide 'lang-latex)

