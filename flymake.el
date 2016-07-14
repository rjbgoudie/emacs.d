;; Flymake
;; https://gist.github.com/crowding/3984881
;; R flymake support (if Flymake is available) This will call a script
;; "rflymake" with the path given; make sure it is on emac's exec-path
;; or give a full path.
(defun flymake-r-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list "~/.dotfiles/bin/rflymake" (list local-file))))

(defun flymake-get-tex-args (file-name)
  (list "pdflatex" (list "-file-line-error" "-draftmode" "-interaction=nonstopmode" file-name)))

(defun my-flymake-show-help ()
  (when (get-char-property (point) 'flymake-overlay)
    (let ((help (get-char-property (point) 'help-echo)))
      (if help (message "%s" help)))))

(use-package flymake
  :disabled
  :commands
  (ess-mode-hook TeX-mode-hook flymake-mode)
  :init
  (add-hook 'ess-mode-hook 'flymake-mode)
  (add-hook 'TeX-mode-hook 'flymake-mode)
  (add-hook 'post-command-hook 'my-flymake-show-help)
  :config

  ;; R
  (add-to-list 'flymake-allowed-file-name-masks '("\\.[Rr]\\'" flymake-r-init))
  (add-to-list 'flymake-err-line-patterns
               '("parse(\"\\([^\"]*\\)\"): \\([0-9]+\\):\\([0-9]+\\): \\(.*\\)$"
                 1 2 3 4))
  ;; THEME
  (set-face-attribute 'flymake-errline
                      nil
                      :background "brightred"
                      :foreground "brightwhite")
  )

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  :config
  (set-face-attribute 'flycheck-error
                      nil
                      :background "brightred"
                      :foreground "brightwhite")
  )

(flycheck-define-checker tex-latex
  "A TeX and LaTeX syntax and style checker using latex."
  :command ("pdflatex" "-file-line-error" "-draftmode" "-interaction=nonstopmode"
            source-inplace)
  :error-patterns
  (
   (error line-start "! " (message "Undefined control sequence.\nl." line (one-or-more not-newline)) line-end)
   (error line-start "! " (message (one-or-more not-newline) "\n" (minimal-match (zero-or-more (zero-or-more not-newline) "\n")))
          "l." line (zero-or-more not-newline) line-end)
   (warning  line-start "LaTeX Warning:" (message) " on input line " line "." line-end)
   )
  :modes (tex-mode latex-mode plain-tex-mode yatex-mode))
(add-to-list 'flycheck-checkers 'tex-latex)
