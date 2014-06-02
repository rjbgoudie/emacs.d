;;; WHITESPACE
(set-default 'indicate-empty-lines t)
(setq-default show-trailing-whitespace t)
(setq require-final-newline t)

(require 'whitespace)
;(setq whitespace-style '(face empty tabs lines-tail trailing))
(global-whitespace-mode t)
(setq whitespace-style
      (quote (trailing tabs tab-mark empty)))

; fill-column-indicator is not compatible show-trailing-whitespace
; instead use this, as described
; https://github.com/alpaker/Fill-Column-Indicator
(setq whitespace-style '(face trailing))

;;; TEXT WIDTH
(require 'fill-column-indicator)
(setq-default fci-rule-column 80)
(setq fci-rule-width 2)
(setq fci-rule-color "#49426c")
(define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
  (global-fci-mode 1)

;;; PARENTHESES
;; Highlight matching parentheses when the point is on them.
(show-paren-mode 1)

;;; TABS
;; Prevent Extraneous Tabs
;; https://www.gnu.org/software/emacs/manual/html_node/eintr/
;; Indent-Tabs-Mode.html
(setq-default indent-tabs-mode nil)

;;; NARROWING MODE
;; Enable narrowing mode
;; http://www.emacswiki.org/emacs/BasicNarrowing
(put 'narrow-to-region 'disabled nil)

;;; AUTO-COMPLETE MODE
;; Enable everywhere
;; http://stackoverflow.com/a/8098380
(global-auto-complete-mode t)
(define-key ac-completing-map (kbd "M-h") 'ac-quick-help)
(require 'auto-complete-config)
(ac-config-default)
(setq ac-auto-start 0)
