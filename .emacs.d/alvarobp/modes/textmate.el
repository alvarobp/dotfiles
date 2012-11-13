;; textmate.el
(vendor 'textmate)
(textmate-mode)
(setq textmate-find-files-command
  (concat "/usr/local/bin/git ls-tree --full-tree --name-only -r HEAD -- " (textmate-project-root)))