;;; R-AUTOYAS
;; https://github.com/mlf176f2/r-autoyas.el
;; (require 'r-autoyas)
;; (add-hook 'ess-mode-hook 'r-autoyas-ess-activate)

;;; BUGS
;; (require 'ess-bugs-d)
;; (use-package ess-bugs-d
;;   :ensure ess)

(defun my-ess-hook-config ()
  (setq ac-sources
        (append '(ac-source-R
                  ac-source-filename
                  ac-source-words-in-buffer
                  ac-source-files-in-current-dir)
                ac-sources))
  (set-fill-column 80)
  (auto-fill-mode)
  ;; http://stackoverflow.com/a/7502689
  (add-hook 'local-write-file-hooks
            (lambda ()
              (ess-nuke-trailing-whitespace)))
  )

(use-package r-mode
  :mode ("\\.[rR]\\'" . R-mode)
  :commands R
  :ensure ess
  :init
  (setq ess-toggle-underscore nil
        ess-eval-visibly-p 'nowait
        ess-ask-for-ess-directory nil
        ess-local-process-name "R"
        inferior-R-args "--no-save "
        ess-roxy-str "#'"
        ess-default-style 'RStudio
        ess-fancy-comments nil
        inferior-S-prompt "[]\:~/[:space:]a-zA-Z0-9.[]*\\(?:[>+.] \\)*R> "

        ;; https://stat.ethz.ch/pipermail/ess-help/
        ;; attachments/20110606/262ab5f7/attachment.pl
        comint-scroll-to-bottom-on-input t
        comint-scroll-to-bottom-on-output t
        comint-move-point-for-output t
        comint-scroll-show-maximum-output t

        ;; http://ess.r-project.org/Manual/ess.html#index-ess_002dsmart_002dcomma
        ess-R-smart-operators t

        ;; http://stackoverflow.com/a/7502689
        ess-nuke-trailing-whitespace-p 'ask)

  :config
  (add-hook 'ess-mode-hook 'my-ess-hook-config)
  (add-hook 'ess-post-run-hook 'my-ess-hook-config)
  (add-hook 'ess-R-post-run-hook 'ess-execute-screen-options)

  ;; THEME SETTINGS
  (setq ess-R-font-lock-keywords '((ess-R-fl-keyword:modifiers . t)
                                   (ess-R-fl-keyword:fun-defs . f)
                                   (ess-R-fl-keyword:keywords . t)
                                   (ess-R-fl-keyword:assign-ops . t)
                                   (ess-R-fl-keyword:constants . t)
                                   (ess-fl-keyword:fun-calls . t)
                                   (ess-fl-keyword:numbers . t)
                                   (ess-fl-keyword:operators . t)
                                   (ess-fl-keyword:delimiters . t)
                                   (ess-fl-keyword:= . t)
                                   (ess-R-fl-keyword:F&T . t)))

  ;; ESS SETTINGS
  ;; Unless is to cover emacs 23.1 on BSU's HPC, which does not like this for
  ;; some reason
  (unless (and (<= emacs-major-version 23) (<= emacs-minor-version 1))
    (set-face-attribute 'ess-function-call-face
                        nil
                        :foreground "#00ffff"
                        :weight 'normal
                        :inverse-video nil))
  )
