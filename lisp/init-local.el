(require 'blog-admin)
(setq blog-admin-backend-type 'nikola)
(setq blog-admin-backend-path "~/blog")
(setq blog-admin-backend-new-post-in-drafts t)
(setq blog-admin-backend-nikola-executable "~/dockerfiles/nikola/bin/nikola-docker") ;; path to nikola executable
(setq blog-admin-backend-nikola-config-file "conf.py") ;; conf.py is default

(require 'smartparens-config)

(setq org2nikola-output-root-directory "~/blog")
;; use google code prettify (https://code.google.com/p/google-code-prettify/)
(setq org2nikola-use-google-code-prettify t)
(setq org2nikola-use-verbose-metadata t)
(defun org2nikola-after-hook-setup (title slug)
  (let ((nikola-dir (file-truename "~/blog"))
        cmd)
    ;; push posts ...
    (message "start push blog to gitea repository" )
    (shell-command (format "cd %s;git add .;git commit -m 'updated';git push origin master" nikola-dir))
    ))

(add-hook 'org2nikola-after-hook 'org2nikola-after-hook-setup)




(provide 'init-local)
