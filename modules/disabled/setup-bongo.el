(defun linarcx-bongo-dired-insert-music-files ()
  "Add files in a `dired' buffer to the `bongo' playlist."
  (interactive)
  (setq media (linarcx-files-recursively linarcx-music-directory "\.mp3$"))
  (dolist (element media)
  (with-current-buffer (bongo-playlist-buffer)
  (bongo-insert-file element))))

(provide 'setup-bongo)
