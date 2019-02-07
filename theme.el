(setq frame-background-mode 'dark)

(setq colorblind-green "#128F5F")
(setq colorblind-brightgreen "#03C08B")
(setq colorblind-darkgreen "#01402E")
(setq colorblind-blue "#0B5CA2")
(setq colorblind-red "#D65621")
(setq colorblind-brightred "#FB4608")
(setq colorblind-darkred "#7F3801")
(setq colorblind-pink "#BF6196")
(setq colorblind-yellow "#EBE133")
(setq colorblind-lightblue "#AEDEFF")
(setq colorblind-orange "#DE8E08")
(setq colorblind-brightorange "#FFA308")
(setq colorblind-darkorange "#815304")
(setq colorblind-darkgray "#414141")
(setq colorblind-darkblue "#262B31")

(set-face-attribute 'default
                    nil
                    :foreground colorblind-lightblue)

;; FONT
(add-hook 'after-make-frame-functions
          (lambda (frame)
            (modify-frame-parameters
             frame
             '((font . "-*-Consolas-*-*-*-*-13-*-*-*-*-*-*")))))

;; MODE-LINE
;; Set the colour of the mode-line, and its activated highlight colour
;; http://stackoverflow.com/a/9448316
(set-face-attribute  'mode-line nil
                     :foreground "black"
                     :background "#797979"
                     :box '(:line-width 1 :style released-button))
(set-face-attribute  'mode-line-inactive nil
                     :foreground "white"
                     :background "gray25"
                     :box '(:line-width 1 :style released-button))

;; BASICS
(set-face-attribute 'region nil
                    :background "#333333"
                    :foreground nil)

(set-face-attribute 'font-lock-builtin-face nil
                    :foreground colorblind-blue)

(set-face-attribute 'font-lock-comment-face nil
                    :foreground colorblind-yellow)

(set-face-attribute 'font-lock-comment-delimiter-face nil
                    :foreground colorblind-yellow)

(set-face-attribute 'font-lock-constant-face nil
                    :foreground colorblind-lightblue
                    :weight 'bold)

(set-face-attribute 'font-lock-doc-face nil
                    :foreground colorblind-green)

(set-face-attribute 'font-lock-function-name-face nil
                    :foreground colorblind-green)

(set-face-attribute 'font-lock-keyword-face nil
                    :foreground colorblind-blue
                    :weight 'bold)

(set-face-attribute 'font-lock-string-face nil
                    :foreground colorblind-pink)

(set-face-attribute 'font-lock-type-face nil
                    :foreground colorblind-orange)

(set-face-attribute 'font-lock-variable-name-face nil
                    :foreground colorblind-orange)

(set-face-attribute 'font-lock-warning-face nil
                    :background colorblind-red)

(set-face-attribute 'font-lock-function-name-face nil
                    :foreground colorblind-blue
                    :weight 'bold)

;; HIGHLIGHT CURRENT LINE
(set-face-attribute 'hl-line nil
                    :background "#303030"
                    :foreground nil
                    :inherit t)

(set-face-attribute 'highlight nil
                    :background "#272727"
                    :inherit t
                    :foreground nil)

;; PARENTHESES MATCHING
(set-face-attribute 'show-paren-match nil
                    :background "#2F3A47"
                    :inherit t)
