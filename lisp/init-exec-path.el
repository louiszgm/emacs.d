(require-package 'exec-path-from-shell)

(after-load 'exec-path-from-shell
  (dolist (var '("SSH_AUTH_SOCK" "SSH_AGENT_PID" "GPG_AGENT_INFO" "LANG" "LC_CTYPE" ))
    (add-to-list 'exec-path-from-shell-variables var)))


(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))


;;; (setq-default exec-path-from-shell-arguments nil)
;;; for golang
(exec-path-from-shell-copy-env "GOPATH")

(provide 'init-exec-path)
