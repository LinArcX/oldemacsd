(autoload 'ibuffer "ibuffer" "List buffers." t)

(setq ibuffer-show-empty-filter-groups nil)
(setq ibuffer-saved-filter-groups
'(("home"
   ("Fundamental" (mode . fundamental-mode))
   ("Text" (name . ".txt"))
   ("Srt" (mode . srecode-template-mode))
   ("C" (mode . c-mode))
   ("C++" (mode . c++-mode))
   ("Python" (mode . python-mode))
   ("Lisp" (mode . lisp-mode))
   ("ELisp" (mode . emacs-lisp-mode))
   ("JavaScript" (mode . javascript-mode))
   ("Json" (mode . js-mode))
   ("LaTeX" (mode . latex-mode))
   ("Org" (mode . org-mode))
   ("Markdown" (mode . markdown-mode))
   ("PDF" (mode . pdf-view-mode))
   ("Shell" (mode . sh-mode))
   ("Dired" (mode . dired-mode))
   ("Rcirc" (mode . rcirc-mode))
   ("Aria2" (mode . aria2-mode))
   ("Debugger" (mode . debugger-mode))
   ("Magit" (or (mode . magit-mode)
	  (mode . magit-status-mode)
	  (mode . magit-diff-mode)
	  (mode . magit-process-mode)
	  (mode . magit-revision-mode)
	  (mode . magit-blame-mode)
	  (mode . magit-repolist-mode)
	  ))
   ("Help" (or (mode . help-mode)
	 (mode . Info-mode)))
   )))

(eval-after-load "ibuffer" '(progn
  ;;(define-key ibuffer-mode-map (kbd "G") (lambda() (interactive) (evil-goto-line (count-lines (point-min) (point-max)))))
  (define-key ibuffer-mode-map (kbd "l") 'ibuffer-visit-buffer)
  (define-key ibuffer-mode-map (kbd "j") 'next-line)
  (define-key ibuffer-mode-map (kbd "k") 'previous-line)
  (define-key ibuffer-mode-map (kbd "SPC") 'linarcx-toggle-deletion-mark)
  (define-key ibuffer-mode-map (kbd "h") (lambda() (interactive) (switch-to-buffer "*Bookmark List*")))))

; Functions
(defun linarcx-toggle-deletion-mark (start end arg)
  (interactive (ibuffer-get-region-and-prefix))
  (if (eq ?D (ibuffer-current-mark))
    (ibuffer-unmark-forward start end arg)
    (ibuffer-mark-for-delete start end arg)))

; Hooks
(add-hook 'ibuffer-mode-hook
    '(lambda ()
 (ibuffer-auto-mode 1)
 (ibuffer-switch-to-saved-filter-groups "home")))

(provide 'setup-ibuffer)
