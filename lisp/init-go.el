(maybe-require-package 'go-projectile)
(maybe-require-package 'go-mode)
(maybe-require-package 'golint)
(maybe-require-package 'go-eldoc)
(maybe-require-package 'gotest)
(maybe-require-package 'company-go)


(require 'company)
(require 'company-go)
(require 'go-projectile)


;; Ignore go test -c output files
(add-to-list 'completion-ignored-extensions ".test")

(define-key 'help-command (kbd "G") 'godoc)

(with-eval-after-load 'go-mode
  (defun prelude-go-mode-defaults ()
    ;; Add to default go-mode key bindings
    (let ((map go-mode-map))
      (define-key map (kbd "C-c b") 'go-run)
      (define-key map (kbd "C-h f") 'godoc-at-point))

    ;; Prefer goimports to gofmt if installed
    (let ((goimports (executable-find "goimports")))
      (when goimports
        (setq gofmt-command goimports)))

    ;; gofmt on save
    (add-hook 'before-save-hook 'gofmt-before-save nil t)

    ;; stop whitespace being highlighted
    (whitespace-toggle-options '(tabs))

    ;; Company mode settings
    (set (make-local-variable 'company-backends) '(company-go))

    ;; El-doc for Go
    (go-eldoc-setup)

    ;; CamelCase aware editing operations
    (subword-mode +1))

  (setq prelude-go-mode-hook 'prelude-go-mode-defaults)

  (add-hook 'go-mode-hook (lambda ()
                            (run-hooks 'prelude-go-mode-hook))))
;;; end of init-go
(provide 'init-go)
