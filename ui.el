(when (>= emacs-major-version 24)
  (setq pe/width 23)
  (project-explorer-open))

;; Highlight current line
(global-hl-line-mode 1)

;; For ace-window
;; Configuration copied from Endless Parentheses
;; http://endlessparentheses.com/upgrading-ace-jump-for-ace-window.html
(when (>= emacs-major-version 24)
  (setq avi-keys
        '(?a ?s ?d ?e ?f ?h ?j ?k ?l ?n ?m ?v ?r ?u))
  (setq aw-keys '(?a ?s ?d ?f ?j ?k ?l))
  (global-set-key (kbd "M-s")     #'avi-goto-word-1)
  (global-set-key (kbd "C-x C-o") #'ace-window)
  (avy-setup-default)
  (global-set-key (kbd "M-g g") 'avy-goto-line)
  (global-set-key (kbd "M-g e") 'avy-goto-word-0)
  (global-set-key (kbd "M-g w") 'avy-goto-word-1)
  (global-set-key (kbd "M-g s") 'avy-goto-subword-0))
