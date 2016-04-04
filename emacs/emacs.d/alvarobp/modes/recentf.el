;; recentf
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-saved-items 1000)
(setq recentf-max-menu-items 60)
(global-set-key [(meta f12)] 'recentf-open-files)

; Bind M-F11 to a function that uses ido on the recently opened files
(defun xsteve-ido-choose-from-recentf ()
  "Use ido to select a recently opened file from the `recentf-list'"
  (interactive)
  ;; (find-file (ido-completing-read "Open file: " recentf-list nil t)))
  (let ((home (expand-file-name (getenv "HOME")))
  ;; Disable ido flex-matching for this. There are too many hits!!
  (ido-enable-flex-matching nil))
  ;; )
  (find-file
    (ido-completing-read "Open from Recentf: "
      (mapcar (lambda (path)
        (replace-regexp-in-string home "~" path))
          recentf-list)
      nil t))))

(global-set-key [(meta f11)] 'xsteve-ido-choose-from-recentf)
;; (global-set-key [(control f11)] 'file-cache-ido-find-file)
(global-set-key [(control f11)] 'xsteve-ido-choose-from-recentf)