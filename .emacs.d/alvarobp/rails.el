;; ;; nxhml (HTML ERB template support)
;; (load "~/.emacs.d/vendor/nxhtml/autostart.el")

;; (setq
;;   nxhtml-global-minor-mode t
;;   mumamo-chunk-coloring 'submode-colored
;;   nxhtml-skip-welcome t
;;   indent-region-mode t
;;   rng-nxml-auto-validate-flag nil
;;   nxml-degraded nil)
;; (add-to-list 'auto-mode-alist '("\\.html\\.erb$'" . eruby-nxhtml-mumamo))

;; Rinari
(setq rinari-tags-file-name "TAGS")

;; rhtml-mode
(add-to-list 'load-path "~/.emacs.d/vendor/rhtml")
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook
          (lambda () (rinari-launch)))

(add-hook 'rhtml-mode
          (let ((original-command (lookup-key rhtml-mode-map [tab])))
            `(lambda ()
               (setq yas/fallback-behavior
                     '(apply ,original-command))
               (local-set-key [tab] 'yas/expand))))
