(use-package ido
  :defer 1
  :init
  (ido-mode 1)
  (ido-everywhere 1)

  :config
  (setq ido-enable-prefix nil
        ido-enable-flex-matching t
        ido-create-new-buffer 'always
        ido-max-prospects 10)
  )

(use-package projectile
  :ensure t
  :config
  (projectile-global-mode)
  (setq projectile-enable-caching t))

;; Save a list of recent files visited.
(recentf-mode 1)

;; Yes or No alias
;; http://www.emacswiki.org/emacs/YesOrNoP
(defalias 'yes-or-no-p 'y-or-n-p)
