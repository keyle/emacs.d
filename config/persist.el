
;;;;;;;;;;;;;;;;;;;;;;; window size ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; remember window size on quit

(defun save-frame-geometry ()
  (let ((frame-geometry (list (frame-parameter nil 'left)
                              (frame-parameter nil 'top)
                              (frame-parameter nil 'width)
                              (frame-parameter nil 'height))))
    (with-temp-buffer
      (insert (prin1-to-string frame-geometry))
      (write-file (expand-file-name "~/.emacs.d/frame-geometry")))))


(add-hook 'kill-emacs-hook 'save-frame-geometry)

;; save desktop panes

(add-hook 'kill-emacs-hook 'desktop-save-in-desktop-dir)


;; only restore/reload history the buffer of the last X

(setq desktop-restore-eager 7)


;; restore window size onload

(defun restore-frame-geometry ()
  (let ((geometry-file (expand-file-name "~/.emacs.d/frame-geometry")))
    (when (file-exists-p geometry-file)
      (let ((frame-geometry (with-temp-buffer
                              (insert-file-contents geometry-file)
                              (read (buffer-string)))))
        (set-frame-position (selected-frame) (nth 0 frame-geometry) (nth 1 frame-geometry))
        (set-frame-size (selected-frame) (nth 2 frame-geometry) (nth 3 frame-geometry) )))))

(add-hook 'after-init-hook 'restore-frame-geometry)
