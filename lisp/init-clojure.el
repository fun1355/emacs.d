;; Enable eldoc in Clojure buffers:
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
;; Log communication with the nREPL server (extremely useful for debugging CIDER problems):
(setq nrepl-log-messages t)
;; You can hide the *nrepl-connection* and *nrepl-server* buffers from appearing in some buffer switching commands like switch-to-buffer(C-x b) like this:
(setq nrepl-hide-special-buffers t)
;; To prefer local resources to remote (tramp) ones when both are available:
(setq cider-prefer-local-resources t)
;; Prevent the auto-display of the REPL buffer in a separate window after connection is established:
(setq cider-repl-pop-to-buffer-on-connect nil)
;; Don't show on error:
(setq cider-show-error-buffer nil)
;;(setq cider-show-error-buffer 'except-in-repl) ; or
;;(setq cider-show-error-buffer 'only-in-repl)

;; To disable auto-selection of the error buffer when it's displayed:
(setq cider-auto-select-error-buffer nil)
;;  Valid filter types include java, clj, repl, tooling, and dup. Setting this to nil will show all stacktrace frames.
(setq cider-stacktrace-default-filters '(tooling dup))
(setq cider-stacktrace-fill-column 80)
;; The REPL buffer name has the format *cider-repl project-name*. Change the separator from space to something else by overriding nrepl-buffer-name-separator.
(setq nrepl-buffer-name-separator "-")
;; The REPL buffer name can also display the port on which the nREPL server is running. Buffer name will look like cider-repl project-name:port.
(setq nrepl-buffer-name-show-port t)
;; Make C-c C-z switch to the CIDER REPL buffer in the current window:
(setq cider-repl-display-in-current-window t)
;; Prevent C-c C-k from prompting to save the file corresponding to the buffer being loaded, if it's modified:
(setq cider-prompt-save-file-on-load nil)
;; Change the result prefix for REPL evaluation (by default there's no prefix):
(setq cider-repl-result-prefix ";; => ")
;; (setq cider-repl-use-clojure-font-lock t)
(setq cider-repl-use-clojure-font-lock t)
(setq cider-known-endpoints '(("host-a" "10.10.10.1" "7888") ("host-b" "7888")))
(setq nrepl-log-messages t)
(setq nrepl-hide-special-buffers nil)
(setq cider-repl-tab-command 'indent-for-tab-command)
(add-hook 'cider-mode-hook 'company-mode)
(add-hook 'cider-repl-mode-hook 'company-mode)
(add-hook 'cider-repl-mode-hook 'subword-mode)
;; (add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'smartparens-strict-mode)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)
(provide 'init-clojure)