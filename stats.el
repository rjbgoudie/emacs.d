(setq ess-default-style 'DEFAULT)

(require 'ess-site)
(ess-toggle-underscore nil)
(setq ess-use-auto-complete t)
(setq ess-eval-visibly-p nil)

(defun my-ac-ess-config ()
  (setq ac-sources
	'(ac-source-R-objects ac-source-filename ac-source-words-in-buffer)))

(add-hook 'ess-mode-hook 'my-ac-ess-config)
(add-hook 'ess-post-run-hook 'my-ac-ess-config)

;(setq ess-busy-strings ess-busy-slash)

; https://stat.ethz.ch/pipermail/ess-help/
; attachments/20110606/262ab5f7/attachment.pl
(setq comint-scroll-to-bottom-on-input t)
(setq comint-scroll-to-bottom-on-output t)
(setq comint-move-point-for-output t)
(setq comint-scroll-show-maximum-output t)

(setq ess-fancy-comments nil)
