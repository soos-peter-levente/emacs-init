;;; custom-auto-insert.el --- define custom headers for new files  -*- lexical-binding: t; -*-

;; Copyright (C) 2017  spl

;; Author: spl <spl@arcadia>
;; Keywords: lisp, convenience

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; for now, it only contains a header for Common Lisp, a simplified
;; skeleton based on the one for emacs lisp. Check auto-insert-alist
;; for the details.

;;; Code:

(define-auto-insert
  '("\\.lisp\\'", "Common Lisp Auto Insert Header")
  '("Short description: " ";;; "
    (file-name-nondirectory (buffer-file-name))
    " --- " str
    (make-string (max 2 (- 75 (current-column) 27))
                 32) ;; whitespace
    "-*- mode: lisp-mode; -*-"
    '(setq lexical-binding t)
    "\n\n;; Copyright (C) "
    (format-time-string "%Y")
    " - " (user-full-name)
    "\n\n"
    '(if (search-backward "&" (line-beginning-position) t)
       (replace-match (capitalize (user-login-name))
		      t t))
    '(end-of-line 1)
    ";; E-mail: <" user-mail-address ">"
    "\n\n;; This program is free software; you can redistribute it and/or modify\n;; it under the terms of the GNU General Public License as published by\n;; the Free Software Foundation, either version 3 of the License, or\n;; (at your option) any later version.\n\n;; This program is distributed in the hope that it will be useful,\n;; but WITHOUT ANY WARRANTY; without even the implied warranty of\n;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n;; GNU General Public License for more details.\n\n;; You should have received a copy of the GNU General Public License\n;; along with this program.  If not, see <http://www.gnu.org/licenses/>.\n\n"
    ";; Package:\n\n"
    '(goto-line 22)
    ";; "
    (read-from-minibuffer "Comment: ")
    "\n\n"
    ";; Code:\n\n\n"
    "\n;; "
    (file-name-nondirectory (buffer-file-name))
    " ends here\n"
    '(goto-line 26)))

;;; custom-auto-insert.el ends here
