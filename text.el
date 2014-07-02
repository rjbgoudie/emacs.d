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

; Automatically pairs up brackets, in a sane way, like TextMate does
; https://github.com/capitaomorte/autopair
(require 'autopair)
(autopair-global-mode)

;;; TABS
;; Prevent Extraneous Tabs
;; https://www.gnu.org/software/emacs/manual/html_node/eintr/
;; Indent-Tabs-Mode.html
(setq-default indent-tabs-mode nil)

;;; NARROWING MODE
;; Enable narrowing mode
;; http://www.emacswiki.org/emacs/BasicNarrowing
(put 'narrow-to-region 'disabled nil)

;;; YASNIPPET
(require 'yasnippet)
(yas-global-mode 1)

;;; AUTO-COMPLETE MODE
;; Enable everywhere
;; http://stackoverflow.com/a/8098380
(require 'auto-complete)
(global-auto-complete-mode t)
(require 'auto-complete-config)
(ac-config-default)

;;; MULTIPLE CURSORS
;; https://github.com/magnars/multiple-cursors.el
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; autopair messes with multiple cursors, so disable it
(add-hook 'multiple-cursors-mode-enabled-hook (lambda ()
                                                (autopair-mode -1)))
(add-hook 'multiple-cursors-mode-disabled-hook (lambda ()
                                                (autopair-mode t)))

;;; PHI-SEARCH
;; https://github.com/zk-phi/phi-search
(require 'phi-search)
(global-set-key (kbd "C-s") 'phi-search)
(global-set-key (kbd "C-r") 'phi-search-backward)

(require 'phi-replace)
(global-set-key (kbd "M-%") 'phi-replace-query)
