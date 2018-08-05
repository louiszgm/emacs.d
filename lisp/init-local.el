(require 'blog-admin)
(setq blog-admin-backend-path "~/blog")
(setq blog-admin-backend-type 'hexo)
(setq blog-admin-backend-new-post-in-drafts t) ;; create new post in drafts by default
(setq blog-admin-backend-new-post-with-same-name-dir t) ;; create same-name directory with new post
(setq blog-admin-backend-hexo-config-file "_config.yml") ;; default assumes _config.yml

(require 'smartparens-config)

(setq org2nikola-output-root-directory "~/blog")
;; use google code prettify (https://code.google.com/p/google-code-prettify/)
(setq org2nikola-use-google-code-prettify t)

(provide 'init-local)
