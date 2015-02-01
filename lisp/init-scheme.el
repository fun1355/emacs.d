(require 'geiser)
;;; Always do syntax highlighting
(global-font-lock-mode 1)
;;; Also highlight parens
(setq show-paren-delay 0
      show-paren-style 'parenthesis)
(show-paren-mode 1)

(setq scheme-program-name "guile")
;; paredit
(add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)

(setq geiser-repl-history-filename "~/.emacs.d/geiser-history")

(provide 'init-scheme)