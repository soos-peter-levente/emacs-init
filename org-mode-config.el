;; -*- mode:elisp; coding: utf-8  -*-
;; Copyright 2017, Soós Péter Levente
;; Licensed under the MIT license.

;;;; Hooks
(add-hook 'org-mode-hook 'company-mode)
(add-hook 'org-mode-hook '(lambda () (set-fill-column 80)))
(add-hook 'org-mode-hook 'visual-fill-column-mode)

;;;; Enable literate programming support for lisp and shell.
(org-babel-do-load-languages
 'org-babel-load-languages
 `((lisp . t)
   (,(if (>= emacs-major-version 26) 'shell 'sh) . t)))

;;;; Use XeTeX to ensure full Unicode support.
(setq org-mode-xelatex-command
      "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f")
;;;; Pass thrice
(setq org-latex-pdf-process (make-list 3 org-mode-xelatex-command))
