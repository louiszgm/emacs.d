(setq org2nikola-output-root-directory "~/git/blog")
;; use google code prettify (https://code.google.com/p/google-code-prettify/)
(setq org2nikola-use-google-code-prettify t)
(setq org2nikola-use-verbose-metadata t)
(defun org2nikola-after-hook-setup (title slug)
  (let ((nikola-dir (file-truename "~/git/blog"))
        cmd)
    ;; push posts ...
    (message "start push blog to gitea repository" )
    (shell-command (format "cd %s;git add .;git commit -m 'updated';git push origin master" nikola-dir))
    ))

(add-hook 'org2nikola-after-hook 'org2nikola-after-hook-setup)

;; This is org setup
(setq org-export-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(set-charset-priority 'unicode)
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))

(setq org-agenda-files (quote ("~/git/org"
                               "~/git/org/client"
                               "~/git/dockerfiles/run.org")))


(setq org-directory "~/git/org")
(setq org-default-notes-file "~/git/org/refile.org")


;;some special package that not contain, you should install it manual

;;smartparens
(require 'smartparens-config)

(provide 'init-local)
