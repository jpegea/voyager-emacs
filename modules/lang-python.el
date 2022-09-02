;; -*- lexical-binding: t; -*-

(add-hook 'python-mode-hook 'lsp)

(use-package lsp-pyright
  :defer t)

(provide 'lang-python)
