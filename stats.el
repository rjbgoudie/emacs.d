(setq ess-default-style 'DEFAULT)

(require 'ess-site)
(ess-toggle-underscore nil)
(setq ess-eval-visibly-p 'nowait)
(setq ess-ask-for-ess-directory nil)
(setq ess-local-process-name "R")

(setq inferior-R-args "--no-save ")

(add-hook 'ess-R-post-run-hook 'ess-execute-screen-options)

(defun my-ac-ess-config ()
  (setq ac-sources
        (append '(ac-source-R
                  ac-source-filename
                  ac-source-words-in-buffer
                  ac-source-files-in-current-dir)
                ac-sources)))

(add-hook 'ess-mode-hook 'my-ac-ess-config)
(add-hook 'ess-post-run-hook 'my-ac-ess-config)

;(setq ess-busy-strings ess-busy-slash)

; https://stat.ethz.ch/pipermail/ess-help/
; attachments/20110606/262ab5f7/attachment.pl
(setq comint-scroll-to-bottom-on-input t)
(setq comint-scroll-to-bottom-on-output t)
(setq comint-move-point-for-output t)
(setq comint-scroll-show-maximum-output t)

(setq ess-fancy-comments nil)

;; Formatting of R code
;; https://gist.github.com/crowding/9075782
(add-hook 'R-mode-hook 'rjbg-R-formatting-preferences)

(defun rjbg-R-formatting-preferences ()
  (ess-set-style 'rjbg-style)
)

(ess-add-style 'rjbg-style
  '((ess-indent-level . 2)
  (ess-arg-function-offset . nil)
  (ess-arg-function-offset-new-line . '(2))
  (ess-expression-offset . 2)
  ))

;; Flymake
;; https://gist.github.com/crowding/3984881
;; R flymake support (if Flymake is available) This will call a script
;; "rflymake" with the path given; make sure it is on emac's exec-path
;; or give a full path.
(require 'flymake)

(defun flymake-r-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list "/home/robert/bin/rflymake" (list local-file))))

(add-to-list 'flymake-allowed-file-name-masks '("\\.[Rr]\\'" flymake-r-init))
(add-to-list 'flymake-err-line-patterns
             '("parse(\"\\([^\"]*\\)\"): \\([0-9]+\\):\\([0-9]+\\): \\(.*\\)$"
               1 2 3 4))
(add-hook 'ess-mode-hook
          '(lambda () (flymake-mode)))

;; THEME SETTINGS
(setq ess-R-font-lock-keywords '((ess-R-fl-keyword:modifiers . t)
                                 (ess-R-fl-keyword:fun-defs . f)
                                 (ess-R-fl-keyword:keywords . t)
                                 (ess-R-fl-keyword:assign-ops . t)
                                 (ess-R-fl-keyword:constants . t)
                                 (ess-fl-keyword:fun-calls . t)
                                 (ess-fl-keyword:numbers . t)
                                 (ess-fl-keyword:operators . t)
                                 (ess-fl-keyword:delimiters . t)
                                 (ess-fl-keyword:= . t)
                                 (ess-R-fl-keyword:F&T . t)))
