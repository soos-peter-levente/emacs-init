;; -*- mode:elisp; coding: utf-8  -*-
;; Copyright 2017, Soós Péter Levente
;; Licensed under the MIT license.

;;;; MAIN CONFIG
;;;; symlink this to ~/.emacs

;; config directory
(defvar *user-config-repository* (getenv "EMACS_USER_CONFIG_DIRECTORY"))

(add-to-list 'load-path *user-config-repository*)

(package-initialize)

;; emacs lisp
(load "local-utility.el")
(load "emacs-lisp.el")

;; melpa & elpa repositories, packages
(load "packages.el")

;; default fontface
(load "fonts.el")

;; aliases
(load "aliases.el")

;; global modes
(load "modes.el")

;; keybindings
(load "keybindings.el")

;; yasnippet
(load "yas-snippet-mode-config.el")

;; common lisp
(load "common-lisp.el")

;; org-mode
(load "org-mode-config.el")

;; doc-view
(load "doc-view-mode-config.el")

;; w3m-mode
(load "w3m-mode-config.el")

;; auto-insert
(load "custom-auto-insert.el")

;; global modes
(load "global-modes-config.el")

;; custom-set-variables
(setq custom-file (concatenate 'string *user-config-repository* "/custom-set-variables.el"))
(load custom-file)

;; theme
(load "theme.el")

;; my info
(load "user-info.el")

;; + enable some disabled commands
(put 'narrow-to-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
