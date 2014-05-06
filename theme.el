(add-hook 'after-make-frame-functions
          (lambda (frame)
            (modify-frame-parameters
             frame
             '((font . "-*-Consolas-*-*-*-*-13-*-*-*-*-*-*")))))

;; Highlight current line
(global-hl-line-mode 1)
(set-face-background 'hl-line "#1c1c1c")


;; change magit diff colors
;; http://readystate4.com/2011/02/22/emacs-changing-magits-default-diff-colors
(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")
     (when (not window-system)
       (set-face-background 'magit-item-highlight "black"))))
