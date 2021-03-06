;;; init-ido-occur.el --- This file is part of Danil <https://danil.kutkevich.org> home.

;; Copyright (C) 2021 Danil <https://danil.kutkevich.org>.
;; Author: Danil <https://danil.kutkevich.org>
;; Maintainer: Danil <https://danil.kutkevich.org>
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

(add-hook 'after-init-hook 'noxrcp-ido-occur)

(defun noxrcp-ido-occur ()
  "No X recipe init."
  (define-key noxel-map (kbd "f o") 'my-ido-occur)

  (if (boundp 'isearch-mode-map) (init-ido-occur-xxxxxxxxxx)
    (with-eval-after-load 'isearch (init-ido-occur-xxxxxxxxxx))))

(defun init-ido-occur-xxxxxxxxxx ()
  (define-key isearch-mode-map (kbd "C-o") 'ido-occur-from-isearch))

(defun my-ido-occur (&optional arg)
  "Run `ido-occur-at-point' or `ido-occur' if `ARG'."
  (interactive "P")
  (if arg (ido-occur) (ido-occur-at-point)))

;;; init-ido-occur.el ends here
