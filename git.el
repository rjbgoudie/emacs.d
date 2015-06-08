(require 'git-gutter)
(global-git-gutter-mode t)
(setq git-gutter:modified-sign "~ ") ;; two space
(setq git-gutter:added-sign "+ ")    ;; multiple character is OK
(setq git-gutter:deleted-sign "-")

(set-face-foreground 'git-gutter:modified "orange")
(set-face-foreground 'git-gutter:added "green")
(set-face-foreground 'git-gutter:deleted "red")

;;; MAGIT LINE WRAPPING
;; https://gnu.org/software/emacs/manual/html_node/emacs/Visual-Line-Mode.html
;; http://stackoverflow.com/a/7398351
;; https://groups.google.com/forum/#!topic/gnu.emacs.help/e8dfr2cYPTg
;; Disable fci-mode, since it seems to prevent visual-line-mode from working
(add-hook 'magit-mode-hook (lambda ()
                             (fci-mode 0)
                             (visual-line-mode)))

;;; Word-differences in magit diffs
(setq magit-diff-refine-hunk 'all)
(setq magit-last-seen-setup-instructions "1.4.0")
