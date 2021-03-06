(deftheme terminal-misterioso
  "Created 2017-06-03.")

(custom-theme-set-faces
 'terminal-misterioso
 '(cursor ((t (:background "red"))))
 '(fixed-pitch ((t (:family "Monospace"))))
 '(variable-pitch ((((type w32)) (:font "-outline-Arial-normal-normal-normal-sans-*-*-*-*-p-*-iso8859-1")) (t (:family "Sans Serif"))))
 '(escape-glyph ((((background dark)) (:foreground "cyan")) (((type pc)) (:foreground "magenta")) (t (:foreground "brown"))))
 '(minibuffer-prompt ((t (:foreground "cyan" :weight extra-bold))))
 '(highlight ((t (:foreground "#e1e1e0" :background "#338f86"))))
 '(region ((t (:foreground "#e1e1e0" :background "#2d4948"))))
 '(shadow ((((class color grayscale) (min-colors 88) (background light)) (:foreground "grey50")) (((class color grayscale) (min-colors 88) (background dark)) (:foreground "grey70")) (((class color) (min-colors 8) (background light)) (:foreground "green")) (((class color) (min-colors 8) (background dark)) (:foreground "yellow"))))
 '(secondary-selection ((((class color) (min-colors 88) (background light)) (:background "yellow1")) (((class color) (min-colors 88) (background dark)) (:background "SkyBlue4")) (((class color) (min-colors 16) (background light)) (:background "yellow")) (((class color) (min-colors 16) (background dark)) (:background "SkyBlue4")) (((class color) (min-colors 8)) (:foreground "black" :background "cyan")) (t (:inverse-video t))))
 '(trailing-whitespace ((t (:background "#ff4242"))))
 '(font-lock-builtin-face ((t (:foreground "#23d7d7"))))
 '(font-lock-comment-delimiter-face ((default (:inherit (font-lock-comment-face)))))
 '(font-lock-comment-face ((t (:foreground "#74af68"))))
 '(font-lock-constant-face ((t (:foreground "#008b8b"))))
 '(font-lock-doc-face ((t (:inherit (font-lock-string-face)))))
 '(font-lock-function-name-facye ((t (:foreground "#00ede1" :weight extra-bold))))
 '(font-lock-keyword-face ((t (:foreground "#ffad29" :weight extra-bold))))
 '(font-lock-negation-char-face ((t nil)))
 '(font-lock-preprocessor-face ((t (:inherit (font-lock-builtin-face)))))
 '(font-lock-regexp-grouping-backslash ((t (:inherit (bold)))))
 '(font-lock-regexp-grouping-construct ((t (:inherit (bold)))))
 '(font-lock-string-face ((t (:foreground "#e67128"))))
 '(font-lock-type-face ((t (:foreground "#34cae2"))))
 '(font-lock-variable-name-face ((t (:foreground "#dbdb95"))))
 '(font-lock-warning-face ((t (:weight bold :foreground "#ff4242"))))
 '(button ((t (:underline (:color foreground-color :style line)))))
 '(link ((t (:underline (:color foreground-color :style line) :foreground "#59e9ff"))))
 '(link-visited ((t (:underline (:color foreground-color :style line) :foreground "#ed74cd"))))
 '(fringe ((t (:background "#3a3a3a"))))
 '(header-line ((t (:foreground "#333333" :background "#e5e5e5"))))
 '(tooltip ((((class color)) (:inherit (variable-pitch) :foreground "black" :background "lightyellow")) (t (:inherit (variable-pitch)))))
 '(mode-line ((t (:background "#111111" :foreground "#eeeeec"))))
 '(mode-line-inactive ((t (:background "#696969" :foreground "bebebe"))))
 '(vertical-border ((t (:background "gray" :foreground "#3a3a3a"))))
 '(mode-line-buffer-id ((t (:weight bold))))
 '(mode-line-emphasis ((t (:weight bold))))
 '(mode-line-highlight ((((class color) (min-colors 88)) (:box (:line-width 2 :color "grey40" :style released-button))) (t (:inherit (highlight)))))
 '(isearch ((t (:foreground "#000000" :background "#fcffad"))))
 '(isearch-fail ((((class color) (min-colors 88) (background light)) (:background "RosyBrown1")) (((class color) (min-colors 88) (background dark)) (:background "red4")) (((class color) (min-colors 16)) (:background "red")) (((class color) (min-colors 8)) (:background "red")) (((class color grayscale)) (:foreground "grey")) (t (:inverse-video t))))
 '(lazy-highlight ((t (:background "#338f86"))))
 '(match ((((class color) (min-colors 88) (background light)) (:background "yellow1")) (((class color) (min-colors 88) (background dark)) (:background "RoyalBlue3")) (((class color) (min-colors 8) (background light)) (:foreground "black" :background "yellow")) (((class color) (min-colors 8) (background dark)) (:foreground "white" :background "blue")) (((type tty) (class mono)) (:inverse-video t)) (t (:background "gray"))))
 '(next-error ((t (:inherit (region)))))
 '(query-replace ((t (:inherit (isearch)))))
 '(default ((t (:inherit nil :stipple nil :background "#3a3a3a" :foreground "#e1e1e0" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 90 :width normal :foundry "xos4" :family "Terminus")))))

(provide-theme 'terminal-misterioso)

