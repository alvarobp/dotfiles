(load "defunkt/ruby")
(load "defunkt/shell")
(load "defunkt/javascript")

(load "alvarobp/modes/flymake")
(load "alvarobp/modes/ruby")
(load "alvarobp/modes/yasnippet")
(load "alvarobp/modes/lisp")
(load "alvarobp/modes/sh")
(load "alvarobp/modes/recentf")

;; all modes
;; (add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Show column number
(setq column-number-mode t)

;; Highlighting
(transient-mark-mode t)

;; find-recursive
(vendor 'find-recursive)

;; show line numbers
(autoload 'linum-mode "linum" "toggle line numbers on/off" t) 
(global-set-key (kbd "C-<f5>") 'linum-mode)

;; emacs
(define-key emacs-lisp-mode-map (kbd "A-r") 'eval-buffer)

;; bash
(setq auto-mode-alist (cons '("\\.bashrc" . sh-mode) auto-mode-alist))

;; zsh
(setq auto-mode-alist (cons '("\\.zsh" . sh-mode) auto-mode-alist))

;; magit
(vendor 'magit)
(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")))

;; textmate.el
(vendor 'textmate)
(textmate-mode)
(setq textmate-find-files-command "git ls-tree --full-tree --name-only -r HEAD")

;; haml
(vendor 'haml-mode)

;; yaml
(vendor 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-hook 'yaml-mode-hook
    '(lambda ()
       (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

;; markdown
(vendor 'markdown-mode)
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))

;; dired
(put 'dired-find-alternate-file 'disabled nil)

;; full-ack
(vendor 'full-ack)

;; coffee-script?
(vendor 'coffee-mode)

;; toggle
(vendor 'toggle)

;; diff
(custom-set-faces
 '(diff-added ((t (:foreground "Green"))) 'now)
 '(diff-removed ((t (:foreground "Red"))) 'now)
)

;; scala
(add-to-list 'load-path "~/.emacs.d/vendor/scala-mode")
(load "scala-mode-auto")
