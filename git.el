(use-package git-gutter
  :diminish git-gutter-mode
  :defer 2
  :init
  (setq git-gutter:modified-sign "~ "
        git-gutter:added-sign "+ "
        git-gutter:deleted-sign "-")

  :config
  (global-git-gutter-mode t)

  (set-face-foreground 'git-gutter:modified "orange")
  (set-face-foreground 'git-gutter:added "green")
  (set-face-foreground 'git-gutter:deleted "red")
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
                      :background "green"
                      :foreground nil)
  (set-face-attribute 'diff-removed nil
                      :background "red"
                      :foreground nil)
  (set-face-attribute 'diff-refine-added nil
                      :background nil
                      :foreground "#00af00")
  (set-face-attribute 'diff-refine-changed nil
                      :background "#444444")
  (set-face-attribute 'diff-refine-removed nil
                      :foreground "#ff5f00"
                      :background nil)
  (set-face-attribute 'magit-diff-removed nil
                      :foreground "#d70000"
                      :background nil)
  (set-face-attribute 'magit-diff-added nil
                      :background nil
                      :foreground "#44cc44")
  (set-face-attribute 'magit-diff-removed-highlight nil
                      :background nil
                      :foreground "red")
  (set-face-attribute 'magit-diff-added-highlight nil
                      :background nil
                      :foreground "green")
  (set-face-attribute 'magit-diff-context-highlight nil
                      :background nil)

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
