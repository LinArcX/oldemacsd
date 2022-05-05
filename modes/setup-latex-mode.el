(defun linarcx-tex-commands ()
  (interactive)
  (setq completions `(
	  ("xelatex", (concat "clear; exec sh -c \"stty eof q;" (concat " xelatex " (concat (buffer-file-name) " ;read x\""))))
	  ("pdflatex" , (concat "clear; exec sh -c \"stty eof q;" (concat " pdflatex " (concat (buffer-file-name) " ;read x\""))))
	  ("view",
	   (concat "clear; exec sh -c \"stty eof q;"
		   (concat " ec "
			   (concat (file-name-sans-extension buffer-file-name)
				   (concat  ".pdf" " ;read x\"")
				   )
			   )
		   )
	   )
	  ))

  (setq choiceList(cdr (assoc (completing-read "Choose: " completions) completions)))
  (setq choice (car choiceList))
  (linarcx-run-commands-in-term choice))

(with-eval-after-load 'latex
  (define-key latex-mode-map (kbd "<f2> j") 'linarcx-tex-commands))

(provide 'setup-latex-mode)
