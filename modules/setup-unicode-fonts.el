(straight-use-package 'unicode-fonts)

(defun my-hook-unicode-fonts-setup (frame)
  "Run unicode-fonts-setup, then remove the hook."
  (progn
  (select-frame frame)
  (unicode-fonts-setup)
  (message "Removing unicode-fonts-setup to after-make-frame-functions hook")
  (remove-hook 'after-make-frame-functions 'my-hook-unicode-fonts-setup)))

(add-hook 'after-make-frame-functions 'my-hook-unicode-fonts-setup nil)

(provide 'setup-unicode-fonts)
