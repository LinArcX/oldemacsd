; Settings
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(show-paren-mode 1)

(line-number-mode t)
(column-number-mode t)
(global-display-line-numbers-mode t)

;(setq line-number-mode t)

(add-to-list 'default-frame-alist '(font . "FantasqueSansMono-13")) ; CascadiaCode / Cascadia Code

(defun linarcx-term-mode-hook ()
  (define-key term-raw-map (kbd "C-y") 'term-paste)
  (define-key term-raw-map (kbd "C-k")
  (lambda ()
    (interactive)
    (term-send-raw-string "\C-k")
    (kill-line))))

(defun linarcx-delete-trailing-whitespace ()
  (delete-trailing-whitespace)
  (if (eq major-mode 'c-mode) (call-process-shell-command (concat "clang-format -i " (buffer-file-name))) (message "wrong major-mode")))

(defun disable-all-themes ()
  (dolist (i custom-enabled-themes)
    (disable-theme i)))

;; (setq auto-revert-verbose nil)
;; (global-auto-revert-mode -1)
(global-auto-revert-mode t)

(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Defer garbage collection further back in the startup process
(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)

;; Improve Performance in image-view, pdf-view.
(setq jit-lock-defer-time 0.05)
(setq show-paren-style 'mixed)
(setq debug-on-error t)
(setq create-lockfiles nil)
(setq help-window-select t)
(setq auto-save-default nil)
(setq make-backup-files nil)
(setq vc-follow-symlinks nil)
(setq inhibit-splash-screen t)
(setq delete-by-moving-to-trash t)
(defalias 'yes-or-no-p 'y-or-n-p)

(setq comp-deferred-compilation t)
(setq byte-compile-warnings '(cl-functions))
;;(setq calendar-week-start-day 6)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)

(run-at-time "09:00" nil (lambda () (load-theme 'gruvbox-light-hard t)))
(run-at-time "11:00" nil (lambda () (load-theme 'gruvbox-light-medium t)))
(run-at-time "16:00" nil (lambda () (load-theme 'gruvbox-light-soft t)))
(run-at-time "17:00" nil (lambda () (load-theme 'gruvbox-dark-soft t)))
(run-at-time "19:00" nil (lambda () (load-theme 'gruvbox-dark-medium t)))
(run-at-time "21:00" nil (lambda () (load-theme 'gruvbox-dark-hard t)))
(run-at-time "02:00" nil (lambda () (load-theme 'gruvbox-dark-medium t)))
(run-at-time "05:00" nil (lambda () (load-theme 'gruvbox-dark-soft t)))
(run-at-time "07:00" nil (lambda () (load-theme 'gruvbox-light-soft t)))
(run-at-time "08:00" nil (lambda () (load-theme 'gruvbox-light-medium t)))

; Functions
(defun linarcx-set-current-theme()
  (interactive)
  (setq linarcx-current-hour (nth 2 (decode-time (current-time))))
  (cond (
    (and (>= linarcx-current-hour 9) (< linarcx-current-hour 11))
      (load-theme 'gruvbox-light-hard t)
    (and (>= linarcx-current-hour 11) (< linarcx-current-hour 16))
      (load-theme 'gruvbox-light-medium t)
    (and (>= linarcx-current-hour 16) (< linarcx-current-hour 17))
      (load-theme 'gruvbox-light-soft t)
    (and (>= linarcx-current-hour 17) (< linarcx-current-hour 19))
      (load-theme 'gruvbox-dark-soft t)
    (and (>= linarcx-current-hour 19) (< linarcx-current-hour 21))
      (load-theme 'gruvbox-dark-medium t)
    (and (>= linarcx-current-hour 21) (< linarcx-current-hour 0))
      (load-theme 'gruvbox-dark-hard t)
    (and (>= linarcx-current-hour 0) (< linarcx-current-hour 2))
      (load-theme 'gruvbox-dark-hard t)
    (and (>= linarcx-current-hour 2) (< linarcx-current-hour 5))
      (load-theme 'gruvbox-dark-medium t)
    (and (>= linarcx-current-hour 5) (< linarcx-current-hour 7))
      (load-theme 'gruvbox-dark-soft t)
    (and (>= linarcx-current-hour 7) (< linarcx-current-hour 8))
      (load-theme 'gruvbox-light-soft t)
    (and (>= linarcx-current-hour 8) (< linarcx-current-hour 9))
      (load-theme 'gruvbox-light-medium t)
    )))

(defun linarcx-files-recursively (root extension)
  "List all files with `extension' in `root'"
  (interactive)
  (setq files (directory-files-recursively root extension)))

(defun linarcx-revert-buffer(&rest _)
  (revert-buffer))

; Hooks
(add-hook 'term-mode-hook 'linarcx-term-mode-hook)
(add-hook 'before-save-hook 'linarcx-delete-trailing-whitespace)

; Advice
(defadvice load-theme (before disable-themes-first activate)
  (disable-all-themes))

(defadvice term-handle-exit
  (after term-kill-buffer-on-exit activate)
  (kill-buffer))

(provide 'setup-general)
