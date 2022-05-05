;; dired-find-file: open in normal mode | dired-view-file: open in lock mode | dired-display-file -> open in normal mode in half windows
;; Make dired open in the same window when using RET or ^
(put 'dired-find-alternate-file 'disabled nil) ; disables warning

(setq dired-dwim-target t)

; Functions
(defun linarcx-enable-dired-du (&optional ARG PRED)
  (if (eq dired-hide-details-mode t)
    (progn
      (dired-du-mode 0))
    (dired-du-mode 1)))

(defun linarcx-quit ()
  (interactive)
  (setq leng (length (window-list)))
  (cond ((eq leng 1) (kill-current-buffer))
  (t (delete-window))))

(defun linarcx-dired-open()
  (interactive)
  (setq file (dired-get-file-for-visit))
  (setq ext (file-name-extension file))
  (cond ((string= ext "pdf") (dired-find-file))
    ((string= ext "rar") (dired-view-file))
    ((string= ext "zip") (dired-view-file))
    ((string= ext "mp4") (start-process "Mpv" nil "mpv" file))
    ((string= ext "avi") (start-process "Mpv" nil "mpv" file))
    ((string= ext "mkv") (start-process "Mpv" nil "mpv" file))
    ((string= ext "gif") (start-process "Mpv" nil "mpv" file))
    ((string= ext "flv") (start-process "Mpv" nil "mpv" file))
    ((string= ext "ogv") (start-process "Mpv" nil "mpv" file))
    ((string= ext "wmv") (start-process "Mpv" nil "mpv" file))
    ((string= ext "jpg") (dired-view-file))
    ((string= ext "png") (dired-view-file))
    ((string= ext "mp3") (bongo-dired-play-line))
    ((string= ext "3gp") (bongo-dired-play-line))
    ((string= ext "aac") (bongo-dired-play-line))
    ((string= ext "ogg") (bongo-dired-play-line))
    ((string= ext "wav") (bongo-dired-play-line))
  (t (dired-find-file))))

; Advice
(advice-add #'dired-hide-details-mode
  :after
	#'linarcx-enable-dired-du)

(advice-add #'dired-create-empty-file
	:after
	#'linarcx-revert-buffer)

(advice-add #'dired-create-directory
	:after
	#'linarcx-revert-buffer)

(advice-add #'dired-up-directory
	:after
	#'linarcx-revert-buffer)

(advice-add #'linarcx-dired-open
	:after
	#'linarcx-revert-buffer)

; Hooks
(add-hook 'dired-mode-hook
  (lambda ()
  ;(dired-du-mode)
  (dired-omit-mode)
  (hl-line-mode t)
  (dired-hide-details-mode)))

(eval-after-load "dired" '(progn
		(define-key dired-mode-map (kbd "p") nil)
		(define-key dired-mode-map (kbd "n") nil)
		(define-key dired-mode-map (kbd "l") 'linarcx-dired-open) ; was dired-advertised-find-file
		(define-key dired-mode-map (kbd "h") 'dired-up-directory) ;(lambda () (interactive) (find-alternate-file "..")))
		(define-key dired-mode-map (kbd "i") 'dired-subtree-toggle)
		(define-key dired-mode-map (kbd "j") 'dired-next-line)
		(define-key dired-mode-map (kbd "k") 'dired-previous-line)
		(define-key dired-mode-map (kbd "q") 'linarcx-quit)
		(define-key dired-mode-map (kbd ":") 'linarcx-open-fav-dir)
		(define-key dired-mode-map (kbd ";") 'linarcx-open-fav-dir-vsplit)
		(define-key dired-mode-map (kbd "/") 'dired-narrow-regexp)
		(define-key dired-mode-map (kbd "[") 'dired-hide-details-mode)
		(define-key dired-mode-map (kbd "RET") 'linarcx-dired-open)
		(define-key dired-mode-map (kbd "SPC") 'dired-mark)
		(define-key dired-mode-map (kbd "<delete>") 'dired-do-delete)
		(define-key dired-mode-map (kbd "TAB") (lambda() (interactive)(other-window -1)))
		(define-key dired-mode-map (kbd "C-x C-d") 'dired-jump)
		(define-key dired-mode-map (kbd "C-x C-e") 'dired-jump-other-window)
		(define-key dired-mode-map (kbd "C-t") (lambda ()
							 (interactive)
							 (split-window-vertically)
							 (other-window 1)))
		(define-key dired-mode-map (kbd "<f6>") (lambda ()
							  (interactive)
							  (dired-do-rename)
							  (other-window 1)
							  (revert-buffer)
							  (dired-unmark-all-marks)))
		(define-key dired-mode-map (kbd "<f7>") 'dired-create-empty-file)
		(define-key dired-mode-map (kbd "<f8>") 'dired-create-directory)
		))

(provide 'setup-dired)
