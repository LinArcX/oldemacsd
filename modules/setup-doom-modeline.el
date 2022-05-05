(use-package doom-modeline
  :straight (doom-modeline :host github :repo "seagle0128/doom-modeline"))

(require 'doom-modeline)
(doom-modeline-mode 1)

(setq doom-modeline-support-imenu t)
(setq doom-modeline-height 15)
(setq doom-modeline-bar-width 4)
(setq doom-modeline-hud nil)
(setq doom-modeline-window-width-limit 0.25)
(setq doom-modeline-project-detection 'auto)
(setq doom-modeline-buffer-file-name-style 'auto)
(setq doom-modeline-icon (display-graphic-p))
(setq doom-modeline-major-mode-icon nil)
(setq doom-modeline-major-mode-color-icon nil)
(setq doom-modeline-buffer-state-icon nil)
(setq doom-modeline-buffer-modification-icon nil)
(setq doom-modeline-unicode-fallback nil)
(setq doom-modeline-buffer-name nil)
(setq doom-modeline-minor-modes nil)
(setq doom-modeline-enable-word-count nil)
(setq doom-modeline-continuous-word-count-modes '(markdown-mode gfm-mode org-mode))
(setq doom-modeline-buffer-encoding t)
(setq doom-modeline-indent-info nil)
(setq doom-modeline-checker-simple-format t)
(setq doom-modeline-number-limit 99)
(setq doom-modeline-vcs-max-length 12)
(setq doom-modeline-workspace-name t)
(setq doom-modeline-persp-name t)
(setq doom-modeline-display-default-persp-name nil)
(setq doom-modeline-persp-icon t)
;(setq doom-modeline-lsp t)

(provide 'setup-doom-modeline)