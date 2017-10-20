;; -*- mode:elisp; coding: utf-8  -*-
;; Copyright 2017, Soós Péter Levente
;; Licensed under the MIT license.

;;;; misterioso with env TERM=xterm-256color set and emacs running in
;;;; an xterm (grey background, extremely good contrast). Cursor is
;;;; nice and visible red orange. Adjust mode line for extra good
;;;; visibility.

;;;; If you succeed at running emacs with the settings above, you can
;;;; save the misterioso terminal colors as a separate theme using
;;;; M-x `customize-create-theme`

;;;; Use directory in config repository
(setq custom-theme-directory *user-config-repository*)

;;;; Load
(load-theme 'terminal-misterioso)
