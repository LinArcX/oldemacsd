(eval-after-load "archive-mode" '(progn
  (define-key archive-mode-map (kbd "q") 'kill-current-buffer)))

(provide 'setup-archive-mode)
