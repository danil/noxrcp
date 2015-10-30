;;; init-my-backspace-fix.el --- This file is part of Danil <danil@kutkevich.org> home.

;; Copyright (C) 2015 Danil <danil@kutkevich.org>.
;; Author: Danil <danil@kutkevich.org>
;; Version: 0.0.0
;; Package-Requires: ()
;; Keywords: convenience
;; URL: http://danil.kutkevich.org/p/el/init.el

;;; Commentary:

;; Please see README.md for documentation, or read it online at
;; http://danil.kutkevich.org/p/el/init.el

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

;;; BackspaceKey <http://emacswiki.org/BackspaceKey>.

;; (global-set-key [(control h)] 'delete-backward-char)
(my-after-init
  (my-backspace-fix)

  (my-eval-after-load 'term-mode (my-backspace-fix)))

(defun my-backspace-fix ()
  (keyboard-translate ?\C-h ?\C-?)
  (define-key key-translation-map [?\C-h] [?\C-?]))

(defun my-backspace-fix-i ()
  (interactive) (my-backspace-fix))
;;; init-my-backspace-fix.el ends here
