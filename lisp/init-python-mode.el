;; (add-auto-mode 'python-mode "\\.py\\'")

;; (require 'python-mode)
;; ; use IPython
;; (setq-default py-shell-name "ipython")
;; (setq-default py-which-bufname "IPython")
;; ; use the wx backend, for both mayavi and matplotlib
;; (setq py-python-command-args
;;   '("--matplotlib" "--colors" "LightBG"))
;; (setq py-force-py-shell-name-p t)

;; ; switch to the interpreter after executing code
;; (setq py-shell-switch-buffers-on-execute-p t)
;; (setq py-switch-buffers-on-execute-p t)
;; ; don't split windows
;; (setq py-split-windows-on-execute-p t)
;; ; try to automagically figure out indentation
;; (setq py-smart-indentation t)

;; ; pymacs
;; (add-to-list 'load-path "~/.emacs.d/Pymacs-0.25")
;; (autoload 'pymacs-apply "pymacs")
;; (autoload 'pymacs-call "pymacs")
;; (autoload 'pymacs-eval "pymacs" nil t)
;; (autoload 'pymacs-exec "pymacs" nil t)
;; (autoload 'pymacs-load "pymacs" nil t)
;; (autoload 'pymacs-autoload "pymacs")
;; (setq py-load-pymacs-p t)
;; ; ropemacs
;; (require 'pymacs)
;; (pymacs-load "ropemacs" "rope-")



;; (setq
;;   python-shell-interpreter "ipython"
;;   python-shell-interpreter-args ""
;;   python-shell-prompt-regexp "In \\[[0-9]+\\]: "
;;   python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
;;   python-shell-completion-setup-code
;;   "from IPython.core.completerlib import module_completion"
;;   python-shell-completion-module-string-code
;;   "';'.join(module_completion('''%s'''))\n"
;;   python-shell-completion-string-code
;;   "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

;; (autoload 'python-mode "python-mode" "Python Mode." t)
;; (add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
;; (add-to-list 'interpreter-mode-alist '("python" . python-mode))
;; ; http://www.jesshamrick.com/2012/09/18/emacs-as-a-python-ide/
;; (require 'python)
;; (setq python-shell-interpreter "ipython")
;; (setq python-shell-interpreter-args "--pylab")
;; ; use IPython
;; (setq ipython-command "/usr/bin/ipython")
;; (setq-default py-shell-name "ipython")
;; (setq-default py-which-bufname "IPython")
;; ; use the wx backend, for both mayavi and matplotlib
;; (setq py-python-command-args
;;   '("--pylab"))
;; (setq py-force-py-shell-name-p t)

;; ; switch to the interpreter after executing code
;; (setq py-shell-switch-buffers-on-execute-p nil)
;; (setq py-switch-buffers-on-execute-p t)
;; ; don't split windows
;; (setq py-split-windows-on-execute-p t)

(require 'package)
(add-to-list 'package-archives
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))

(package-initialize)
(elpy-enable)
;; (elpy-use-ipython)

(setq python-shell-interpreter "python"
      python-shell-interpreter-args "-i")

; try to automagically figure out indentation
(autoload 'doctest-mode "doctest-mode" "Python doctest editing mode." t)


(setq interpreter-mode-alist
      (cons '("python" . python-mode) interpreter-mode-alist))

;; run command `pip install jedi flake8 importmagic` in shell,
;; or just check https://github.com/jorgenschaefer/elpy
(elpy-enable)

(defun python-mode-hook-setup ()
  (unless (is-buffer-file-temp)
    ;; http://emacs.stackexchange.com/questions/3322/python-auto-indent-problem/3338#3338
    ;; emacs 24.4 only
    (setq electric-indent-chars (delq ?: electric-indent-chars))))

(add-hook 'python-mode-hook 'python-mode-hook-setup)

(provide 'init-python-mode)
