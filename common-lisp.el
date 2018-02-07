;; -*- mode: emacs-lisp; coding: utf-8 ; truncate-lines: nil -*-
;; Copyright 2017, Soós Péter Levente
;; Licensed under the MIT license.

;;;; set up common lisp indenting rules
(load "common-lisp-indent-rules.el")

;;;; initialize slime, swank and slime-contribs
(require 'slime)
(require 'slime-autoloads)

(setq slime-port 6666)

;;;; default implementation to use
(setq inferior-lisp-program      "sbcl"
      common-lisp-hyperspec-root "file:///usr/share/doc/hyperspec/")

;;;; contribs
(slime-setup
 '(slime-asdf
   slime-fancy
   slime-fancy-inspector
   slime-cl-indent
   slime-mdot-fu
   slime-company
   slime-autodoc
   slime-fuzzy))

;;;; Common Lisp Major Mode Hooks
(defvar repl-modes
  (list 'auto-insert-mode
        'company-mode
        'paredit-mode
        'show-paren-mode
        'toggle-truncate-lines
        'yas-minor-mode))

(defvar cl-modes
  (append repl-modes
          (list 'highlight-quoted-mode
                'highlight-symbol-mode
                'highlight-symbol-nav-mode
                )))

;; hook them up
(add-mode-hooks 'lisp-mode-hook cl-modes)
(add-mode-hooks 'slime-repl-mode-hook repl-modes)

;; Lisp lines are no use with word wrap
(add-hook 'lisp-mode-hook '(lambda () (visual-line-mode nil)))

;;;; Some helper functions
(defun slime-repl-paredit-static-splice ()
  "Wrap `paredit-splice-sexp' in a `save-excursion' call.A small
helper to prevent the cursor from jumping to the end of the line
in the REPL."
  (interactive)
  (save-excursion
    (paredit-splice-sexp)))
