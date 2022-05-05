(use-package evil :ensure :straight (evil :type git :host github :repo "emacs-evil/evil"))
(require 'evil)
(evil-mode 1)

;(straight-use-package 'evil)
;(straight-use-package 'evil-collection)
;(setq evil-want-keybinding nil)
;(setq evil-kbd-macro-suppress-motion-error t)
;(autoload 'evil-local-mode "evil-core" t)
;(when (require 'evil-collection nil t)
;  (evil-collection-init))

(provide 'setup-evil)
