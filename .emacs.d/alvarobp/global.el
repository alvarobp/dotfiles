(setq tags-file-name ".TAGS")

(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

;; UTF8 as default encoding
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Fix PATH on shell
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell
      (replace-regexp-in-string "[[:space:]\n]*$" ""
        (shell-command-to-string "$SHELL -l -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))
(when (equal system-type 'darwin) (set-exec-path-from-shell-PATH))

;; Backups stolen from http://github.com/febuiles/dotemacs/tree/master/temp_files.el
(defvar user-temporary-file-directory
  (concat (getenv "HOME") "/.saves" "/"))
(make-directory user-temporary-file-directory t)
(setq backup-by-copying t)
(setq backup-directory-alist
      `(("." . ,user-temporary-file-directory)
        (,tramp-file-name-regexp nil)))
(setq auto-save-list-file-prefix
      (concat user-temporary-file-directory ".auto-saves-"))
(setq auto-save-file-name-transforms
      `((".*" ,user-temporary-file-directory t)))

;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; Maximize window on startup
(require 'maxframe)
(add-hook 'window-setup-hook 'maximize-frame t)

;; Disable splash screen
(setq inhibit-splash-screen t)

;; Disable menu-bar
(menu-bar-mode 0)

;; Disable toolbar
(when (functionp 'tool-bar-mode)
  (tool-bar-mode -1))

;; Don't show the startup screen
(setq inhibit-startup-message t)

;; Highlight matching parens
(show-paren-mode t)

;; OSX Specifics
(setq ns-pop-up-frames nil)
(setq mac-emulate-three-button-mouse nil)
