;; -*- mode:elisp; coding: utf-8  -*-
;; Copyright 2017, Soós Péter Levente
;; Licensed under the MIT license.

;; Start helm mode globally
;;(helm-mode)

;; Enable pdf viewing
(if (fboundp #'pdf-tools-install)
  (pdf-tools-install))

;; Open files in specific mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
