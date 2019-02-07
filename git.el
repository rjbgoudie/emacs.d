(use-package git-gutter
  :diminish git-gutter-mode
  :defer 2
  :init
  (setq git-gutter:modified-sign "~"
        git-gutter:added-sign "+"
        git-gutter:deleted-sign "—")

  :config
  (global-git-gutter-mode t)
  (custom-set-variables
   '(git-gutter:separator-sign " "))
  (set-face-attribute 'git-gutter:separator nil
                      :background nil)

  (set-face-attribute 'git-gutter:modified nil
                      :background colorblind-orange
                      :foreground colorblind-darkorange)
  (set-face-attribute 'git-gutter:added nil
                      :background colorblind-green
                      :foreground colorblind-darkgreen)
  (set-face-attribute 'git-gutter:deleted nil
                      :background colorblind-darkred
                      :foreground colorblind-red)
  )

(use-package magit
  :bind ("C-x g" . magit-status)
  :init
  (setq magit-last-seen-setup-instructions "1.4.0"

        ;; Word-differences in magit diffs
        magit-diff-refine-hunk 'all

        ;; Needed to highlight whitespace changes
        ;; https://github.com/magit/magit/issues/1689
        smerge-refine-ignore-whitespace nil)

  :config
  (set-face-attribute 'diff-added nil
                      :background colorblind-darkgreen
                      :foreground nil)
  (set-face-attribute 'diff-removed nil
                      :background colorblind-darkred
                      :foreground nil)
  (set-face-attribute 'diff-refine-added nil
                      :background nil
                      :foreground colorblind-brightgreen)
  (set-face-attribute 'diff-refine-changed nil
                      :background colorblind-darkgray)
  (set-face-attribute 'diff-refine-removed nil
                      :foreground colorblind-brightred
                      :background nil)
  (set-face-attribute 'magit-diff-removed nil
                      :foreground colorblind-darkred
                      :background nil)
  (set-face-attribute 'magit-diff-added nil
                      :background nil
                      :foreground colorblind-green)
  (set-face-attribute 'magit-diff-removed-highlight nil
                      :background colorblind-darkblue
                      :foreground colorblind-red)
  (set-face-attribute 'magit-diff-added-highlight nil
                      :background colorblind-darkblue
                      :foreground colorblind-green)
  (set-face-attribute 'magit-diff-context-highlight nil
                      :background colorblind-darkblue)
  (set-face-attribute 'magit-diff-whitespace-warning nil
                      :background colorblind-red
                      :foreground "white")

  ;; MAGIT LINE WRAPPING
  ;; https://gnu.org/software/emacs/manual/html_node/emacs/Visual-Line-Mode.html
  ;; http://stackoverflow.com/a/7398351
  ;; https://groups.google.com/forum/#!topic/gnu.emacs.help/e8dfr2cYPTg
  ;; Disable fci-mode, since it seems to prevent visual-line-mode from working
  (add-hook 'magit-mode-hook
            (lambda ()
              (fci-mode 0)
              (visual-line-mode)
              ))
  )
