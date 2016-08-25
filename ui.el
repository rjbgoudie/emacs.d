;; (when (>= emacs-major-version 24)
;;   (setq pe/width 23)
;;   (project-explorer-open))

;; Highlight current line
(global-hl-line-mode 1)

;; For ace-window
;; Configuration copied from Endless Parentheses
;; http://endlessparentheses.com/upgrading-ace-jump-for-ace-window.html
;; (when (>= emacs-major-version 24)
;;   (setq avi-keys
;;         '(?a ?s ?d ?e ?f ?h ?j ?k ?l ?n ?m ?v ?r ?u))
;;   (setq aw-keys '(?a ?s ?d ?f ?j ?k ?l))
;;   (global-set-key (kbd "M-s")     #'avi-goto-word-1)
;;   (global-set-key (kbd "C-x C-o") #'ace-window)
;;   (avy-setup-default)
;;   (global-set-key (kbd "M-g g") 'avy-goto-line)
;;   (global-set-key (kbd "M-g e") 'avy-goto-word-0)
;;   (global-set-key (kbd "M-g w") 'avy-goto-word-1)
;;   (global-set-key (kbd "M-g s") 'avy-goto-subword-0))

(setq-default mode-line-format
              (list " "
                                        ; */% indicators if the file has been modified
                    'mode-line-modified
                    "--"
                                        ; the name of the buffer (i.e. filename)
                                        ; note this gets automatically highlighted
                    'mode-line-buffer-identification
                    "--"
                                        ; major and minor modes in effect
                    'mode-line-modes
                                        ; if which-func-mode is in effect, display which
                                        ; function we are currently in.
                    '(which-func-mode ("" which-func-format "--"))
                                        ; line, column, file %
                    'mode-line-position
                    "--"
                                        ; if vc-mode is in effect, display version control
                                        ; info here
                    `(vc-mode vc-mode)
                    "--"
                                        ; hostname

                    '(:eval (propertize (if (string-suffix-p "bsu" system-name) " " (system-name))
                                        'face (if (string-suffix-p "bsu" system-name) 'mode-line 'font-lock-function-name-face)
                                        ))
                                        ; dashes sufficient to fill rest of modeline.
                    "-%-"
                    )
              )
