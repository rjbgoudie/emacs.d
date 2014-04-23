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
