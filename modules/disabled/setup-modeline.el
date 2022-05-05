(defvar linarcx-mode-line/bottom-right nil)
(defvar-local linarcx-mode-line/dir nil)
(put 'linarcx-mode-line/dir 'risky-local-variable t)
(put 'linarcx-mode-line/bottom-right 'risky-local-variable t)

(defun linarcx-mode-line/update-dir ()
  (setq linarcx-mode-line/dir
  (if buffer-file-name
  (propertize
    (format "%s:%s"
      (or (system-name) (getenv "SYSTEM_NAME"))
      (reverse (truncate-string-to-width (reverse
        (replace-regexp-in-string "\\(^\\\./\\)" ""
	  (file-relative-name default-directory "~")))
        60 nil nil t)))
    'help-echo "Open dired buffer"
    'local-map (purecopy (make-mode-line-mouse-map
	  		 'mouse-1
	  		 (lambda () (interactive) (dired default-directory))))
    'mouse-face 'mode-line-highlight)
  nil)))

(defun linarcx-mode-line/padding-bottom-right ()
  (let ((r-length (length (format-mode-line linarcx-mode-line/bottom-right))))
  (propertize " "
    'display `(space :align-to (- right ,r-length)))))

; Hooks
(add-hook 'find-file-hook #'linarcx-mode-line/update-dir)

(setq linarcx-mode-line/bottom-right
  (if t
      '(""
  "%l:%C %o"
  " | "
  "%I")))

(setq-default mode-line-format
  '("%e"
    linarcx-mode-line/dir
    "%b"
    (:eval (linarcx-mode-line/padding-bottom-right))
    linarcx-mode-line/bottom-right))

(provide 'setup-modeline)

; linarcx-mode-line/major-mode
; linarcx-mode-line/modified

;(add-hook 'buffer-list-update-hook #'linarcx-mode-line/update-major-mode)
;(add-hook 'after-change-major-mode-hook #'linarcx-mode-line/update-major-mode t)

;(add-hook 'after-save-hook #'linarcx-mode-line/update-modified)
;(add-hook 'read-only-mode-hook #'linarcx-mode-line/update-modified)
;(add-hook 'buffer-list-update-hook #'linarcx-mode-line/update-modified)
;(add-hook 'first-change-hook (lambda () (linarcx-mode-line/update-modified "modified")))

; Advices
;(advice-add 'undo :after #'linarcx-mode-line/update-modified)

;(defvar-local linarcx-mode-line/modified nil)
;(defvar-local linarcx-mode-line/major-mode nil)
;(put 'linarcx-mode-line/modified 'risky-local-variable t)
;(put 'linarcx-mode-line/major-mode 'risky-local-variable t)

; Functions
;(defun linarcx-mode-line/update-major-mode (&rest _)
;  (let ((icon (all-the-icons-icon-for-buffer)))
;  (unless (symbolp icon)
;  (setq linarcx-mode-line/major-mode
;	(format "%s "
;	  (propertize icon
;	    'display '(raise 0.0)
;	    'help-echo (format "Major mode: `%s`" major-mode)))))))



;(defun linarcx-mode-line/update-modified (&optional arg)
;  (let ((icon (cond (buffer-read-only
;	   (propertize (all-the-icons-octicon "lock")
;	     'help-echo 'mode-line-read-only-help-echo
;	     'local-map (purecopy (make-mode-line-mouse-map
;				    'mouse-1
;				    #'mode-line-toggle-read-only))
;	     'mouse-face 'mode-line-highlight))
;	((or (buffer-modified-p) (string= arg "modified"))
;	   (propertize (all-the-icons-faicon "chain-broken")
;	     'help-echo 'mode-line-modified-help-echo
;	     'local-map (purecopy (make-mode-line-mouse-map
;				   'mouse-1
;				   #'save-buffer))
;	     'mouse-face 'mode-line-highlight))
;	(t
;	   (propertize (all-the-icons-faicon "link")
;	     'help-echo 'mode-line-read-only-help-echo
;	     'local-map (purecopy (make-mode-line-mouse-map
;				    'mouse-1
;				    #'mode-line-toggle-read-only))
;	     'mouse-face 'mode-line-highlight)))))
;  (setq linarcx-mode-line/modified
;    (format " %s " (propertize icon 'display '(raise 0.01))))
;  (force-mode-line-update)))
