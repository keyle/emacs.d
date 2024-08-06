;;; package --- copilot setup

(use-package copilot
  :quelpa (copilot :fetcher github :repo "copilot-emacs/copilot.el" :files ("*.el"))
  :hook (prog-mode . copilot-mode)
  :config
  (setq copilot-node-executable "/opt/homebrew/opt/node@20/bin/node")
  (dolist (mode '(prog-mode org-mode text-mode closure-mode emacs-lisp-mode))
    (add-to-list 'copilot-indentation-alist (cons mode 2))) ;; necessary for dart
  (with-eval-after-load 'copilot
    (define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)
    (define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion))
  (add-to-list 'copilot-major-mode-alist '("enh-ruby" . "ruby"))
  (add-to-list 'copilot-indentation-alist '(prog-mode 2))
  (add-to-list 'copilot-indentation-alist '(org-mode 2))
  (add-to-list 'copilot-indentation-alist '(text-mode 2))
  (add-to-list 'copilot-indentation-alist '(closure-mode 2))
  (add-to-list 'copilot-indentation-alist '(emacs-lisp-mode 2)))
