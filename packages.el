;; -*- mode:elisp; coding: utf-8  -*-
;; Copyright 2017, Soós Péter Levente
;; Licensed under the MIT license.

;;;; Add repositories
(add-to-list 'package-archives '("melpa"     . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("gnu"       . "https://elpa.gnu.org/packages/") t)

;;;; Initialize package system
(package-initialize)

(require 'package)

;;;; Make any packages available from the default directory
(add-to-list 'load-path "~/.emacs.d/elpa/")
(add-to-list 'load-path "~/.emacs.d/melpa/")

;;;; Some default packages I rely on daily
(setq local-package-list
      '(common-lisp-snippets
        company
        helm-ag
        highlight-parentheses
        highlight-quoted
        idle-highlight-mode
        latex-preview-pane
        magit
        neotree
        slime
        slime-company
        visual-fill-column
        w3m
        web-mode
        win-switch
        yasnippet))

;;;; Install any missing packages
(mapcar #'package-install
 (remove-if #'package-installed-p local-package-list))
