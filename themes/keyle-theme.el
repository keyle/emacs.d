
;;; keyle-theme.el --- keyle
;;; Version: 1.0
;;; Generated with https://emacsfodder.github.io/emacs-theme-editor/
;;; Code:


(deftheme keyle "DOCSTRING for keyle")
  (custom-theme-set-faces 'keyle
   '(default ((t (:foreground "#d1d1d1" :background "#181818" ))))
   '(cursor ((t (:background "#fccf00" ))))
   '(fringe ((t (:background "#181818" ))))
   '(region ((t (:background "#505D4A" ))))
   '(secondary-selection ((t (:background "#524338" ))))
   '(font-lock-builtin-face ((t (:foreground "#9bd4b1" ))))
   '(font-lock-comment-face ((t (:foreground "#649a93" ))))
   '(font-lock-function-name-face ((t (:foreground "#A9C49B" )))) ; ffcd11
   '(font-lock-keyword-face ((t (:foreground "#d2c19f" ))))
   '(font-lock-string-face ((t (:foreground "#42d2b2" ))))
   '(font-lock-type-face ((t (:foreground "#d2c19f" ))))
   '(font-lock-constant-face ((t (:foreground "#d2c19f" ))))
   '(font-lock-variable-name-face ((t (:foreground "#9BC4B4" ))))
   '(lsp-face-highlight-textual ((t (:background "#37474F" :foreground nil :bold t)))) ; highlighting by lsp
   '(minibuffer-prompt ((t (:foreground "#b8bb26" :bold t ))))
   '(mode-line ((t (:foreground "#444444"))))
   '(mode-line-active ((t (:foreground "#999999"))))
   '(mode-line-inactive ((t (:foreground "#444444"))))
   '(mode-line-highlight ((t (:foreground "#b8bb26" :bold t ))))
   '(mode-line-buffer-id ((t (:foreground "#A9C49B" :bold t ))))
   '(mode-line-emphasis ((t (:foreground "#b8bb26" :bold t ))))
   ;'(font-lock-warning-face ((t (:foreground "#ffcd11" :bold t ))))

   ;; flycheck
   ;'(flycheck-error ((t (:underline (:style wave :color "#ffcd11")))))
   ;'(flycheck-warning ((t (:underline (:style wave :color "#ffcd11")))))
   '(flycheck-info ((t (:underline (:style wave :color "#649a93")))))

   ;; line number
   '(line-number ((t (:foreground "#444444" :background "#181818" ))))
   '(line-number-current-line ((t (:foreground "#d2c19f" :background "#181818" ))))
   )

;;;###autoload
(and load-file-name
    (boundp 'custom-theme-load-path)
    (add-to-list 'custom-theme-load-path
                 (file-name-as-directory
                  (file-name-directory load-file-name))))

(provide-theme 'keyle)

;;; keyle-theme.el ends here
