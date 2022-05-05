(eval-after-load "image-mode" '(progn
  (define-key image-mode-map (kbd "q") 'kill-current-buffer)))

(provide 'setup-image-mode)
