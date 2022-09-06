;; -*- lexical-binding: t; -*-

;; Use spaces instead tabs
(setq indent-tabs-mode nil)

;; Do not make backup files
(setq make-backup-files nil) ;; Ojo

;; Use "y" and "n" to confirm/negate prompt instead of "yes" and "no"
;; Using `advice' here to make it easy to reverse in custom
;; configurations with `(advice-remove 'yes-or-no-p #'y-or-n-p)'
;;
;; N.B. Emacs 28 has a variable for using short answers, which should
;; be preferred if using that version or higher.
(if (boundp 'use-short-answers)
    (setq use-short-answers t)
  (advice-add 'yes-or-no-p :override #'y-or-n-p))


;; Show column number and matching parens
(column-number-mode t)
(show-paren-mode t)

;; Windows defaults
(when ON-WINDOWS
  (use-package powershell
    :defer t))

(provide 'vy-defaults)
