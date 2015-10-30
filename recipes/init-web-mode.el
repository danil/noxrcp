;;; init-web-mode.el --- This file is part of Danil <danil@kutkevich.org> home.

;; Copyright (C) 2014-2015 Danil <danil@kutkevich.org>.
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

(my-after-init
  (my-add-auto-mode-to-patterns 'web-mode
                                "\\.\\(html\\|text\\)\\.erb\\'"
                                "\\.as[cp]x\\'"
                                "\\.djhtml\\'"
                                "\\.ejs\\'"
                                "\\.html\\'"
                                "\\.js.erb\\'"
                                "\\.jsp\\'"
                                "\\.jst\\.ejs\\'"
                                "\\.phtml\\'"
                                "\\.rhtml\\'"
                                "\\.tpl\\.php\\'")

  (my-eval-after-load 'web-mode
    (define-key web-mode-map (kbd "C-c C-f") nil)))

;;; init-web-mode.el ends here
