;; theme override

;; I currently use badger

(defun my/apply-theme (appearance)
  "Load theme, taking current system APPEARANCE into consideration."
  (mapc #'disable-theme custom-enabled-themes)
  (pcase appearance
    ('light (load-theme 'tango t))
    ('dark (load-theme 'tango-dark t))))

;; Set font
(set-frame-font "JetBrains Mono-16" nil t)
(setq-default line-spacing 0.25)

(set-variable 'frame-background-mode 'dark)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;  Load theme ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")


;; (load-theme 'timu-macos t)  ; Replace with your chosen theme
;; (load-theme 'badger t)
(load-theme 'keyle t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Gutter ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(set-face-attribute 'line-number nil
                    :foreground "#555555"  ; Change the color
                    )


;;;;;;;;;;;;;;;;;;;;;;;; Selection colour ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; (set-face-attribute 'region nil :background "#483A05") ; Selection colour
;; (set-face-attribute 'secondary-selection nil :background "#524338")


;;;;;;;;;;;;;;;;;;;;;;;;;; Bottom bar - mode line  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; hide mode-line
;; (setq mode-line-format nil)		


;; (custom-set-faces
;;  '(mode-line-active ((t (:foreground "#bbbbbb" :background "#313E31"))))
;;  '(mode-line-inactive ((t (:foreground "#444444" :background "#222222" )))))

(custom-set-faces
 '(mode-line-active ((t (:foreground "#151515" :background "#928771"))))
 '(mode-line-inactive ((t (:foreground "#444444" :background "#222222" )))))


;;;;;;;;;;;;;;;;;;;;; divider ;;;;;;;;;;;;;;;;;;;;;;

(set-face-foreground 'vertical-border "red")
(set-face-background 'vertical-border "red")

(window-divider-mode 1)
(setq window-divider-default-right-width 1)
(setq window-divider-default-bottom-width 0)
(setq-default window-divider-default-places 'right-only)

