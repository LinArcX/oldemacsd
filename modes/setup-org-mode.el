(add-hook 'org-mode-hook (lambda ()
  (hl-line-mode t)
	(org-bullets-mode 1)
	(electric-pair-mode 1)
	;(display-line-numbers-mode)
	(display-fill-column-indicator-mode)))

(eval-after-load "org" '(progn
  (define-key org-mode-map (kbd "C-c a") 'org-agenda-list)
	(define-key org-mode-map (kbd "C-q") 'kill-this-buffer)))

(provide 'setup-org-mode)
