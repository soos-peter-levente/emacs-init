
;; -*- mode: emacs-lisp; coding: utf-8  -*-
;; Copyright 2017, Soós Péter Levente
;; Licensed under the MIT license.

;;;; possible values are defun, 1 or 2
(put 'lambda 'lisp-indent-function 'defun)
(put 'while 'lisp-indent-function 'defun)
(put 'if 'lisp-indent-function  1)
(put 'defstruct 'lisp-indent-function 'defun)

(defvar boolean-expression-face
  'boolean-expression-face
  "Face name to use for format specifiers.")

(defface boolean-expression-face
  '((t (:foreground "spring green")))
  "Font Lock mode face used to highlight format specifiers."
  :group 'font-lock-faces)
