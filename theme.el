(add-hook 'after-make-frame-functions
          (lambda (frame)
            (modify-frame-parameters
             frame
             '((font . "-*-Consolas-*-*-*-*-13-*-*-*-*-*-*")))))

;; Highlight current line
(global-hl-line-mode 1)
(set-face-background 'hl-line "#3e4446")
