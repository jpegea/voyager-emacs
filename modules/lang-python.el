;; -*- lexical-binding: t; -*-

(add-hook 'python-mode-hook (lambda ()
			      (lsp)
			      (tree-sitter-mode)))

(use-package lsp-pyright
  :defer t)

(provide 'lang-python)
