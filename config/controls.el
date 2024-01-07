(setq-default mac-command-modifier 'meta)
(setq-default mac-option-modifier 'alt)

;; Turn off word-wrap
(setq-default truncate-lines t)

;; Make mouse scroll horizontally
(setq-default mouse-wheel-tilt-scroll t)
(setq-default mouse-wheel-flip-direction t)

;; Mouse wheel consistent
(setq-default mouse-wheel-scroll-amount '(0.01))
(setq-default mouse-wheel-progressive-speed nil)
(setq-default ring-bell-function 'ignore)

;; Shortcuts

(global-set-key [?\M-c] 'kill-ring-save)  ; Cmd+C for copy
(global-set-key [?\M-v] 'yank)            ; Cmd+V for paste
;; (global-set-key [?\M-q] 'save-buffers-kill-terminal) ; Cmd+Q to quit

(defun force-quit ()
  "Quit Emacs immediately without saving."
  (interactive)
  (kill-emacs))

(global-set-key (kbd "M-q") 'force-quit)

(global-set-key (kbd "M-w") 'delete-window)
(global-set-key (kbd "M-W") 'delete-other-windows)

(global-set-key (kbd "M-+") 'enlarge-window-horizontally)
;; (global-set-key (kbd "M-+") 'enlargewindow)

(global-set-key (kbd "M-t") 'find-file) ; new "tab" or pane

(global-set-key (kbd "M-[") 'previous-buffer) ; navigation back and forth
(global-set-key (kbd "M-]") 'next-buffer)


;; settings

(defun open-config ()
  "Open my Emacs configuration file."
  (interactive)
  (find-file "~/.emacs.d/config/main.el"))

(global-set-key (kbd "M-,") 'open-config)


;; clear recent file buffer list history

(defun clear-recentf-list ()
  "Clear the recent files list."
  (interactive)
  (setq desktop-buffer-mode-handlers nil)
  (desktop-clear)
  (delete-file (expand-file-name "~/.emacs.d/emacs.desktop"))
  (desktop-save-mode 1)
  (message "Cleared recent file list and desktop"))


(global-set-key (kbd "M-0") 'clear-recentf-list)



;; swap pane

(require 'window-jump)
(use-package window-jump
             :bind (("C-x <up>" . window-jump-up)
                    ("C-x <down>" . window-jump-down)
                    ("M-{" . window-jump-left)
                    ("M-}" . other-window)))

(global-set-key (kbd "M-z") 'undo)           ; Meta-z for undo
(global-set-key (kbd "M-Z") 'undo-redo)      ; Meta-Z for redo (Emacs 28+)

(defun split-window-right-and-move ()
  "Split the window vertically and move the cursor to the new window."
  (interactive)
  (split-window-right)
  (other-window 1))

(defun split-window-below-and-move ()
  "Split the window horizontally and move the cursor to the new window."
  (interactive)
  (split-window-below)
  (other-window 1))

;; (global-set-key (kbd "M-\\") 'split-window-right)  ; Meta-\ for vertical split
;; (global-set-key (kbd "M-|") 'split-window-below)  ; Meta-| for vertical split
(global-set-key (kbd "M-\\") 'split-window-right-and-move)
(global-set-key (kbd "M-|") 'split-window-below-and-move)


(global-set-key (kbd "M-s") 'save-buffer)           ; Meta-s save
(global-set-key (kbd "M-p") 'execute-extended-command) ; Meta-p commands
(global-set-key (kbd "<end>") 'move-end-of-line)
(global-set-key (kbd "<home>") 'move-beginning-of-line)
(global-set-key (kbd "M-a") 'mark-whole-buffer)


(define-key lsp-mode-map (kbd "M-g") 'lsp-find-definition)     ; Meta-g for go to definition
(define-key lsp-mode-map (kbd "M-G") 'lsp-find-implementation) ; Meta-G for list implementations
(global-set-key (kbd "M-r") 'lsp-rename)                        ; LSP rename


(global-set-key (kbd "A-e") 'lsp-format-buffer)

;; LSP format on save

(setq lsp-enable-on-type-formatting nil)
(add-hook 'before-save-hook 'lsp-format-buffer)



;; Clangd show the warnings on hover
(require 'lsp-treemacs)
(lsp-treemacs-sync-mode 1)
(global-set-key (kbd "<f1>") 'lsp-treemacs-errors-list)


;; move lines

(defun move-line-up ()
  (interactive)
  (transpose-lines 1)
  (previous-line 2))

(defun move-line-down ()
  (interactive)
  (next-line 1)
  (transpose-lines 1)
  (previous-line 1))

(global-set-key (kbd "A-<up>") 'move-line-up)
(global-set-key (kbd "A-<down>") 'move-line-down)


;; make ALT-shift-LEFT/RIGHT do word selection

;; (global-set-key (kbd "A-<left>") 'left-word)
;; (global-set-key (kbd "A-<right>") 'right-word)



;; multiple cursor search:

;; (defun select-next-word ()
;;   "Extend the selection to the next word."
;;   (interactive)
;;   (if (use-region-p)
;;       (goto-char (region-end))
;;     (set-mark (point)))
;;   (forward-word))

;; (defun select-previous-word ()
;;   "Extend the selection to the previous word."
;;   (interactive)
;;   (if (use-region-p)
;;       (goto-char (region-beginning))
;;     (set-mark (point)))
;;   (backward-word))


;; comment
(defun comment-region-or-line ()
  "Comment or uncomment the current region or line."
  (interactive)
  (if (use-region-p)
      (comment-or-uncomment-region (region-beginning) (region-end))
    (comment-or-uncomment-region (line-beginning-position) (line-end-position))))

(global-set-key (kbd "M-k") 'comment-region-or-line)

;; duplicate

(defun duplicate-line-or-region ()
  "Duplicate the current line, or the current region if active."
  (interactive)
  (let ((start (line-beginning-position))
        (end (line-end-position)))
    (if (use-region-p)
        (setq start (region-beginning)
              end (region-end)))
    (let ((region (buffer-substring start end)))
      (goto-char end)
      (unless (use-region-p) (newline))
      (insert region)
      (forward-line -1)
      (goto-char (line-beginning-position)))))


(global-set-key (kbd "M-d") 'duplicate-line-or-region)


;; TAB tabs
(setq-default indent-tabs-mode nil)


(defun cut-region-or-line ()
  "Kill the active region or the current line if no region is active."
  (interactive)
  (if (use-region-p)
      (kill-region (region-beginning) (region-end))  ; If there's a selection, kill it.
    (kill-whole-line)))                             ; Otherwise, kill the whole line.

(global-set-key (kbd "M-x") 'cut-region-or-line)

(defun copy-region-or-line ()
  "Copy the active region or the current line with newline if no region is active."
  (interactive)
  (if (use-region-p)
      (kill-ring-save (region-beginning) (region-end))
    (kill-ring-save (line-beginning-position) (line-end-position 1))))

(global-set-key (kbd "M-c") 'copy-region-or-line)



;; Custom function for opening files
(defun open-file-by-name ()
  (interactive)
  (call-interactively 'find-file))

;; Bind Cmd+Shift+R to open-file-by-nam
(global-set-key [?\M-o] 'open-file-by-name) 


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(package-selected-packages
   '(find-file-in-project lsp-treemacs lua-mode counsel ivy multiple-cursors spacious-padding lsp-pyright lsp-mode))
 '(tool-bar-mode nil))




(use-package ivy
  :ensure t
  :config
  (ivy-mode 1))

(use-package counsel
  :ensure t)

(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;; (global-set-key "\C-s" 'swiper)
;; (global-set-key (kbd "C-c C-r") 'ivy-resume)


;; (global-set-key (kbd "M-R") 'counsel-file-jump) ;; all files
(global-set-key (kbd "M-R") 'counsel-git) ;; git files only - safer


(global-set-key (kbd "<f6>") 'recompile)

;; (global-set-key (kbd "<f1>") 'imenu)
;; (global-set-key (kbd "<f6>") 'find-file-in-project)

(global-set-key (kbd "M-f") 'isearch-forward) ; find - swiper
(global-set-key (kbd "<f3>") 'isearch-query-replace) 


(define-key isearch-mode-map (kbd "M-n") 'isearch-repeat-forward)


(global-set-key (kbd "M-F") 'counsel-rg) ; ripgrep


;; open terminal

(global-set-key (kbd "M-;") 'eshell)


;;  counsel interface for fd
(require 'counsel)

(defvar counsel-fd-command "fd --hidden --color never "
  "Base command for fd.")


(require 'dired-x)

;;;###autoload
(defun counsel-fd-dired-jump (&optional initial-input initial-directory)
  (interactive
   (list nil
         (when current-prefix-arg
           (read-directory-name "From directory: "))))
  (counsel-require-program (car (split-string counsel-fd-command)))
  (let* ((default-directory (or initial-directory default-directory)))
    (ivy-read "Directory: "
              (split-string
               (shell-command-to-string
                (concat counsel-fd-command "--type d --exclude '*.git'"))
               "\n" t)
              :initial-input initial-input
              :action (lambda (d) (dired-x-find-file (expand-file-name d)))
              :caller 'counsel-fd-dired-jump)))

;;;###autoload
;; (defun counsel-fd-file-jump (&optional initial-input initial-directory)
;;   "Jump to a file below the current directory.
;; List all files within the current directory or any of its subdirectories.
;; INITIAL-INPUT can be given as the initial minibuffer input.
;; INITIAL-DIRECTORY, if non-nil, is used as the root directory for search."
;;   (interactive
;;    (list nil
;;          (when current-prefix-arg
;;            (read-directory-name "From directory: "))))
;;   (counsel-require-program (car (split-string counsel-fd-command)))
;;   (let* ((default-directory (or initial-directory default-directory)))
;;     (ivy-read "File: "
;;               (split-string
;;                (shell-command-to-string
;;                 (concat counsel-fd-command "--type f --exclude '*.git'"))
;;                "\n" t)
;;               :initial-input initial-input
;;               :action (lambda (d) (find-file (expand-file-name d)))
;;               :caller 'counsel-fd-file-jump)))

(provide 'counsel-fd)

;;; counsel-fd.el ends here

;; (global-set-key (kbd "M-C-r") 'counsel-fd-file-jump) ;; FD - more expensive than M-R
(global-set-key (kbd "<f7>") 'counsel-fd-dired-jump) ;; FD - more expensive than M-R


(defun reload-init-file ()
  (interactive)
  (load-file "~/.emacs"))

(global-set-key (kbd "<f12>") 'reload-init-file)


;; projects


(defun open-projects ()
  (interactive)
  (find-file "~/Code")
  (counsel-fd-dired-jump))

(global-set-key (kbd "M-P") 'open-projects)



