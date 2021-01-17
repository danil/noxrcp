;;; init-find-temp-file.el --- This file is part of Danil <danil@kutkevich.org> home.

;; Copyright (C) 2020 Danil <danil@kutkevich.org>.
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

(custom-set-variables
 ;; Default template for temporary files.
 ;; %N: prefix taken from `find-temp-file-prefix'
 ;; %S: shortened sha-1 of the extension
 ;; %T: shortened sha-1 of the extension + machine
 ;; %E: extension
 ;; %M: replace by mode name associated with the extension
 ;; %D: date with format %Y-%m-%d
 '(find-temp-template-default "danil/%D%N.%E")

 '(find-temp-custom-spec
   '((?D . (lambda () (format-time-string "%Y%m%d")))))

 ;; Alist with file extensions and corresponding file name template.
 '(find-temp-template-alist '(("go" . "danil/go%D%N/%N.%E"))))

(add-hook 'after-init-hook 'noxrcp-find-temp-file)
(defun noxrcp-find-temp-file ()
  "No X recipe init."
  (define-key noxrcp-exec-map (kbd "t t") 'find-temp-file))

;;; init-find-temp-file.el ends here
