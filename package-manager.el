(require 'package)
(setq package-enable-at-startup nil)
(package-initialize)

(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
  (unless (package-installed-p 'package-filter)
  (progn
    (switch-to-buffer
     (url-retrieve-synchronously
      "https://raw.github.com/milkypostman/package-filter/master/package-filter.el"))
    (package-install-from-buffer (package-buffer-info) 'single)))
  (require 'package-filter))

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))

;; (package-refresh-contents)

;; I have not set-up exclusion lists for emacs 24 yet
(when (< emacs-major-version 24)
  (add-to-list 'package-archives
               '("marmalade" . "http://marmalade-repo.org/packages/"))
  ; ac-math is not on marmalade
  (setq package-archive-exclude-alist '(("melpa"
                                         auto-complete
                                         auctex
                                         color-theme
                                         magit
                                         git-gutter
                                         yasnippet
                                         fill-column-indicator
                                         flymake
                                         autopair
                                         r-autoyas
                                         buffer-move))))

(when (> emacs-major-version 23)
  (add-to-list 'package-archives
               '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)
  ;; (setq package-pinned-packages '((auto-complete . "marmalade")
  ;;                                 (auctex . "marmalade")
  ;;                                 (color-theme . "marmalade")
  ;;                                 (magit . "marmalade")
  ;;                                 (git-gutter . "marmalade")
  ;;                                 (yasnippet . "marmalade")
  ;;                                 (fill-column-indicator . "marmalade")
  ;;                                 (flymake . "marmalade")
  ;;                                 (autopair . "marmalade")
  ;;                                 (r-autoyas . "marmalade")
  ;;                                 (buffer-move . "marmalade"))
  )

(defvar my-packages '(auto-complete
                      ess
                      ac-math
                      auctex
                      color-theme
                      magit
                      git-gutter
                      yasnippet
                      fill-column-indicator
                      flymake
                      autopair
                      multiple-cursors
                      phi-search
                      r-autoyas
                      buffer-move)
  "A list of packages to ensure are installed at launch.")

(defvar my-24-packages '(project-explorer
                         adaptive-wrap
                         auto-complete-auctex
                         ace-window))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; Additional emacs 24 packages
(when (>= emacs-major-version 24)
  (dolist (p my-24-packages)
  (when (not (package-installed-p p))
    (package-install p))))
