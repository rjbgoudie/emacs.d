(add-hook 'after-make-frame-functions
          (lambda (frame)
            (modify-frame-parameters
             frame
             '((font . "-*-Consolas-*-*-*-*-13-*-*-*-*-*-*")))))

;; Highlight current line
(global-hl-line-mode 1)
(set-face-background 'hl-line "#1c1c1c")

;; Set the colour of the mode-line, and its activated highlight colour
;; http://stackoverflow.com/a/9448316
(set-face-attribute  'mode-line
                 nil
                 :foreground "black"
                 :background "darkorange"
                 :box '(:line-width 1 :style released-button))
(set-face-attribute  'mode-line-inactive
                 nil
                 :foreground "white"
                 :background "gray25"
                 :box '(:line-width 1 :style released-button))

;; change magit diff colors
;; http://readystate4.com/2011/02/22/emacs-changing-magits-default-diff-colors
(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")
     (set-face-background 'magit-diff-add "#1c1c1c")
     (set-face-background 'magit-diff-del "#1c1c1c")
     (when (not window-system)
       (set-face-background 'magit-item-highlight "black"))))
