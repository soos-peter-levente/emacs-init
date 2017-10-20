;; -*- mode: emacs-lisp-mode; coding: utf-8; lexical-binding: t;  -*-
;; Copyright 2017, Soós Péter Levente, Licensed under the MIT License

;; Permission is hereby granted, free of charge, to any person obtaining a copy
;; of this software and associated documentation files (the "Software"), to deal
;; in the Software without restriction, including without limitation the rights
;; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;; copies of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:

;; The above copyright notice and this permission notice shall be included in
;; all copies or substantial portions of the Software.

;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
;; SOFTWARE.

;; Movement and tab cycling.
(add-hook 'w3m-mode-hook
  '(lambda ()
     (define-key w3m-mode-map (kbd "j") 'backward-char)
     (define-key w3m-mode-map (kbd "l") 'forward-char)
     (define-key w3m-mode-map (kbd "k") 'next-line)
     (define-key w3m-mode-map (kbd "i") 'previous-line)
     (define-key w3m-mode-map (kbd "<C-tab>") 'w3m-next-buffer)))

;; Annoyingly, emacs opens a new w3m window for each url, even if a
;; w3m buffer is already visible and usable. The fix is courtesy of
;; https://diogo149.github.io/2014/09/20/elisp-and-w3m-browse-url-dwim/
;; with some customizations by me.
(defun w3m-browse-url-dwim (url &optional new-session)
  "Open url in existing visible w3m buffer, or split to one."
  (interactive (browse-url-interactive-arg "open URL: "))
  (if (derived-mode-p 'w3m-mode)
    (w3m-goto-url-new-session url)
    (let ((buffer (find-visible-w3m-buffer)))
      (if buffer
        (browse-url-in-visible-w3m-window buffer url new-session)
        (browse-url-in-new-w3m-window url new-session)))))

(defun browse-url-in-visible-w3m-window (buffer url new-seession)
  (with-selected-window (get-buffer-window buffer)
    (w3m-goto-url url))
  (switch-to-buffer-other-window buffer))

(defun browse-url-in-new-w3m-window (url new-session)
  (when (= 1 (length (window-list)))
    (split-window-sensibly))
  (other-window 1)
  (w3m-goto-url url new-session))

(defun find-visible-w3m-buffer ()
  (cl-find-if (lambda (buffer)
                (and (with-current-buffer buffer
                       (derived-mode-p 'w3m-mode))
                     (get-buffer-window buffer)))
              (buffer-list)))
