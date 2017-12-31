;; -*- mode:elisp; coding: utf-8  -*-
;; Copyright 2017, Soós Péter Levente
;; Licensed under the MIT license.

;;;; Various custom variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(auto-revert-verbose nil)
 '(backup-by-copying t)
 '(backup-directory-alist (\` (("." . "~/.saves"))))
 '(blink-cursor-mode nil)
 '(browse-url-browser-function (quote w3m-browse-url-dwim))
 '(browse-url-text-browser "w3m")
 '(column-number-mode t)
 '(company-idle-delay 0)
 '(company-minimum-prefix-length 1)
 '(company-selection-wrap-around t)
 '(company-tooltip-limit 20)
 '(custom-safe-themes
   (quote
    ("d38d15985c7e1e6928289e1b6fbfa09458ba990d6294553fbc18b925b6a1f41b" "9edc9a00a7f947a81d11c367cc5296614917eb290ceca62ac19735939a477d97" default)))
 '(delete-old-versions t)
 '(delete-selection-mode t)
 '(desktop-save t)
 '(desktop-save-mode t)
 '(global-hl-line-mode t)
 '(global-visual-line-mode t)
 '(glyphless-char-display-control
   (quote
    ((format-control . thin-space)
     (no-font . thin-space))))
 '(helm-split-window-default-side (quote right))
 '(hl-paren-background-colors (quote ignore))
 '(hl-paren-colors (quote ("white smoke")))
 '(idle-highlight-exceptions (quote ("end")))
 '(idle-highlight-idle-time 0.1)
 '(ido-mode t nil (ido))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-scratch-message "")
 '(kept-new-versions 6)
 '(kept-old-versions 2)
 '(linum-format (quote dynamic))
 '(menu-bar-mode nil)
 '(neo-cwd-line-style (quote text))
 '(neo-force-change-root t)
 '(neo-smart-open t)
 '(neo-theme (quote ascii))
 '(org-edit-src-persistent-message nil)
 '(org-file-apps
   (quote
    ((auto-mode . emacs)
     ("\\.mm\\'" . default)
     ("\\.x?html?\\'" . default)
     ("\\.pdf\\'" . emacs))))
 '(org-latex-default-packages-alist
   (quote
    (("" "color" nil)
     ("" "listings" nil)
     ("" "fixltx2e" nil)
     ("" "graphicx" t)
     ("" "longtable" nil)
     ("" "float" nil)
     ("" "wrapfig" nil)
     ("" "rotating" nil)
     ("normalem" "ulem" t)
     ("" "amsmath" t)
     ("" "textcomp" t)
     ("" "marvosym" t)
     ("" "wasysym" t)
     ("" "amssymb" t)
     ("" "hyperref" nil)
     "\\tolerance=1000")))
 '(org-latex-listings t)
 '(org-latex-pdf-process
   (quote
    ("xelatex -shell-escape -interaction nonstopmode -output-directory %o %f" "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f" "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f")) t)
 '(org-src-ask-before-returning-to-edit-buffer nil)
 '(org-src-fontify-natively t)
 '(org-src-window-setup (quote other-window))
 '(org-startup-with-latex-preview t)
 '(overwrite-selection-mode t)
 '(package-selected-packages
   (quote
    (pdf-tools js-doc web-beautify writeroom-mode idle-highlight-mode aozora-view win-switch helm-ag parinfer neotree visual-fill-column highlight-quoted latex-preview-pane header2 elfeed markdown-mode slime magit w3m slime-company quack paredit js2-mode highlight-parentheses geiser dumb-jump dart-mode common-lisp-snippets auto-yasnippet ac-slime)))
 '(pdf-latex-command "xelatex")
 '(safe-local-variable-values
   (quote
    ((Base . 10)
     (Package . CL-PPCRE)
     (Syntax . COMMON-LISP)
     (copyright . MIT)
     (author . soos-peter-levente)
     (author . spl)
     (license . MIT))))
 '(scroll-bar-mode nil)
 '(scroll-conservatively 10000)
 '(select-enable-clipboard t)
 '(show-paren-delay 0)
 '(show-paren-mode t)
 '(show-paren-priority 10)
 '(show-paren-style (quote parenthesis))
 '(show-paren-when-point-in-periphery t)
 '(show-paren-when-point-inside-paren nil)
 '(show-trailing-whitespace t)
 '(slime-kill-without-query-p t)
 '(split-height-threshold nil)
 '(split-width-threshold 120)
 '(tool-bar-mode nil)
 '(tramp-syntax (quote default))
 '(truncate-lines t)
 '(version-control t)
 '(w3m-confirm-leaving-secure-page nil)
 '(win-switch-idle-time 1.5)
 '(win-switch-window-threshold 0)
 '(yas-triggers-in-field t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-source-header ((t (:background "#22083397778B" :foreground "white" :weight bold :height 1.0))))
 '(hl-line ((t (:background "gray18"))))
 '(hl-paren-face ((t (:background "dim gray" :foreground "white smoke"))) t)
 '(idle-highlight ((t (:foreground "dark gray"))))
 '(show-paren-match ((t (:background "dim gray" :foreground "white smoke"))))
 '(show-paren-match-expression ((t (:background "dim gray" :foreground "white smoke"))))
 '(show-paren-mismatch ((t (:background "purple" :foreground "white"))))
 '(trailing-whitespace ((t (:background "gray18")))))
