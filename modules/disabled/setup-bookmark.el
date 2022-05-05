;;(setq bookmark-save-flag 1)
(add-hook 'bmkp-before-jump-hook
  (lambda()
  ;;(bookmark-save)
  ;;(bmkp-refresh-menu-list)
  (bmkp-bmenu-refresh-menu-list)))

(eval-after-load "bookmark" '(progn
  (define-key bookmark-bmenu-mode-map (kbd "G") (lambda() (interactive) (evil-goto-line (count-lines (point-min) (point-max)))))
	(define-key bookmark-bmenu-mode-map (kbd "l") 'bookmark-bmenu-this-window)
	(define-key bookmark-bmenu-mode-map (kbd "j") 'next-line)
	(define-key bookmark-bmenu-mode-map (kbd "k") 'previous-line)
	(define-key bookmark-bmenu-mode-map (kbd "u") nil)
	(define-key bookmark-bmenu-mode-map (kbd "d") nil)
	(define-key bookmark-bmenu-mode-map (kbd "m") nil)
	(define-key bookmark-bmenu-mode-map (kbd "h") (lambda() (interactive) (switch-to-buffer "*Ibuffer*")))))

(provide 'setup-bookmark)
