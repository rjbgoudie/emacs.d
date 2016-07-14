;;; WHITESPACE
(use-package whitespace
  :defer 2
  :init
  (set-default 'indicate-empty-lines t)
  (setq require-final-newline t)

  ;; fill-column-indicator is not compatible show-trailing-whitespace
  ;; instead use this, as described
  ;; https://github.com/alpaker/Fill-Column-Indicator
  (setq whitespace-style '(face trailing tabs empty tab-mark))

  :config
  (global-whitespace-mode t)
  )

;; SENTENCE MODE
(setq sentence-end-double-space nil)

;;; TEXT WIDTH
(use-package fill-column-indicator
  :config
  (setq-default fci-rule-column 80)
  (setq fci-rule-width 2)
  (setq fci-rule-color "#49426c")
  (define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
  (global-fci-mode 1)
  )

;;; PARENTHESES
;; Highlight matching parentheses when the point is on them.
(show-paren-mode t)
(setq show-paren-style 'expression)

;;; TABS
;; Prevent Extraneous Tabs
;; https://www.gnu.org/software/emacs/manual/html_node/eintr/
;; Indent-Tabs-Mode.html
(setq-default indent-tabs-mode nil)

;;; AGGRESSIVE-INDENT
;; Enable for all programming modes
;;(when (>= emacs-major-version 24)
;;  (global-aggressive-indent-mode 1))
;;(add-to-list 'aggressive-indent-excluded-modes 'noweb-mode)
(use-package aggressive-indent
  :defer 1
  :init
  (global-aggressive-indent-mode 1)
  (add-hook 'r-mode-hook #'aggressive-indent-mode)
  (add-to-list 'aggressive-indent-excluded-modes 'noweb-mode)
  )

;;; NARROWING MODE
;; Enable narrowing mode
;; http://www.emacswiki.org/emacs/BasicNarrowing
(put 'narrow-to-region 'disabled nil)

;; ;;; YASNIPPET
;; (use-package yasnippet
;;   :defer 2
;;   :init
;;   (yas-global-mode 1)
;;   )

;;; AUTO-COMPLETE MODE
;; Enable everywhere
;; http://stackoverflow.com/a/8098380
(use-package auto-complete
  :config
  (progn
    (global-auto-complete-mode t)
    (ac-config-default)
    (use-package auto-complete-config
      :ensure auto-complete)
    ))

(use-package company
  :disabled
  :pin melpa-stable
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  (add-hook 'global-company-mode-hook 'company-statistics-mode)
  )

;;; MULTIPLE CURSORS
;; https://github.com/magnars/multiple-cursors.el
;; (require 'multiple-cursors)
;; (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
;; (global-set-key (kbd "C->") 'mc/mark-next-like-this)
;; (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
;; (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; autopair messes with multiple cursors, so disable it
;; (add-hook 'multiple-cursors-mode-enabled-hook (lambda ()
;;                                                 (autopair-mode -1)))
;; (add-hook 'multiple-cursors-mode-disabled-hook (lambda ()
;;                                                 (autopair-mode t)))

;;; PHI-SEARCH
;; https://github.com/zk-phi/phi-search
(use-package phi-search
  :defer 2
  :bind (("C-s" . phi-search)
         ("C-r" . phi-search-backward))
  :config
  (set-face-attribute 'phi-search-selection-face nil
                      :background "brightgreen"
                      :foreground "black"
                      :inverse-video nil)

  (set-face-attribute 'phi-search-match-face nil
                      :background "green"
                      :foreground "black"
                      :inverse-video nil)
  )

(use-package phi-replace
  :defer 2
  :ensure phi-search
  :bind ("M-%" . phi-replace-query)
  :config
  (set-face-attribute 'phi-search-selection-face nil
                      :background "brightgreen"
                      :foreground "black"
                      :inverse-video nil)

  (set-face-attribute 'phi-search-match-face nil
                      :background "green"
                      :foreground "black"
                      :inverse-video nil)
  )

;;; ORG-MODE
(use-package org
  :disabled
  :init
  (setq org-startup-indented t
        org-indent-mode t)
  )
