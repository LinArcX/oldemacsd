(add-hook 'emacs-startup-hook
  '(lambda ()
  (linarcx-set-current-theme)
	;; Forces the messages to 0, and kills the *Messages* buffer - thus disabling it on startup.
	(setq-default message-log-max nil)
	(when (get-buffer "*Messages*")
	  (kill-buffer "*Messages*"))
	(when (get-buffer "*straight-process*")
	  (kill-buffer "*straight-process*"))
	))

(provide 'setup-hooks)
