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
   '(minibuffer-prompt ((t (:foreground "#b8bb26" :bold t ))))
   '(mode-line ((t (:foreground "#151515" :background "#928771" ))))
   '(font-lock-warning-face ((t (:foreground "cyan" :bold t ))))
   )

;;;###autoload
(and load-file-name
    (boundp 'custom-theme-load-path)
    (add-to-list 'custom-theme-load-path
                 (file-name-as-directory
                  (file-name-directory load-file-name))))

(provide-theme 'keyle)

;;; keyle-theme.el ends here
