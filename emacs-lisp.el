;; -*- mode:elisp; coding: utf-8  -*-
;; Copyright 2017, Soós Péter Levente
;; Licensed under the MIT license.

;;;; Use Common Lisp extensions
(require 'cl)

;;;; some useful minor modes
(defvar elisp-modes
  (list 'yas-minor-mode
;       'highlight-parentheses-mode
        'highlight-quoted-mode
        'show-paren-mode
        'paredit-mode
        'company-mode
        'auto-insert-mode
        'linum-mode
        'toggle-truncate-lines))

;;;; add a few hooks
(add-mode-hooks 'emacs-lisp-mode-hook elisp-modes)
(add-mode-hooks 'ielm-mode-hook       elisp-modes)
(add-mode-hooks 'eshell-mode-hook     elisp-modes)

;; Long lines should not wrap
(add-hook 'emacs-lisp-mode-hook '(lambda () (visual-line-mode nil)))

;; macroexpansion keybinding
(define-key emacs-lisp-mode-map (kbd "C-c M-e") 'macrostep-expand)
