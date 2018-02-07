;; -*- mode: elisp; coding: utf-8  -*-
;; Copyright 2017, Soós Péter Levente
;; Licensed under the MIT license.

(defun symb-postfix (symbol postfix)
  (intern (concatenate 'string (symbol-name symbol) postfix)))

(cl-defmacro with-mode-load-hook (mode &body body)
  (declare (indent 1))
  `(add-hook ',(symb-postfix mode "-hook")
             '(lambda () ,@body)))

(cl-defmacro define-mode-keys (mode &rest key-func-pairs)
  (declare (indent 1))
  `(with-mode-load-hook ,mode
     ,@(loop for (key . func) in key-func-pairs
             collect `(define-key ,(symb-postfix mode "-map")
                        (kbd ,key) ,@func))))

(define-mode-keys slime-mode
  ("C-c M-t"     'slime-trace-dialog-toggle-trace)
  ("C-c t"       'slime-trace-dialog)
  ("<backspace>" 'paredit-backward-delete)
  ("C-;"         'comment-dwim))

;; use ibuffer for buffer list
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; win-switch
(global-set-key (kbd "C-x o") 'win-switch-dispatch)
(global-set-key (kbd "C-x C-o") 'win-switch-previous-window)
(global-set-key (kbd "C-c l") 'toggle-truncate-lines)
(global-set-key (kbd "C-đ") 'isearch-forward-at-point)

;; Move selection up and down
(global-set-key (kbd "C-M-<prior>") 'move-region-up)
(global-set-key (kbd "C-M-<next>") 'move-region-down)

;; Company mode
(eval-after-load 'company
  '(define-key company-active-map (kbd "<tab>") 'company-complete-common-or-cycle))

;; SLIME
(global-set-key (kbd "C-c C-l") 'lisp-mode)

(with-mode-load-hook slime-mode
  (define-key slime-mode-map (kbd "C-c M-t") 'slime-trace-dialog-toggle-trace)
  (define-key slime-mode-map (kbd "C-c t") 'slime-trace-dialog)
  (define-key slime-mode-map (kbd "<backspace>") 'paredit-backward-delete)
  (define-key slime-mode-map (kbd "C-;") 'comment-dwim))

(with-mode-load-hook slime-repl-mode
  (define-key slime-repl-mode-map (kbd "<backspace>") 'paredit-backward-delete)
  (define-key slime-repl-mode-map (kbd "M-s") 'slime-repl-paredit-static-splice)
  (define-key slime-repl-mode-map (kbd "M-s-s") 'slime-repl-next-matching-input))

;; Better parens location for paredit-mode (geared toward Hungarian layout)
(with-mode-load-hook paredit-mode
  (define-key paredit-mode-map (kbd "C-é")   'paredit-open-round)
  (define-key paredit-mode-map (kbd "C-á")   'paredit-close-round)
  (define-key paredit-mode-map (kbd "C-M-é") 'paredit-wrap-round)
  (define-key paredit-mode-map (kbd "C-M-á") 'paredit-close-round-and-newline)
  (define-key paredit-mode-map (kbd "C-s-n") 'paredit-forward-slurp-sexp)
  (define-key paredit-mode-map (kbd "C-s-p") 'paredit-backward-slurp-sexp))

;; some parts of helm
(global-set-key (kbd "C-c a") 'helm-ag)
(global-set-key (kbd "C-c o") 'helm-occur)

;; Quick access to neotree
(global-set-key (kbd "M-í") 'neotree)
(global-set-key (kbd "C-í") 'neotree-toggle)

;; magit-status
(global-set-key (kbd "C-x g") 'magit-status)

;; Hack to avoid "ł" in place of & in a GUI emacs (?)
(define-key key-translation-map (kbd "ł") (kbd "&"))

;; Insert logbook heading in org-mode
(with-mode-load-hook org-mode
  (define-key org-mode-map (kbd "C-.") 'org-top-timestamped-header))
