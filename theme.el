(setq frame-background-mode 'dark)

;; FONT
(add-hook 'after-make-frame-functions
          (lambda (frame)
            (modify-frame-parameters
             frame
             '((font . "-*-Consolas-*-*-*-*-13-*-*-*-*-*-*")))))

;; MODE-LINE
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


;; BASICS
(set-face-attribute 'region
  nil
  :background "#5f005f"
  :foreground nil)

(set-face-foreground 'font-lock-variable-name-face "brightcyan")
(set-face-foreground 'font-lock-comment-face "brightyellow")
(set-face-foreground 'font-lock-string-face "#00ff00")
(set-face-foreground 'font-lock-keyword-face "#ff9900")
(set-face-foreground 'font-lock-constant-face "#f0f0f0")
(set-face-foreground 'font-lock-builtin-face "brightblue")

(set-face-attribute 'font-lock-function-name-face
                    nil
                    :foreground "#00ffff"
                    :weight 'bold)

;; HIGHLIGHT CURRENT LINE
(set-face-attribute 'hl-line
  nil
  :background "brightblack"
  :foreground nil
  :inherit t)

(set-face-attribute 'highlight
  nil
  :background "brightblack"
  :inherit t
  :foreground nil)

;; PARENTHESES MATCHING
(set-face-attribute 'show-paren-match
  nil
  :background "blue"
  :inherit t
  :foreground "brightwhite")
