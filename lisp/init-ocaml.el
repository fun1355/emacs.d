;; OCaml
(setq opam-share (substring (shell-command-to-string "opam config var share 2> /dev/null") 0 -1))
(add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))
;; opam install tuareg
(add-to-list 'load-path (concat opam-share "/tuareg"))
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
(add-hook 'tuareg-mode-hook 'merlin-mode)
(add-hook 'caml-mode-hook 'merlin-mode)

;; -- opam and utop setup --------------------------------
;; Setup environment variables using opam
(dolist
   (var (car (read-from-string
           (shell-command-to-string "opam config env --sexp"))))
 (setenv (car var) (cadr var)))
;; Update the emacs path
(setq exec-path (split-string (getenv "PATH") path-separator))
;; Update the emacs load path

;; (push (concat (getenv "OCAML_TOPLEVEL_PATH")
;; "/../../share/emacs/site-lisp") load-path)

;; Automatically load utop.el
(autoload 'utop "utop" "Toplevel for OCaml" t)
(autoload 'utop-setup-ocaml-buffer "utop" "Toplevel for OCaml" t)
(add-hook 'tuareg-mode-hook 'utop-setup-ocaml-buffer)
(setq merlin-use-auto-complete-mode t)
(setq merlin-error-after-save nil)

;; Enable Merlin for ML buffers
;; (add-hook 'tuareg-mode-hook 'merlin-mode)
;; So you can do it on a mac, where `C-<up>` and `C-<down>` are used
;; by spaces.
;; (define-key merlin-mode-map (kbd "C-c <up>") 'merlin-type-enclosing-go-up)
;; (define-key merlin-mode-map  (kbd "C-c <down>") 'merlin-type-enclosing-go-down)
(set-face-background 'merlin-type-face "#88FF44")

;; -- enable auto-complete -------------------------------
;; Not required, but useful along with merlin-mode
;; (require 'auto-complete)
;; (add-hook 'tuareg-mode-hook 'auto-complete-mode)

(provide 'init-ocaml)