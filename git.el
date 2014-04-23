(require 'git-gutter)
(global-git-gutter-mode t)
(setq git-gutter:modified-sign "~ ") ;; two space
(setq git-gutter:added-sign "+ ")    ;; multiple character is OK
(setq git-gutter:deleted-sign "-")

(set-face-foreground 'git-gutter:modified "orange")
(set-face-foreground 'git-gutter:added "green")
(set-face-foreground 'git-gutter:deleted "red")
