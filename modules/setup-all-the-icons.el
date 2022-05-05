(straight-use-package 'all-the-icons)
(require 'all-the-icons)

;; run this command with M-x just once -> (all-the-icons-install-fonts)
(all-the-icons-icon-for-buffer)
(setq inhibit-compacting-font-caches t)

(provide 'setup-all-the-icons)
