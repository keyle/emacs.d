;; (add-to-list 'default-frame-alist '(undecorated-round . t))
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(delete-selection-mode 1) ; delete selection when I overwrite selection
(setq ring-bell-function 'ignore) ; turn off beeps
(setq make-backup-files nil) ; no backup file~


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; packages ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

 (require 'package)
 (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
 (package-initialize)
 
 (unless (package-installed-p 'use-package)
   (package-refresh-contents)
   (package-install 'use-package))


;; LSP mode
(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook ((c-mode . lsp-deferred)
	 (go-mode . lsp-deferred)        ; Add go-mode hook
         (php-mode . lsp-deferred)
         (python-mode . lsp-deferred)
         (c++-mode . lsp-deferred))
  :config)

;; python LSP
(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))  ; or lsp-deferred

(use-package go-mode
  :ensure t)

(use-package php-mode
  :ensure t)

(use-package lua-mode
  :ensure t
  :mode "\\.lua\\'")


;; remember cursor position

(require 'saveplace)
(setq-default save-place t)
(setq save-place-file "~/.emacs.d/saved-places")


;; end of file line

(setq-default require-final-newline t)


;; separator for panes

(setq-default window-divider-default-right-width 1)
(setq-default window-divider-default-places 'right-only)
(window-divider-mode 1)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;; header-line ;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load "~/.emacs.d/config/header.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;; multiple cursor ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package multiple-cursors
  :ensure t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; paddings ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'spacious-padding)

;; These is the default value, but I keep it here for visiibility.
(setq spacious-padding-widths
      '( :internal-border-width 20
         :header-line-width 1
         :mode-line-width 1
         :tab-width 4
         :right-divider-width 1
         :scroll-bar-width 2))

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
