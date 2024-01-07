;; ref https://www.emacswiki.org/emacs/HeaderLine

(defun with-face (str &rest face-plist)
   (propertize str 'face face-plist))

  (defun sl/make-header ()
    ""
    (let* ((sl/full-header (abbreviate-file-name buffer-file-name))
           (sl/header (file-name-directory sl/full-header))
           (sl/drop-str "[...]"))
      (if (> (length sl/full-header)
             (window-body-width))
          (if (> (length sl/header)
                 (window-body-width))
              (progn
                (concat (with-face sl/drop-str
                                   ;; :background "red"
                                   :weight 'bold
                                   )
                        (with-face (substring sl/header
                                              (+ (- (length sl/header)
                                                    (window-body-width))
                                                 (length sl/drop-str))
                                              (length sl/header))
                                   ;; :background "red"
                                   :weight 'bold
                                   )))
            (concat (with-face sl/header
                               ;; :background "red"
                               ;; :foreground "Orange"
                               :weight 'bold
                               )))
        (concat (with-face sl/header               ;; the path
                           ;; :background "DarkBlue"
                           :weight 'normal
                           ;; :foreground "#8fb28f"
                           :foreground "#999999"
                           )
                (with-face (file-name-nondirectory buffer-file-name)
                           :weight 'bold
			   :foreground "#FFCD11"
                           ;; :background "DarkBlue"
                           )))))

  (defun sl/display-header ()
    (setq header-line-format
          '("" ;; invocation-name
            (:eval (if (buffer-file-name)
                       (sl/make-header)
                     "%b")))))

  (add-hook 'buffer-list-update-hook
            'sl/display-header)
