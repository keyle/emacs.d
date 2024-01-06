
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
    (setq lsp-intelephense-format-braces "k&r") ; Example setting
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


;; (setq lsp-clients-clangd-args '("--query-driver=/usr/bin/arm-none-eabi-gcc" "--log=verbose"))

(require 'lsp-ui)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)
(setq-default lsp-ui-sideline-enable t)
(setq-default lsp-ui-sideline-show-diagnostics t)
(add-hook 'after-init-hook #'global-flycheck-mode)

