;; -*- mode:elisp; coding: utf-8  -*-
;; Copyright 2017, Soós Péter Levente
;; Licensed under the MIT license.

;;;; initialize
(auto-insert-mode)

;;;; header locations
(setq auto-insert-directory (concat *user-config-repository* "headers/"))
(setq auto-insert-query nil)

;;;; Lisp headers
(load "custom-auto-insert.el")


