(use-package tex-site
  :ensure auctex
  :mode ("\\.tex\\'" . latex-mode)
  :init
  ;; AucTeX
  (setq TeX-auto-save t
        TeX-parse-self t)

  ;; Assume that the current buffer is the master
  ;; https://www.gnu.org/software/auctex/manual/auctex/Multifile.html
  (setq-default TeX-master t)

  ;; Disable indentation
  (setq LaTeX-indent-level 0
        LaTeX-item-indent 0)

  ;; use Skim as default pdf viewer
  ;; Skim's displayline is used for forward search (from .tex to .pdf)
  ;; option -b highlights the current line; option -g opens Skim in the background
  (setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
  (setq TeX-view-program-list
        '(("PDF Viewer"
           "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))

  :config
  ;; Wrap text in LaTeX mode
  (add-hook 'LaTeX-mode-hook (lambda () (fci-mode 0)))
  (add-hook 'LaTeX-mode-hook 'visual-line-mode)
  (add-hook 'LaTeX-mode-hook 'adaptive-wrap-prefix-mode)

  ;; Turn on flyspell, which will use aspell if it is installed
  (add-hook 'LaTeX-mode-hook 'flyspell-mode)
  (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

  (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
  (setq reftex-use-fonts t
        reftex-highlight-selection 'both
        reftex-plug-into-AUCTeX t
        TeX-PDF-mode t)

  ;; Compiling using latexmk -------------------------------------------------
  ;; https://sites.google.com/site/andreaskiermeier/essmaterials
  (setq TeX-file-extensions
        '("Snw" "Rnw" "nw" "tex" "sty" "cls" "ltx" "texi" "texinfo"))

  (add-hook 'LaTeX-mode-hook
            (lambda ()
              (add-to-list 'TeX-command-list
                           '("latexmk" "latexmk -synctex=1 -pdf %(mode) %s"
                             TeX-run-TeX nil t :help "Run latexmk") t)
              (setq TeX-command-default "latexmk")
              (add-to-list 'LaTeX-indent-environment-list '("tikzpicture"))))

  ;; Auto-complete -----------------------------------------------------------
  ;; Auto-complete for AucTex
  ;; https://github.com/monsanto/auto-complete-auctex/blob/master/
  ;; auto-complete-auctex.el
  (when (> emacs-major-version 23)
    ;; (add-to-list 'load-path "~/.dotfiles/emacs.d/vendor/auto-complete-latex/")
    (use-package auto-complete-auctex)
    ;; (use-package auto-complete-latex)
    (use-package ac-math)
    (add-to-list 'ac-modes 'latex-mode) ; make auto-complete aware of {{{latex-mode}}}
    (defun ac-latex-mode-setup ()       ; add ac-sources to default ac-sources
      (setq ac-sources
            (append '(ac-source-yasnippet ac-source-math-latex ac-source-latex-commands)
                    ac-sources)))
    (add-hook 'LaTeX-mode-hook 'ac-latex-mode-setup)
    (ac-flyspell-workaround)
    )

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

  )
