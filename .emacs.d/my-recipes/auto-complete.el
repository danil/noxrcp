(eval-after-load 'auto-complete-config
  '(progn
     (ac-config-default)
     (setq ac-disable-faces (quote (font-lock-doc-face)))
     (setq ac-ignore-case nil) ;preserve capitalization <http://stackoverflow.com/questions/15637536/how-do-i-preserve-capitalization-when-using-autocomplete-in-emacs>
     (dolist (mode '( ;<http://stackoverflow.com/questions/10779636/emacs-auto-complete-key-binding-didnt-work>
                     coffee-mode
                     conf-mode
                     conf-space-mode
                     conf-xdefaults-mode
                     haml-mode
                     html-mode
                     inf-ruby-mode
                     lua-mode
                     magit-log-edit-mode
                     markdown-mode
                     nxml-mode
                     org-mode
                     rhtml-mode
                     sass-mode
                     scss-mode
                     sgml-mode
                     shell-mode
                     sql-interactive-mode
                     sql-mode
                     yaml-mode
                     ))
       (add-to-list 'ac-modes mode))
     ))
