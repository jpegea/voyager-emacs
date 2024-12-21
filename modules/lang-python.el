;; -*- lexical-binding: t; -*-

(use-package python
  :ensure nil
  :custom
  (pyhton-shell-interpreter "python3"))

(use-package lsp-pyright
  :ensure t
  :custom (lsp-pyright-langserver-command "pyright") ;; or basedpyright
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))

(provide 'lang-python)
