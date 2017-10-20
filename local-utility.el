;; -*- mode:elisp; coding: utf-8  -*-
;; Copyright 2017, Soós Péter Levente
;; Licensed under the MIT license.

;; This should be extended to handle lisp function definition blocks automatically.
(defun move-region (start end n)
  "Move the current region up or down by N lines."
  (interactive "r\np")
  (let ((line-text (delete-and-extract-region start end)))
    (forward-line n)
    (let ((start (point)))
      (ins
       ert line-text)
      (setq deactivate-mark nil)
      (set-mark start))))

(defun move-region-up (start end n)
  "Move the current line up by N lines."
  (interactive "r\np")
  (move-region start end (if (null n) -1 (- n))))

(defun move-region-down (start end n)
  "Move the current line down by N lines."
  (interactive "r\np")
  (move-region start end (if (null n) 1 n)))

(defun add-mode-hooks (mode hooks)
  (mapcar #'(lambda (hook) (add-hook mode hook)) hooks))

(defun set-lisp-mode-hooks (hook-list lisp-modes-list)
  (mapcar #'(lambda (mode) (add-mode-hooks mode hook-list))
          lisp-modes-list))

(defun unwrap-line ()
  "Remove all newlines until we get to two consecutive ones.
   Or until we reach the end of the buffer."
  (interactive)
  (let ((start (point))
        (end (copy-marker (or (search-forward "\n\n" nil t)
                              (point-max))))
        (fill-column (point-max)))
    (fill-region start end)
    (goto-char end)
    (next-line)
    (beginning-of-line)))

(defun paredit-space-for-delimiter-p (endp delimiter)
  "https://stackoverflow.com/questions/913449/changing-paredit-formatting/913823#913823" 
  (and (memq major-mode '(js-mode))
       (not (if endp (eobp) (bobp)))
       (memq (char-syntax (if endp (char-after) (char-before)))
             (list ?\" ;; REMOVED ?w ?_
                   (let ((matching (matching-paren delimiter)))
                     (and matching (char-syntax matching)))))))

(defun current-date-as-string ()
  (format "%s" (shell-command-to-string "date '+%Y-%m-%d, %H:%M'")))

(defun org-top-timestamped-header ()
  (interactive)
  (insert (format "* %s" (current-date-as-string))))

(defun fit-fill-column ()
  "WIP: perhaps improve it to work with visual-fill-column-mode."
  (interactive)
  (let* ((adj (adjust (window-width (selected-window)) fill-column)))
    (when (and adj (/= 0 adj))
      (window-resize (selected-window) adj t))))

(defun adjust (width target)
  (cond ((= width target) nil)
        ((> width target)
         (- (- width target)))
        ((< width target)
         (- target width))))

;; I-search with initial contents
;; Wayback Machine: http://web.archive.org/web/20090705053554/http://platypope.org:80/blog/2007/8/5/a-compendium-of-awesomeness
(defvar isearch-initial-string nil)

(defun isearch-set-initial-string ()
  (remove-hook 'isearch-mode-hook 'isearch-set-initial-string)
  (setq isearch-string isearch-initial-string)
  (isearch-search-and-update))

(defun isearch-forward-at-point (&optional regexp-p no-recursive-edit)
  "Interactive search forward for the symbol at point."
  (interactive "P\np")
  (if regexp-p (isearch-forward regexp-p no-recursive-edit)
    (let* ((end (progn (skip-syntax-forward "w_") (point)))
           (begin (progn (skip-syntax-backward "w_") (point))))
      (if (eq begin end)
          (isearch-forward regexp-p no-recursive-edit)
        (setq isearch-initial-string (buffer-substring begin end))
        (add-hook 'isearch-mode-hook 'isearch-set-initial-string)
        (isearch-forward regexp-p no-recursive-edit)))))

(defadvice isearch-search (after isearch-no-fail activate)
  "https://stackoverflow.com/a/36707038 - automatically wrap isearch"
  (unless isearch-success
    (ad-disable-advice 'isearch-search 'after 'isearch-no-fail)
    (ad-activate 'isearch-search)
    (isearch-repeat (if isearch-forward 'forward))
    (ad-enable-advice 'isearch-search 'after 'isearch-no-fail)
    (ad-activate 'isearch-search)))
