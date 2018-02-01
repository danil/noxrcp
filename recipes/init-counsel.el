;;; init-counsel.el --- This file is part of Danil <danil@kutkevich.org> home.

;; Copyright (C) 2017 Danil <danil@kutkevich.org>.
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

(defconst myinit-counsel-ag-base-command-name "ag")

(defconst myinit-counsel-ag-base-command-args
  (if (memq system-type '(ms-dos windows-nt))
      "--vimgrep"
    "--nocolor --nogroup"))

(custom-set-variables
 '(counsel-yank-pop-truncate-radius 4)
 '(counsel-ag-base-command (format "%s %s %s"
                                   myinit-counsel-ag-base-command-name
                                   myinit-counsel-ag-base-command-args
                                   "%s")))

(add-hook 'after-init-hook 'myinit-counsel)

(defun myinit-counsel ()
  "My init."

  (if (boundp 'help-map) (myinit-counsel-customize-help)
    (with-eval-after-load 'help (myinit-counsel-customize-help)))

  (myinit-counsel-customize-keys))

(defun myinit-counsel-customize-keys ()
  "My init customize keys."

  (when (boundp 'minibuffer-local-map)
    (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history))

  (when (boundp 'myinit-map)
    (define-key myinit-map (kbd "j a") 'myinit-counsel--counsel-ag)
    (define-key myinit-map (kbd "j p") 'counsel-pt)
    (define-key myinit-map (kbd "j r") 'counsel-rg))

  ;; (global-set-key (kbd "C-c g") 'counsel-git)
  ;; (global-set-key (kbd "C-c j") 'counsel-git-grep)
  ;; (global-set-key (kbd "C-x l") 'counsel-locate)

  (global-set-key (kbd "M-y") 'myinit-counsel--counsel-yank-pop)

  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "C-x C-r") 'counsel-recentf)
  (global-set-key (kbd "M-x") 'counsel-M-x))

(defun myinit-counsel-customize-help()
  "My init customize."
  (define-key help-map (kbd "F") 'counsel-describe-face)
  (define-key help-map (kbd "f") 'counsel-describe-function)
  (define-key help-map (kbd "i") 'counsel-info-lookup-symbol)
  (define-key help-map (kbd "l") 'counsel-find-library)
  (define-key help-map (kbd "u") 'counsel-unicode-char)
  (define-key help-map (kbd "v") 'counsel-describe-variable))

(defun myinit-counsel--counsel-ag (initial-directory)
  "Search using ag in a given `INITIAL-DIRECTORY`.

If `current-prefix-arg' is a integer then
pass context to ag like that: ag --context=`current-prefix-arg'.
If there is a symbol under cursor, then pass it as initial ag imput."
  (interactive (list (read-directory-name "Directory: ")))

  (let ((initial-input (if (symbol-at-point) (symbol-name (symbol-at-point)) "")))
    (if (integerp current-prefix-arg)
        (let ((n current-prefix-arg))
          (setq current-prefix-arg nil)
          (counsel-ag initial-input initial-directory
                      (format "%s %s"
                              myinit-counsel-ag-base-command-args
                              (format "--context=%s" n))))

      (counsel-ag initial-input initial-directory))))

(defun myinit-counsel--counsel-yank-pop ()
  "Ivy replacement for `yank-pop'."
  (interactive)

  (if (member last-command '(yank yank-secondary yank-pop yank-pop-commands))
      (if (fboundp 'yank-pop-commands)
          (yank-pop-commands) ; second-sel.el
        (yank-pop))

    (require 'counsel)

    (if (eq last-command 'yank)
        (progn
          (setq ivy-completion-end (point))
          (setq ivy-completion-beg
                (save-excursion
                  (search-backward (car kill-ring))
                  (point))))
      (setq ivy-completion-beg (point))
      (setq ivy-completion-end (point)))
    (let ((candidates
           (mapcar #'ivy-cleanup-string
                   (cl-remove-if
                    (lambda (s)
                      (string-match "\\`[\n[:blank:]]*\\'" s))
                    (delete-dups kill-ring)))))
      (let ((ivy-format-function #'counsel--yank-pop-format-function)
            (ivy-height myinit-ivy-ivy-height))
        (ivy-read "kill-ring: " candidates
                  :action 'counsel-yank-pop-action
                  :caller 'counsel-yank-pop)))))

;;; init-counsel.el ends here