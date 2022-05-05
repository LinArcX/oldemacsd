;; Install `clang` and make sure you have `lldb-vscode` on your path.
;; Then compile your applicatoin with -g flag(to generate debug symbols)
;; Also you need to generate two more files and put them in the root of your project:
;; 1. `launch.json` (DAP-side)
;;   {
;;     "configurations": [
;; 	     {
;; 	         "type": "lldb-vscode",
;; 	         "request": "launch",
;; 	         "name": "Test dap-lldb",
;; 	         "program": "${workspaceFolder}/main",
;; 	         "cwd": "${workspaceFolder}",
;; 	         "args": [],
;;                  "externalConsole": true,
;;                  "stopAtEntry": true,
;;                  "MIMode": "lldb",
;; 	     }
;;     ]
;; }
;; 2. `compile_commands.json`(LSP-side) that you can can generate it like this:
;;   2.1. Generates a compilation database entry per input(clang)
;;     `clang++ -MJ b.o.json -Wall -std=c++11 -o b.o -c b.cpp`
;;        2.1.1. And to merge the compilation database entries into a valid compilation database,
;;          `sed -e '1s/^/[\n/' -e '$s/,$/\n]/' *.o.json > compile_commands.json`
;;   2.2. For other build-systems and compilers: https://sarcasm.github.io/notes/dev/compilation-database.html

(straight-use-package 'dap-mode)

(eval-after-load "dap-mode" '(progn
		   (define-key dap-mode-map (kbd "<f5>") 'linarcx-dap-breakpoints)
		   (define-key dap-mode-map (kbd "<f6>") 'dap-next)
		   (define-key dap-mode-map (kbd "<f7>") 'dap-step-in)
		   (define-key dap-mode-map (kbd "<f8>") 'dap-step-out)
		   (define-key dap-mode-map (kbd "<f9>") 'dap-continue)
		   (define-key dap-mode-map (kbd "<f10>") 'dap-disconnect)))

(progn
  (define-prefix-command 'linarcx-dap-breakpoints)

  (define-key linarcx-dap-breakpoints (kbd "a") nil) ; nested prefix
  (define-key linarcx-dap-breakpoints (kbd "a d") 'dap-debug)
  (define-key linarcx-dap-breakpoints (kbd "a l") 'dap-debug-last)
  (define-key linarcx-dap-breakpoints (kbd "a n") 'dap-debug-recent)
  (define-key linarcx-dap-breakpoints (kbd "a e") 'dap-debug-edit-template)
  (define-key linarcx-dap-breakpoints (kbd "a g") 'dap-go-to-output-buffer)
  (define-key linarcx-dap-breakpoints (kbd "a o") 'dap-stop-thread)
  (define-key linarcx-dap-breakpoints (kbd "a r") 'dap-restart-frame)
  (define-key linarcx-dap-breakpoints (kbd "a f") 'dap-switch-stack-frame)
  (define-key linarcx-dap-breakpoints (kbd "a t") 'dap-switch-thread)
  (define-key linarcx-dap-breakpoints (kbd "a s") 'dap-switch-session)

  (define-key linarcx-dap-breakpoints (kbd "b") nil) ; nested prefix
  (define-key linarcx-dap-breakpoints (kbd "b t") 'dap-breakpoint-toggle)
  (define-key linarcx-dap-breakpoints (kbd "b a") 'dap-breakpoint-add)
  (define-key linarcx-dap-breakpoints (kbd "b d") 'dap-breakpoint-delete)
  (define-key linarcx-dap-breakpoints (kbd "b g") 'dap-ui-breakpoints-goto)
  (define-key linarcx-dap-breakpoints (kbd "b l") 'dap-ui-breakpoints-delete)
  (define-key linarcx-dap-breakpoints (kbd "b s") 'dap-ui-breakpoints-delete-selected)
  (define-key linarcx-dap-breakpoints (kbd "b m") 'bui-list-mark)
  (define-key linarcx-dap-breakpoints (kbd "b u") 'bui-list-unmark)
  (define-key linarcx-dap-breakpoints (kbd "b n") 'bui-list-unmark-all)

  (define-key linarcx-dap-breakpoints (kbd "e") nil) ; nested prefix
  (define-key linarcx-dap-breakpoints (kbd "e e") 'dap-eval)
  (define-key linarcx-dap-breakpoints (kbd "e r") 'dap-eval-region)
  (define-key linarcx-dap-breakpoints (kbd "e p") 'dap-eval-thing-at-point)

  (define-key linarcx-dap-breakpoints (kbd "u") nil) ; nested prefix
  (define-key linarcx-dap-breakpoints (kbd "u r") 'dap-ui-repl)
  (define-key linarcx-dap-breakpoints (kbd "u l") 'dap-ui-locals)
  (define-key linarcx-dap-breakpoints (kbd "u e") 'dap-ui-expressions)
  (define-key linarcx-dap-breakpoints (kbd "u b") 'dap-ui-breakpoints)
  (define-key linarcx-dap-breakpoints (kbd "u s") 'dap-ui-sessions))

(provide 'setup-dap)
