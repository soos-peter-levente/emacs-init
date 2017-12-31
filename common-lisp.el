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
 '(slime-fancy
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
       ;'highlight-parentheses-mode
       ;'idle-highlight-mode
        'paredit-mode
        'show-paren-mode
        'toggle-truncate-lines
        'yas-minor-mode))

(defvar cl-modes
  (append repl-modes
          (list 'highlight-quoted-mode
               ;'idle-highlight-mode
                'linum-mode
                'toggle-truncate-lines)))

;; hook them up
(add-mode-hooks 'lisp-mode-hook cl-modes)
(add-mode-hooks 'slime-repl-mode-hook repl-modes)

;; Lisp lines are no use with word wrap
(add-hook 'lisp-mode-hook '(lambda () (visual-line-mode nil)))

;;;; Some helper functions in case we want to open the REPL automatically
(defun lisp-repl ()
  (interactive)
  (if (not (slime-connected-p))
    (connect-slime "127.0.0.1" (string-to-number (getenv "SWANK_PORT")))
    (slime-repl)))

(defun connect-slime (host port)
  (let ((connection (slime-net-connect host port)))
    (slime-setup-connection connection)))
