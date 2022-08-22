;; -*- lexical-binding: t; -*-

(use-package all-the-icons
  :if (display-graphic-p))

(use-package doom-modeline
  :init (doom-modeline-mode t)
  :custom
  (doom-modeline-buffer-encoding nil)
  (doom-modeline-minor-modes nil)
  (doom-modeline-enable-word-count t))

(use-package doom-themes)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package pulsar
  :init (pulsar-global-mode t))

(provide 'vy-ui)
