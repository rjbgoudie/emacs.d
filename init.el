(menu-bar-mode -1)

;; https://github.com/technomancy/emacs-starter-kit/blob/master/init.el#L20
(setq dotfiles-dir (file-name-directory
                   (or (buffer-file-name) load-file-name)))

;; Don't clutter up directories with files~
;; http://stackoverflow.com/a/2020954
(setq backup-directory-alist `(("." . ,(expand-file-name
                                    (concat dotfiles-dir "backups")))))

;; Don't clutter with #files either
;; http://stackoverflow.com/a/2020954
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name (concat dotfiles-dir "backups")))))

(load "~/.dotfiles/emacs.d/package-manager.el")
(load "~/.dotfiles/emacs.d/stats.el")
(load "~/.dotfiles/emacs.d/git.el")
(load "~/.dotfiles/emacs.d/theme.el")
(load "~/.dotfiles/emacs.d/text.el")
