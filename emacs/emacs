;; Alvaro Bautista
;; http://alvarobp.com

;; Load paths
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/vendor")

(load "defunkt/lisp")
(load "alvarobp/defuns")
(load "alvarobp/global")
(load "alvarobp/modes")
(load "alvarobp/bindings")
(load "alvarobp/rails")
(load "alvarobp/theme")
(load "alvarobp/utils")

(custom-set-variables
 '(safe-local-variable-values (quote ((encoding . utf-8) (ruby-compilation-executable . "ruby") (ruby-compilation-executable . "ruby1.8") (ruby-compilation-executable . "ruby1.9") (ruby-compilation-executable . "rbx") (ruby-compilation-executable . "jruby")))))

;; ensure we do this *after* default.el is loaded!
(add-hook 'after-init-hook
'(lambda ()
(setq require-final-newline nil)))
(add-hook 'after-init-hook
'(lambda ()
(setq mode-require-final-newline nil)))