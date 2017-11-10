;;; Almost Monokai: color-theme-almost-monokai.el
;;; A beautiful, fruity and calm emacs color theme.

;; Author: Prateek Saxena <prtksxna@gmail.com>
;; Author: Pratul Kalia   <pratul@pratul.in>
;;
;; Based on the Monokai TextMate theme
;; Author: Wimer Hazenberg <http://www.monokai.nl>

;; Depends: color-theme

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;; https://github.com/lut4rp/almost-monokai
; Color theme support is required.
(require 'color-theme)

; Code start.
(defun color-theme-almost-monokai ()
  (interactive)
  (color-theme-install
   '(color-theme-almost-monokai
     ((background-color . "#272821")
      (foreground-color . "#F8F8F2")
      (cursor-color . "#DAD085"))
     (default ((t (nil))))
     (modeline ((t (:background "white" :foreground "black" :box (:line-width 1 :style released-button)))))
     (font-lock-builtin-face ((t (:foreground "#A6E22A"))))
     (font-lock-comment-face ((t (:italic t :foreground "#75715D"))))
     (font-lock-constant-face ((t (:foreground "#A6E22A"))))
     (font-lock-doc-string-face ((t (:foreground "#65B042"))))
     (font-lock-string-face ((t (:foreground "#DFD874"))))
     (font-lock-function-name-face ((t (:foreground "#F1266F" :italic t))))
     (font-lock-keyword-face ((t (:foreground "#66D9EF"))))
     (font-lock-type-face ((t (:underline t :foreground "#89BDFF"))))
     (font-lock-variable-name-face ((t (:foreground "#A6E22A"))))
     (font-lock-warning-face ((t (:bold t :foreground "#FD5FF1"))))
     (highlight-80+ ((t (:background "#D62E00"))))
     (hl-line ((t (:background "#1A1A1A"))))
     (region ((t (:background "#6DC5F1"))))
     (ido-subdir ((t (:foreground "#F1266F"))))
    )
  )
)
(color-theme-almost-monokai)
;; (provide 'color-theme-almost-monokai)
(provide 'init-color-theme)
;---------------
; Code end.
(require 'color-theme)

;; {{ work around color theme bug
;; @see https://plus.google.com/106672400078851000780/posts/KhTgscKE8PM
(defadvice load-theme (before disable-themes-first activate)
  ;; disable all themes
  (dolist (i custom-enabled-themes)
    (disable-theme i)))
;; }}


(defvar my-current-color-theme nil
  "My current color theme.")

(defun my-toggle-color-theme ()
  "Toggle between the major color theme and fallback theme.
Fallback theme is used only if the console does NOT support 256 colors."
  (interactive)
  (cond
   ((string= my-current-color-theme "favorite")
    ;; fallback color theme from color-theme library
    (unless color-theme-initialized (color-theme-initialize))
    ;; {{ fallback built in color theme
    (color-theme-deep-blue)
    ;; }}
    (setq my-current-color-theme "fallback"))
   (t
    ;; {{ enable my favourite color theme
    (unless (featurep 'color-theme-molokai)
      (require 'color-theme-molokai))
    (color-theme-molokai)
    ;; }}
    (setq my-current-color-theme "favorite"))))
;; turn on the color theme now!
(my-toggle-color-theme)

;; This line must be after color theme setup! Don't know why.
(setq color-theme-illegal-faces "^\\(w3-\\|dropdown-\\|info-\\|linum\\|yas-\\|font-lock\\|dired-directory\\)")

(provide 'init-color-theme)
