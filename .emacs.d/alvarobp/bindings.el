;; Spanish keyboard mappings
;; (global-set-key [(meta +)] "]")
;; (global-set-key [(meta ?\ç)] "}")
;; (global-set-key [(meta \1)] "|")
;; (global-set-key [(meta \2)] "@")
;; (global-set-key [(meta \3)] "#")
;; (global-set-key [(meta \4)] "~")
;; (global-set-key [(meta ?\º)] "\\")
;; (global-set-key [(meta ?\ñ)] "~")

;; Align regexp
(global-set-key (kbd "C-x \\") 'align-regexp)

;; Apple Keyboard mappings
(when (eq system-type 'darwin) ;; mac specific settings
  (setq mac-option-key-is-meta t)
  (setq mac-right-option-key-is-meta nil)
  (setq mac-command-key-is-meta nil)
  (global-set-key [kp-delete] 'delete-char) ;; sets fn-delete to be right-delete
)

;; Goto line
(global-set-key (kbd "C-c g") 'goto-line)

;; Toggle fullscreen
(global-set-key (kbd "M-RET") 'ns-toggle-fullscreen)

;; Find
(global-set-key [(f2)] 'ack)
(global-set-key [(control f2)] 'ack-same)

;; Comment region or line
(global-set-key (kbd "C-c C-k") 'comment-or-uncomment-region-or-line)
