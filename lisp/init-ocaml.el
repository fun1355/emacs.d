;; OCaml
(setq opam-share (substring (shell-command-to-string "opam config var share 2> /dev/null") 0 -1))
(add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))
;; package-install merlin utop tuareg ocp-indent
(require 'merlin)
(require 'utop)
(require 'tuareg)
(require 'ocp-indent)
;; (require 'ocp-index)

(setq auto-mode-alist
      (append '(("\\.ml[ily]?$" . tuareg-mode)
                ("\\.topml$" . tuareg-mode))
              auto-mode-alist))

(autoload 'merlin-mode "merlin" "Merlin mode" t)

;; -- opam and utop setup --------------------------------
;; Setup environment variables using opam
(dolist
    (var (car (read-from-string
	       (shell-command-to-string "opam config env --sexp"))))
    (setenv (car var) (cadr var)))

;; Update the emacs path
(setq exec-path (split-string (getenv "PATH") path-separator))
;; Update the emacs load path
(push (concat (getenv "OCAML_TOPLEVEL_PATH")
              "/../../share/emacs/site-lisp") load-path)

;; Automatically load utop.el
(autoload 'utop "utop" "Toplevel for OCaml" t)
(autoload 'utop-setup-ocaml-buffer "utop" "Toplevel for OCaml" t)
;; (autoload 'utop-minor-mode "utop" "Minor mode for utop" t)
;; (add-hook 'tuareg-mode-hook 'utop-minor-mode)
(add-hook 'tuareg-mode-hook 'utop-setup-ocaml-buffer)
(setq merlin-use-auto-complete-mode t)
(setq merlin-error-after-save nil)

;; (setq utop-skip-blank-and-comments nil)
;; (setq utop-skip-to-end-of-phrase nil)
;; (setq utop-discover-phrase nil)


;; Enable Merlin for ML buffers
 ;; (add-hook 'tuareg-mode-hook 'merlin-mode)
;; So you can do it on a mac, where `C-<up>` and `C-<down>` are used
;; by spaces.
;; (define-key merlin-mode-map (kbd "C-c <up>") 'merlin-type-enclosing-go-up)
;; (define-key merlin-mode-map  (kbd "C-c <down>") 'merlin-type-enclosing-go-down)
(set-face-background 'merlin-type-face "#88FF44")

;; -- enable auto-complete -------------------------------
;; Not required, but useful along with merlin-mode
(require 'auto-complete)
(add-hook 'tuareg-mode-hook 'auto-complete-mode)

;; ;; OCaml code
;; (setq auto-mode-alist
;;       (append '(("\\.ml[ily]?$" . tuareg-mode)
;;                 ("\\.topml$" . tuareg-mode))
;;               auto-mode-alist))

;; (add-hook
;;  'tuareg-mode-hook
;;  (lambda ()
;;    ;; Add opam emacs directory to the load-path
;;    (setq opam-share
;;      (substring
;;       (shell-command-to-string "opam config var share 2> /dev/null")
;;       0 -1))
;;    (add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))
;;    (require 'tuareg)
;;    (require 'utop)
;;    ;; Load merlin-mode
;;    (require 'merlin)
;;    ;; Start merlin on ocaml files
;;    (add-hook 'tuareg-mode-hook 'merlin-mode t)
;;    (add-hook 'caml-mode-hook 'merlin-mode t)
;;    ;; Enable auto-complete
;;    (setq merlin-use-auto-complete-mode 'easy)
;;    ;; Use opam switch to lookup ocamlmerlin binary
;;    (setq merlin-command 'opam)
;;    (company-mode)
;;    (require 'ocp-indent)
;;    (autoload 'utop-minor-mode "utop" "Minor mode for utop" t)
;;    (autoload 'utop-setup-ocaml-buffer "utop" "Toplevel for OCaml" t)
;;    (autoload 'merlin-mode "merlin" "Merlin mode" t)
;;    (utop-minor-mode)
;;    (company-quickhelp-mode)
;;    ;; Important to note that setq-local is a macro and it needs to be
;;    ;; separate calls, not like setq
;;    (setq-local merlin-completion-with-doc t)
;;    (setq-local indent-tabs-mode nil)
;;    (setq-local show-trailing-whitespace t)
;;    (setq-local indent-line-function 'ocp-indent-line)
;;    (setq-local indent-region-function 'ocp-indent-region)
;;    (concat opam-share "/emacs/site-lisp/ocp-indent.el")
;;    (merlin-mode)))

;; (add-hook 'utop-mode-hook (lambda ()
;;                 (set-process-query-on-exit-flag
;;                  (get-process "utop") nil)))

(provide 'init-ocaml)