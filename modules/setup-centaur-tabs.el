(straight-use-package 'centaur-tabs)

(centaur-tabs-mode t)
(centaur-tabs-headline-match)
(centaur-tabs-group-by-projectile-project)
(centaur-tabs-change-fonts "FantasqueSansMono" 130)

(setq centaur-tabs-set-icons t)
(setq centaur-tabs-set-bar 'over)
(setq centaur-tabs-style "slant")
(setq centaur-tabs-modified-marker "∙")
(setq centaur-tabs-set-modified-marker t)
(setq centaur-tabs-gray-out-icons 'buffer)

(global-set-key (kbd "C-<left>")  'centaur-tabs-backward)
(global-set-key (kbd "C-<right>") 'centaur-tabs-forward)

(provide 'setup-centaur-tabs)
