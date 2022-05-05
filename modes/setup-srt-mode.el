(eval-after-load "srt-mode" '(progn
  (define-key srecode-template-mode-map (kbd "C-q") 'kill-this-buffer)))

(provide 'setup-srt-mode)
