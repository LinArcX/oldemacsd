(eval-after-load "markdown-mode" '(progn
  (define-key markdown-mode-map (kbd "C-q") 'kill-this-buffer)))

(provide 'setup-markdown-mode)
