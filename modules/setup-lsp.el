(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  (setq dap-auto-configure-features '(sessions locals controls tooltip))
  (setq dap-print-io t)
  :hook ((c-mode . lsp) (lsp-mode . lsp-enable-which-key-integration))
  :hook ((c++-mode . lsp) (lsp-mode . lsp-enable-which-key-integration))
  :straight (lsp-mode :type git :host github :repo "emacs-lsp/lsp-mode")
  :bind (:map global-map ("C-c d" . dap-debug))
  :config
  (require 'dap-lldb))

(require 'lsp-mode)
(setq lsp-ui-doc-enable t)
(straight-use-package 'lsp-ui)

(provide 'setup-lsp)
