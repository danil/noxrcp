;;; Linum (line numbers).
(eval-after-load 'linum
  '(progn
     ;; (setq linum-format "%4d ") ;separating line numbers from text <http://www.emacswiki.org/emacs/LineNumbers#toc7>
     (cond ((equal frame-background-mode 'light)
            (set-face-attribute 'linum nil
                                :foreground "DimGray"
                                :background "gray90")
            )
           ((equal frame-background-mode 'dark)
            (set-face-attribute 'linum nil
                                :foreground "DimGray"
                                :background "gray15")
            ))
     ))
(dolist (hook '(
                ;; compilation-mode-hook
                ;; shell-mode-hook
                awk-mode-hook
                c-mode-hook
                coffee-mode-hook
                conf-mode-hook
                css-mode-hook
                emacs-lisp-mode-hook
                haml-mode-hook
                haskell-mode-hook
                html-mode-hook
                java-mode-hook
                js-mode-hook
                lisp-mode-hook
                lua-mode-hook
                makefile-gmake-mode-hook
                markdown-mode-hook
                nxml-mode-hook
                org-mode-hook
                perl-mode-hook
                php-mode-hook
                python-mode-hook
                ruby-mode-hook
                sass-mode-hook
                sgml-mode-hook
                sh-mode-hook
                sql-mode-hook
                xml-mode-hook
                yaml-mode-hook
                ))
  (add-hook hook (lambda () (linum-mode 1))))
