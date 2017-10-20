;; -*- mode: elisp; coding: utf-8  -*-
;; Copyright 2017, Soós Péter Levente
;; Licensed under the MIT license.

(global-set-key (kbd "C-x o") 'win-switch-dispatch)
(global-set-key (kbd "C-c l") 'toggle-truncate-lines)
(global-set-key (kbd "C-đ") 'isearch-forward-at-point)

;; Move selection up and down
(global-set-key (kbd "C-M-<prior>") 'move-region-up)
(global-set-key (kbd "C-M-<next>") 'move-region-down)

;; SLIME
(global-set-key (kbd "C-c r") 'lisp-repl)
(global-set-key (kbd "C-c C-l") 'lisp-mode)

(with-eval-after-load 'slime-mode
  (define-key slime-mode-map (kbd "C-c M-t") 'slime-trace-dialog-toggle-trace)
  (define-key slime-mode-map (kbd "C-c t") 'slime-trace-dialog)
  (define-key slime-mode-map (kbd "<backspace>") 'paredit-backward-delete)
  (define-key slime-mode-map (kbd "C-;") 'comment-dwim))

(add-hook
 'slime-repl-mode-hook
 '(lambda ()
    (define-key slime-repl-mode-map (kbd "<backspace>") 'paredit-backward-delete)))

;; some parts of helm
(global-set-key (kbd "C-c a") 'helm-ag)
(global-set-key (kbd "C-c o") 'helm-occur)

;; Quick access to neotree
(global-set-key (kbd "M-í") 'neotree)
(global-set-key (kbd "C-í") 'neotree-toggle)

;; magit-status
(global-set-key (kbd "C-x g") 'magit-status)

;; Better parens location for paredit-mode (geared to Hungarian layout)
(add-hook
 'paredit-mode-hook
 '(lambda () 
    (define-key paredit-mode-map (kbd "C-é")   'paredit-open-round)
    (define-key paredit-mode-map (kbd "C-á")   'paredit-close-round)
    (define-key paredit-mode-map (kbd "C-M-é") 'paredit-wrap-round)
    (define-key paredit-mode-map (kbd "C-M-á") 'paredit-close-round-and-newline)
    (define-key paredit-mode-map (kbd "C-s-n") 'paredit-forward-slurp-sexp)
    (define-key paredit-mode-map (kbd "C-s-p") 'paredit-backward-slurp-sexp)))

;; HyperSpec lookup
(global-set-key (kbd "C-c h") 'common-lisp-hyperspec)

;; Hack to avoid "ł" in place of & in a GUI emacs (?)
(define-key key-translation-map (kbd "ł") (kbd "&"))

;; Insert logbook heading in org-mode
(add-hook
 'org-mode-hook
 '(lambda () (define-key org-mode-map (kbd "C-.") 'org-top-timestamped-header)))
