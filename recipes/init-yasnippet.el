;;; init-yasnippet.el --- This file is part of Danil <danil@kutkevich.org> home.

;; Copyright (C) 2016 Danil <danil@kutkevich.org>.
;; Author: Danil <danil@kutkevich.org>
;; Version: 0.0.1
;; Package-Requires: ((myinit))
;; Keywords: convenience
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

;;; <http://pragmaticemacs.com/emacs/smart-text-templates-with-yasnippet/>

(autoload 'yas-reload-all "yasnippet" nil t)

(add-hook 'after-init-hook 'myinit-yasnippet)

(defun myinit-yasnippet ()
  "My init."

  (yas-reload-all)

  (myinit-after-load 'yasnippet
    ;; How to fix Yasnippet and Autocomplete tab key collision
    ;; <http://sethlakowske.com/why-i-use-emacs/fix-yasnippet-and-autocomplete-tab-key-collision/>.
    (define-key yas-minor-mode-map (kbd "<tab>") nil)
    (define-key yas-minor-mode-map (kbd "TAB") nil)
    ;; Set Yasnippet's key binding to shift+tab
    (define-key yas-minor-mode-map (kbd "<backtab>") 'yas-expand))

  ;; (if (fboundp 'hydra-repeat) (myinit-yasnippet--hydra)
  ;;   (with-eval-after-load 'hydra (myinit-yasnippet--hydra)))

  (dolist (hook myinit-programming-modes-hooks)
    (add-hook hook 'myinit-yasnippet--lazyinit)))

(defun myinit-yasnippet--lazyinit ()
  "Run `yasnippet'."

  (myinit-run-with-idle-timer-in-current-buffer
   myinit-default-idle-timer-seconds nil 'yas-minor-mode))

;; (defun myinit-yasnippet--hydra ()
;;   (defhydra hydra-yasnippet (:color blue :hint nil)
;;     "
;;               ^YASnippets^
;; --------------------------------------------
;;   Modes:    Load/Visit:    Actions:

;;  _g_lobal  _d_irectory    _i_nsert
;;  _m_inor   _f_ile         _t_ryout
;;  _e_xtra   _l_ist         _n_ew
;;          _a_ll
;; "
;;     ("d" yas-load-directory)
;;     ("e" yas-activate-extra-mode)
;;     ("i" yas-insert-snippet)
;;     ("f" yas-visit-snippet-file :color blue)
;;     ("n" yas-new-snippet)
;;     ("t" yas-tryout-snippet)
;;     ("l" yas-describe-tables)
;;     ("g" yas/global-mode)
;;     ("m" yas/minor-mode)
;;     ("a" yas-reload-all)))

;;; init-yasnippet.el ends here
