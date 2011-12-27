;; Spanish keyboard mappings
(global-set-key [(meta +)] "]")
(global-set-key [(meta ?\ç)] "}")
(global-set-key [(meta \1)] "|")
(global-set-key [(meta \2)] "@")
(global-set-key [(meta \3)] "#")
(global-set-key [(meta \4)] "~")
(global-set-key [(meta ?\º)] "\\")
(global-set-key [(meta ?\ñ)] "~")

;; Indent region on OSX
(global-set-key (kbd "C-M-º") 'indent-region)

;; Goto line
(global-set-key (kbd "C-c g") 'goto-line)

;; Map kp-delete (Apple Keyboard) to delete-char
(global-set-key '[(kp-delete)] 'delete-char)

;; Toggle fullscreen
(global-set-key (kbd "M-RET") 'ns-toggle-fullscreen)

;; Find
(global-set-key [(f2)] 'ack)
(global-set-key [(control f2)] 'ack-same)
