(defun linarcx-reload-init-file ()
  (interactive)
  (load-file user-init-file)
  (unicode-fonts-setup))

(defun move-line-up ()
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

(defun move-line-down ()
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))

(defun linarcx-kill-current-window ()
  (interactive)
  (kill-current-buffer)
  (delete-other-windows))

;; Since you're using emacs in client/server mode, you shouldn't close it!
(global-unset-key (kbd "C-x C-c"))
(global-unset-key (kbd "C-x C-d"))

(global-set-key (kbd "M-q") 'linarcx-kill-current-window)
(global-set-key (kbd "M-f") 'swiper)

(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-S-s") 'shell-command)
(global-set-key (kbd "C-S-v") 'eval-expression)
(global-set-key (kbd "C-S-r") 'linarcx-reload-init-file)
(global-set-key (kbd "M-SPC") 'company-complete)
(global-set-key [(control shift up)]  'move-line-up)
(global-set-key [(control shift down)]  'move-line-down)
(global-set-key (kbd "C-x C-b") (lambda ()
		      (interactive)
		      (ibuffer)
		      (delete-other-windows)))

;(global-set-key "C-f" 'swiper)
;(global-set-key (kbd "<f6>") 'ivy-resume)
;(global-set-key (kbd "C-c C-r") 'ivy-resume)

;(eval-after-load "evil" '(progn
;  (define-key evil-motion-state-map (kbd "M-p") 'counsel-find-file)
;  (define-key evil-motion-state-map (kbd "C-f") 'projectile-find-file)
;  (define-key evil-motion-state-map (kbd "M-r") 'counsel-grep)
;  (define-key evil-motion-state-map (kbd "C-h k") 'counsel-descbinds)
;  (define-key evil-motion-state-map (kbd "C-b") 'consult-buffer)
;  (define-key evil-motion-state-map (kbd "<f1>") 'counsel-describe-function)
;	(define-key evil-motion-state-map (kbd "C-u") 'evil-scroll-up)))

(provide 'setup-mappings)

; counsel-git
;(define-key isearch-mode-map "\C-f" 'counsel-find-file)
;(define-key evil-mode-map (kbd "M-h") nil)
;(global-set-key (kbd "M-h") 'swiper)
;(global-set-key (kbd "C-f") 'counsel-find-file)
;(global-unset-key (kbd "C-f"))
