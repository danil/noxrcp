;;; init-color-identifiers-mode.el --- This file is part of Danil <danil@kutkevich.org> home.

;; Copyright (C) 2016 Danil <danil@kutkevich.org>.
;; Author: Danil <danil@kutkevich.org>
;; Maintainer: Danil <danil@kutkevich.org>
;; URL: https://github.com/danil/init.el

;;; Commentary:

;; Please see README.md for documentation.

;;; License:

;; This file is not part of GNU Emacs.
;; However, it is distributed under the same license.

;; GNU Emacs is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:

;; Golang.

(defcustom myinit-color-identifiers-mode-hooks '()
  "Hooks associated with `color-identifiers-mode'."
  :group 'myinit)

(custom-set-variables '(myinit-color-identifiers-mode-hooks
                        '(
                          c-mode-hook
                          clojure-mode-hook
                          emacs-lisp-mode-hook
                          go-mode-hook
                          js-mode-hook
                          js2-mode-hook
                          python-mode-hook
                          ruby-mode-hook
                          )))

(add-hook 'after-init-hook 'myinit-color-identifiers-mode)

(defun myinit-color-identifiers-mode ()
  "My init."

  (dolist (hook myinit-color-identifiers-mode-hooks) (add-hook hook #'color-identifiers-mode))

  (myinit-after-load 'color-identifiers-mode
    (setq color-identifiers:num-colors 50)

    ;; Golang.
    (add-to-list
     'color-identifiers:modes-alist
     `(go-mode . ("[[:space:]]*" "\\_<\\([a-zA-Z_$]\\(?:\\s_\\|\\sw\\)*\\)" (nil))))))

;;; init-color-identifiers-mode.el ends here
