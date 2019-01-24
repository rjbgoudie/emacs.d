(setq package-enable-at-startup nil)
(setq use-package-verbose t
      use-package-always-ensure t
      package--init-file-ensured t)
(require 'package)

(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")
        ("melpa" . "http://melpa.milkbox.net/packages/")))

(setq package-pinned-packages
      '((ess . "melpa-stable")
        (auctex . "gnu")
        (magit . "melpa-stable")
        (yasnippet . "melpa-stable")
        (flymake . "gnu")
        (auto-complete . "melpa-stable")
        (ac-math . "melpa")
        (git-gutter . "melpa")
        (fill-column-indicator . "melpa-stable")
        (phi-search . "melpa")
        (r-autoyas . "melpa-stable")
        (project-explorer . "melpa-stable")
        (adaptive-wrap . "gnu")
        (ace-window . "melpa-stable")
        (aggressive-indent . "melpa-stable")
        (smartparens . "melpa-stable")
        (ack . "gnu")
        (beacon . "melpa-stable")
        (projectile . "melpa")
        (use-package . "melpa")))

(package-initialize)

(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)
(use-package auto-compile
  :config
  (auto-compile-on-load-mode))
