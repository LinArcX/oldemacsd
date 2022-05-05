(use-package company-box :ensure :straight (company-box :type git :host github :repo "dakra/company-box"))
(require 'company-box)
(add-hook 'company-mode-hook 'company-box-mode)

(require 'setup-company-box)
