;; -*- lexical-binding: t; -*-

(use-package tex
  :ensure auctex
  :custom
  (TeX-auto-save t)
  (TeX-parse-self t)
  (TeX-master nil)
  :hook (LaTeX-mode . turn-on-auto-fill))

(require 'reftex)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)

(provide 'vy-latex)

