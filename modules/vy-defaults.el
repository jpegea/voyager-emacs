;; -*- lexical-binding: t; -*-

;; Use spaces instead tabs
(setq indent-tabs-mode nil)

;; Do not make backup files
(setq make-backup-files nil) ;; Ojo

;; Refresh buffers
(global-auto-revert-mode)

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


;; Some keys
(global-set-key (kbd "C-S-x o") 'other-frame)
(global-set-key (kbd "C-S-r") 'query-replace)

(defun goto-top-line ()
  "Go to the first line of the buffer."
  (interactive)
  (goto-line 1))

(defun goto-bottom-line ()
  "Go to the last line of the buffer."
  (interactive)
  (let ((lines (count-lines (point-min) (point-max))))
    (goto-line lines)))

(global-set-key (kbd "M-g t") #'goto-top-line)
(global-set-key (kbd "M-g b") #'goto-bottom-line)

(provide 'vy-defaults)
