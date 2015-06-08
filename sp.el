(require 'smartparens-config)
(require 'smartparens-latex)
(smartparens-global-mode t)
(sp-use-smartparens-bindings)

(sp-with-modes sp--lisp-modes
  (sp-local-pair "(" nil :bind "C-("))
