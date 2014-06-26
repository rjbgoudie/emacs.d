(require 'package)
(package-initialize)

(unless (package-installed-p 'package-filter)
  (progn
    (switch-to-buffer
     (url-retrieve-synchronously
      "https://raw.github.com/milkypostman/package-filter/master/package-filter.el"))
    (package-install-from-buffer (package-buffer-info) 'single)))
(require 'package-filter)

(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))
;; (add-to-list 'package-archives
;;              '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)

;; (package-refresh-contents)

; ac-math is not on marmalade
(setq package-archive-exclude-alist '(("melpa" auto-complete ess auctex color-theme magit git-gutter yasnippet fill-column-indicator flymake autopair)))

(defvar my-packages '(auto-complete ess ac-math auctex color-theme magit git-gutter yasnippet fill-column-indicator flymake autopair)
  "A list of packages to ensure are installed at launch.")

;; Additional emacs 24 packages
(when (>= emacs-major-version 24)
  (add-to-list 'my-packages '(project-explorer)))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))
