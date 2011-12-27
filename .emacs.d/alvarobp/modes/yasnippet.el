;; yasnippet
(vendor 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/vendor/yasnippet/snippets")
(setq require-final-newline nil)
;; yasnippet-ruby-mode
(yas/load-directory "~/.emacs.d/vendor/yasnippet-ruby-mode")
;; prioritize snippet expansion above indentation on TAB key
(defun yas/advise-indent-function (function-symbol)
  (eval `(defadvice ,function-symbol (around yas/try-expand-first activate)
           ,(format
             "Try to expand a snippet before point, then call `%s' as usual"
             function-symbol)
           (let ((yas/fallback-behavior nil))
             (unless (and (interactive-p)
                          (yas/expand))
               ad-do-it)))))
(yas/advise-indent-function 'ruby-indent-line)