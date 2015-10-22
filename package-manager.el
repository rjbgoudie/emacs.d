(require 'package)
(setq package-enable-at-startup nil)

(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
	("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")
	("melpa" . "http://melpa.milkbox.net/packages/")))

(setq package-pinned-packages
      '((ess . "melpa")
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
        (smartparens . "melpa-stable")))

(package-initialize)

;; (package-refresh-contents)

(defun install-required-packages (package-list)
  (dolist (package package-list)
    (unless (package-installed-p package)
      (package-install package))))

(install-required-packages '(ess
			     auctex
			     magit
			     yasnippet
			     flymake
			     auto-complete
			     ac-math
			     git-gutter
			     fill-column-indicator
			     phi-search
			     r-autoyas
			     project-explorer
			     adaptive-wrap
			     auto-complete-auctex
			     ace-window
			     aggressive-indent
			     smartparens))
