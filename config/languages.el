
;; LSP mode
(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook ((c-mode . lsp-deferred)
	 (go-mode . lsp-deferred)        ; Add go-mode hook
         (php-mode . lsp-deferred)
         (python-mode . lsp-deferred)
         (c++-mode . lsp-deferred))
  :config
    (setq lsp-intelephense-format-braces "k&r") ; lsp language specific settings
)

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

(require 'lsp-ui)

;; https://emacs-lsp.github.io/lsp-ui/#lsp-ui-sideline
(add-hook 'lsp-mode-hook 'lsp-ui-mode)
(setq-default lsp-ui-sideline-enable t)
(setq-default lsp-ui-sideline-show-diagnostics t)

(add-hook 'c-mode-hook (lambda ()
                         (setq c-basic-offset 4) ; important to get 4 spaces on enter
                         ))

(add-hook 'after-init-hook #'global-flycheck-mode)


;; LSP Dart

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(setq package-selected-packages 
  '(dart-mode lsp-mode lsp-dart lsp-treemacs flycheck company
    ;; Optional packages
    lsp-ui company hover))

(when (cl-find-if-not #'package-installed-p package-selected-packages)
  (package-refresh-contents)
  (mapc #'package-install package-selected-packages))

(add-hook 'dart-mode-hook 'lsp)

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024))
