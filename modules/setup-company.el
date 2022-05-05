(use-package company
  :straight (company :type git :host github :repo "company-mode/company-mode")
  :ensure t
  :config
  (setq company-idle-delay 0)
  (setq company-selection-wrap-around 1)
  (setq company-minimum-prefix-length 0))

(setq company-global-modes '(not org-mode))

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-active-map (kbd "M-SPC") 'company-complete))

(provide 'setup-company)
