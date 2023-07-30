; initialization
(defvar user-home-directory (concat (getenv "HOME") "/"))
(setq user-emacs-directory (concat user-home-directory ".emacs.d/"))
(add-to-list 'load-path (concat user-emacs-directory "modules/"))

; package manager
(require 'setup-straight)

; thems/icons/fonts
(require 'setup-gruvbox)
(require 'setup-all-the-icons)
(require 'setup-unicode-fonts)

; completion systems
(require 'setup-ivy)
(require 'setup-swiper)
(require 'setup-counsel)
(require 'setup-consult)
(require 'setup-company)

; emulation layer
;(require 'setup-linarcx-keys)
;(require 'setup-xah-fly)
;(require 'setup-evil)

; programming
(require 'setup-dap)
(require 'setup-lsp)
(require 'setup-slime)

; utility
(require 'setup-which-key)
(require 'setup-ripgrep)
(require 'setup-projectile)

; UI
(require 'setup-centaur-tabs)
;(require 'setup-doom-modeline)
;(require 'setup-beacon) ; A light that follows your cursor around so you don't lose it! --> https://github.com/Malabarba/beacon

; extra funcionality
(require 'setup-dired)

; internal
(require 'setup-general)
(require 'setup-hooks)
(require 'setup-mappings)

; multi-platform
(require 'setup-linux)
(require 'setup-windows)

; modes
(add-to-list 'load-path (concat user-emacs-directory "modes/"))

(require 'setup-archive-mode)
(require 'setup-foundamental-mode)
(require 'setup-help-mode)
(require 'setup-image-mode)
(require 'setup-latex-mode)
(require 'setup-prog-mode)
(require 'setup-srt-mode)
(require 'setup-cmake-mode)


(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'xah-fly-keys)

;; specify a layout
(xah-fly-keys-set-layout "qwerty")

(xah-fly-keys 1)
