(add-hook 'prog-mode-hook (lambda ()
  (hl-line-mode t)
	(electric-pair-mode 1)
	;(display-fill-column-indicator-mode)
	(company-mode)
	))

(eval-after-load "prog-mode" '(progn
  (define-key prog-mode-map (kbd "C-q") 'kill-this-buffer)))

(provide 'setup-prog-mode)
