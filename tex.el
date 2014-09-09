;; AucTeX
(setq TeX-auto-save t)
(setq TeX-parse-self t)

;; Assume that the current buffer is the master
;; https://www.gnu.org/software/auctex/manual/auctex/Multifile.html
(setq-default TeX-master t)

;; Wrap text in LaTeX mode
(add-hook 'LaTeX-mode-hook 'visual-line-mode)

;; Turn on flyspell, which will use aspell if it is installed
(add-hook 'LaTeX-mode-hook 'flyspell-mode)

(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(setq TeX-PDF-mode t)

;;; Compiling using latexmk ----------------------------------------------------
;; https://sites.google.com/site/andreaskiermeier/essmaterials
(setq TeX-file-extensions
      '("Snw" "Rnw" "nw" "tex" "sty" "cls" "ltx" "texi" "texinfo"))
;(add-to-list 'auto-mode-alist '("\\.Rnw$" . Rnw-mode))
;(add-to-list 'auto-mode-alist '("\\.Snw$" . Snw-mode))

(add-hook 'LaTeX-mode-hook
 (lambda ()
  (add-to-list 'TeX-command-list
   '("latexmk" "latexmk -pdf %t"
     TeX-run-TeX nil (latex-mode) :help "Run latexmk") t)
  (setq TeX-command-default "latexmk")))

;; (add-hook 'Rnw-mode-hook
;;  (lambda ()
;;   (add-to-list 'TeX-expand-list '("%rnw" file "Rnw" t) t)
;;   (add-to-list 'TeX-command-list
;;    '("latexmk" "latexmk -pdf %s.Rnw"
;;      TeX-run-TeX nil (latex-mode) :help "Run Sweave") t)
;;   (setq TeX-command-default "latexmk")))

;; use Skim as default pdf viewer
;; Skim's displayline is used for forward search (from .tex to .pdf)
;; option -b highlights the current line; option -g opens Skim in the background
(setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
(setq TeX-view-program-list
  '(("PDF Viewer"
     "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))

;;; Auto-complete --------------------------------------------------------------
;; Auto-complete for AucTex
;; https://github.com/monsanto/auto-complete-auctex/blob/master/
;; auto-complete-auctex.el
(add-to-list 'load-path "~/.dotfiles/emacs.d/vendor/auto-complete-latex/")
; (require 'auto-complete-auctex)
(require 'auto-complete-latex)
(require 'ac-math)
(add-to-list 'ac-modes 'latex-mode) ; make auto-complete aware of {{{latex-mode}}}
(defun ac-latex-mode-setup ()       ; add ac-sources to default ac-sources
  (setq ac-sources
     (append '(ac-source-yasnippet ac-source-math-latex ac-source-latex-commands)
           ac-sources)))
(add-hook 'LaTeX-mode-hook 'ac-latex-mode-setup)
(ac-flyspell-workaround)

;; (require 'ac-math)
;; (add-to-list 'ac-modes 'latex-mode)   ; make auto-complete aware of `latex-mode`

;; (defun ac-LaTeX-mode-setup () ; add ac-sources to default ac-sources
;;   (setq ac-sources
;;     (append '(ac-source-math-unicode ac-source-math-latex ac-source-latex-commands)
;;               ac-sources))
;; )

;; (add-hook 'LaTeX-mode-hook 'ac-LaTeX-mode-setup)

;; Don't hightlight quite so much
;; http://tex.stackexchange.com/a/120755
(eval-after-load "font-latex"
  '(font-latex-add-keywords '(("newenvironment" "*{[[")
                  ("renewenvironment" "*{[[")
                  ("newcommand" "*|[[")
                  ("renewcommand" "*|{\\[[")
                  ("providecommand" "*|{\\[[")
                  ("fbox" "")
                  ("mbox" "")
                  ("sbox" "")
                  ("vspace" "")
                  ("hspace" "*")
                  ("usepackage" ""))
                'function))

;;; FLYMAKE -------------------------------------------------------------------

;; Flymake is enables in stats.el
(defun init-latex--flymake-setup ()
  "Setup flymake for latex using one of the checker available on the system.
It either tries \"lacheck\" or \"chktex\"."
  (interactive)
  (cond ;; ((executable-find "lacheck")
        ;;  (defun flymake-get-tex-args (file-name)
        ;;    (list "lacheck" (list file-name))))
        ((executable-find "chktex")
         (defun flymake-get-tex-args (file-name)
           (list "chktex" (list "-q" "-v0" file-name))))
        (t nil)))

(eval-after-load "flymake" '(init-latex--flymake-setup))

(defun my-flymake-show-help ()
  (when (get-char-property (point) 'flymake-overlay)
     (let ((help (get-char-property (point) 'help-echo)))
       (if help (message "%s" help)))))

(add-hook 'post-command-hook 'my-flymake-show-help)
(add-hook 'TeX-mode-hook 'flymake-mode)
