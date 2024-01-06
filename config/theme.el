;; theme override

;; I currently use badger


(defun my/apply-theme (appearance)
  "Load theme, taking current system APPEARANCE into consideration."
  (mapc #'disable-theme custom-enabled-themes)
  (pcase appearance
    ('light (load-theme 'tango t))
    ('dark (load-theme 'tango-dark t))))

;; Set font
(set-frame-font "Zed Mono-17" nil t)

;; Load theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; (load-theme 'timu-macos t)  ; Replace with your chosen theme
(load-theme 'badger t)

;; overwrite the gutter

(set-face-attribute 'line-number nil
                    :foreground "#555555"  ; Change the color
                    )

(set-face-attribute 'region nil :background "#483A05") ; Selection colour


;; overwrite the bottom bar

;; mode line (bottom line)
;; hide mode-line
;; (setq mode-line-format nil)		


;; (custom-set-faces
;;  '(mode-line-inactive ((t (:background "#111111" :foreground "#CCCCCC" :box "Red"))))
;;  '(mode-line-active ((t (:background "#002233" :foreground "#CCCCCC")))))

(custom-set-faces
 '(mode-line-active ((t (:foreground "#bbbbbb" :background "DarkBlue"))))
 '(mode-line-inactive ((t (:foreground "#444444" :background "#222222" )))))

