;; (add-to-list 'default-frame-alist '(undecorated-round . t))

(delete-selection-mode 1) ; delete selection when I overwrite selection
(setq ring-bell-function 'ignore) ; turn off beeps
(setq make-backup-files nil) ; no backup file~

(setq desktop-dirname             "~/.emacs.d/"
      desktop-base-file-name      "emacs.desktop"
      desktop-base-lock-name      "lock"
      desktop-path                (list desktop-dirname)
      desktop-save                t
      desktop-files-not-to-save   "^$" ;reload tramp paths
      desktop-load-locked-desktop nil
      desktop-auto-save-timeout   30)

(setq use-layouts t)

(require 'desktop)
(desktop-save-mode 1)

;; enable line numbers in programming modes
;; (add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; turn off scroll bars
(scroll-bar-mode -1)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; packages ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

 (require 'package)
 (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
 (package-initialize)
 
 (unless (package-installed-p 'use-package)
   (package-refresh-contents)
   (package-install 'use-package))

;; LSP

(load "~/.emacs.d/config/languages.el")

;; remember cursor position

(require 'saveplace)
(setq-default save-place t)
(setq save-place-file "~/.emacs.d/saved-places")


;; end of file line

(setq-default require-final-newline t)


;; separator for panes


;; TODO vterm crashes on compile

;;;;;;;;;;;;;;;;;;;;;;;;;;;;; header-line ;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load "~/.emacs.d/config/header.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;; multiple cursor ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package multiple-cursors
  :ensure t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; paddings ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'spacious-padding)

;; These is the default value, but I keep it here for visiibility.
(setq spacious-padding-widths
      '( :internal-border-width 55
         :header-line-width 4
         :mode-line-width 1
         :tab-width 4
         :right-divider-width 4
         :scroll-bar-width 10))

;; Read the doc string of `spacious-padding-subtle-mode-line' as it
;; is very flexible and provides several examples.
(setq spacious-padding-subtle-mode-line
      `( :mode-line-active 'default
         :mode-line-inactive vertical-border))

(spacious-padding-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; theme ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(load "~/.emacs.d/config/theme.el")




;; Remap keys for macOS and mousewheel

(load "~/.emacs.d/config/controls.el")


;; Remember window size on quit

(load "~/.emacs.d/config/persist.el")
