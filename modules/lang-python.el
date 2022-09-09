;; -*- lexical-binding: t; -*-

(add-hook 'python-mode-hook (lambda ()
			      (lsp)
			      (tree-sitter-mode)))

(use-package lsp-pyright
  :after lsp)

(provide 'lang-python)
