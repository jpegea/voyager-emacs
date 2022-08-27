;; -*- lexical-binding: t; -*-

(use-package tex
  :defer t
  :ensure auctex
  :custom
  (TeX-auto-save t)
  (TeX-parse-self t)
  (TeX-master nil)
  :hook
  (LaTeX-mode . turn-on-auto-fill)
  (LaTeX-mode . turn-on-reftex))

;; Company?

(provide 'vy-latex)

