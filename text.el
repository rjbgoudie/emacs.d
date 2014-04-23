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

(require 'fill-column-indicator)
(setq-default fci-rule-column 80)
(setq fci-rule-width 2)
(setq fci-rule-color "#49426c")
(define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
  (global-fci-mode 1)

;; Highlight matching parentheses when the point is on them.
(show-paren-mode 1)
