(straight-use-package 'projectile)

(require 'projectile)
(setq projectile-indexing-method 'alien)
(setq projectile-enable-caching t)
(projectile-global-mode)

(provide 'setup-projectile)
