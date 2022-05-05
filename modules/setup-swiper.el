(use-package swiper :ensure :straight (swiper :type git :host github :repo "abo-abo/swiper"))

;enable this if you want `swiper' to use it
(setq search-default-mode #'char-fold-to-regexp)

(provide 'setup-swiper)
