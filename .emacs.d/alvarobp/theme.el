(require 'color-theme)
(setq color-theme-is-global t)

(load "themes/color-theme-twilight.el")
(if window-system
  (color-theme-twilight))
