;; AucTeX
(setq TeX-auto-save t)
(setq TeX-parse-self t)

(setq-default TeX-master nil)
;(add-hook 'LaTeX-mode-hook 'visual-line-mode)
;(add-hook 'LaTeX-mode-hook 'flyspell-mode)
;(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(setq TeX-PDF-mode t)

;; Use Skim as viewer, enable source <-> PDF sync
;; make latexmk available via C-c C-c
;; Note: SyncTeX is setup via ~/.latexmkrc (see below)
(add-hook 'LaTeX-mode-hook (lambda ()
 (push
    '("latexmk" "latexmk -pdf %s" TeX-run-TeX nil t
      :help "Run latexmk on file")
    TeX-command-list)))

(add-hook 'TeX-mode-hook '(lambda () (setq TeX-command-default "latexmk")))


;; use Skim as default pdf viewer
;; Skim's displayline is used for forward search (from .tex to .pdf)
;; option -b highlights the current line; option -g opens Skim in the background
(setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
(setq TeX-view-program-list
  '(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))

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
     (append '(ac-source-math-latex ac-source-latex-commands)
           ac-sources)))
;(add-hook 'LaTeX-mode-hook 'ac-latex-mode-setup)
(ac-flyspell-workaround)


;; (require 'ac-math)
;; (add-to-list 'ac-modes 'latex-mode)   ; make auto-complete aware of `latex-mode`

;; (defun ac-LaTeX-mode-setup () ; add ac-sources to default ac-sources
;;   (setq ac-sources
;;     (append '(ac-source-math-unicode ac-source-math-latex ac-source-latex-commands)
;;               ac-sources))
;; )

;; (add-hook 'LaTeX-mode-hook 'ac-LaTeX-mode-setup)

(add-hook 'TeX-mode-hook 'visual-line-mode)
(add-hook 'Tex-mode-hook (lambda () (fci-mode)))
