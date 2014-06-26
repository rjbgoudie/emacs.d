;; FONT
(add-hook 'after-make-frame-functions
          (lambda (frame)
            (modify-frame-parameters
             frame
             '((font . "-*-Consolas-*-*-*-*-13-*-*-*-*-*-*")))))

;; MODE-LINE
;; Set the colour of the mode-line, and its activated highlight colour
;; http://stackoverflow.com/a/9448316
(set-face-attribute  'mode-line
                 nil
                 :foreground "black"
                 :background "darkorange"
                 :box '(:line-width 1 :style released-button))
(set-face-attribute  'mode-line-inactive
                 nil
                 :foreground "white"
                 :background "gray25"
                 :box '(:line-width 1 :style released-button))


;; BASICS
(set-face-attribute 'region
  nil
  :background "#5f005f"
  :foreground nil)

(set-face-foreground 'font-lock-variable-name-face "brightcyan")
(set-face-foreground 'font-lock-comment-face "brightyellow")
(set-face-foreground 'font-lock-string-face "#00ff00")
(set-face-foreground 'font-lock-keyword-face "#ff9900")
(set-face-foreground 'font-lock-constant-face "#f0f0f0")
(set-face-foreground 'font-lock-builtin-face "brightblue")

(set-face-attribute 'font-lock-function-name-face
  nil
  :foreground "#00ffff"
  :weight 'bold
  :inverse-video t)

;; HIGHLIGHT CURRENT LINE
(set-face-attribute 'hl-line
  nil
  :background "brightblack"
  :foreground nil
  :inherit t)

(set-face-attribute 'highlight
  nil
  :background "brightblack"
  :inherit t
  :foreground nil)

;; PARENTHESES MATCHING
(set-face-attribute 'show-paren-match
  nil
  :background "brightmagenta"
  :inherit t
  :foreground "brightwhite")

;; ESS SETTINGS
(set-face-attribute 'ess-function-call-face
  nil
  :foreground "#00ffff"
  :weight 'normal
  :inverse-video nil)

;; FLAYMAKE
(set-face-attribute 'flymake-errline
  nil
  :background "brightred"
  :foreground "brightwhite")

;; MAGIT SETTINGS
;; http://readystate4.com/2011/02/22/emacs-changing-magits-default-diff-colors
(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green")
     (set-face-foreground 'magit-diff-del "red")
     (set-face-foreground 'diff-refine-change "blue")
     (set-face-background 'diff-refine-change "brightblack")
     (set-face-background 'magit-diff-add "black")
     (set-face-background 'magit-diff-del "black")
     (when (not window-system)
       (set-face-background 'magit-item-highlight "black"))



;; (set-face-attribute 'diff-changed
;;   nil
;;   :background "#A0522D")
;; (set-face-attribute 'diff-added
;;   nil
;;   :foreground "#00BFFF" :background nil)
;; (set-face-attribute 'diff-removed
;;   nil
;;   :foreground "#FF6A6A" :background nil)
;; (set-face-attribute 'diff-hunk-header-face
;;   nil
;;   :foreground "#8B4513"
;;                              :background "#FFFFFF"
;;                              :weight     extra-bold
;;                              :underline  t
;;                              :inherit    nil)
;; (eval-after-load 'magit
;;    '(progn

;; (set-face-attribute 'diff-refine-change
;;   nil
;;   :background "#A0522D")
;; (set-face-attribute 'diff-refine-added
;;   nil
;;   :inherit 'diff-refine-change
;;   :background "#000080"
;;   :foreground "#FFFFFF")

;; (set-face-attribute 'diff-refine-removed
;;   nil
;;   :inherit 'diff-refine-change
;;   :background "#Ff0000"
;;   :foreground "#000000")
;; ))


;; (defface diff-refine-change-add
;;   '((t :background "#003300" :foreground "green"))
;;   "Face used for char-based changes shown by `diff-refine-hunk'."
;;   :group 'diff-mode)
 
;; (defface diff-refine-change-del
;;   '((t :background "#330000" :foreground "red"))
;;   "Face used for char-based changes shown by `diff-refine-hunk'."
;;   :group 'diff-mode)
 
;; (custom-set-faces
;;  '(magit-diff-add ((t (:background "#ddffdd" :foreground "green"))))
;;  '(magit-diff-del ((t (:background "#ffdddd" :foreground "red")))))
 
;; (defun jsj-smerge-refine-subst (beg1 end1 beg2 end2 props-add props-del &optional preproc)
;;   "Show fine differences in the two regions BEG1..END1 and BEG2..END2.
;; PROPS is an alist of properties to put (via overlays) on the changes.
;; If non-nil, PREPROC is called with no argument in a buffer that contains
;; a copy of a region, just before preparing it to for `diff'.  It can be
;; used to replace chars to try and eliminate some spurious differences."
;;   (let* ((buf (current-buffer))
;;          (pos (point))
;;          deactivate-mark  ; The code does not modify any visible buffer.
;;          (file1 (make-temp-file "diff1"))
;;          (file2 (make-temp-file "diff2")))
;;     ;; Chop up regions into smaller elements and save into files.
;;     (smerge-refine-chopup-region beg1 end1 file1 preproc)
;;     (smerge-refine-chopup-region beg2 end2 file2 preproc)
 
;;     ;; Call diff on those files.
;;     (unwind-protect
;;         (with-temp-buffer
;;           (let ((coding-system-for-read 'emacs-mule))
;;             (call-process diff-command nil t nil
;;                           (if (and smerge-refine-ignore-whitespace
;;                                    (not smerge-refine-weight-hack))
;;                               ;; Pass -a so diff treats it as a text file even
;;                               ;; if it contains \0 and such.
;;                               ;; Pass -d so as to get the smallest change, but
;;                               ;; also and more importantly because otherwise it
;;                               ;; may happen that diff doesn't behave like
;;                               ;; smerge-refine-weight-hack expects it to.
;;                               ;; See http://thread.gmane.org/gmane.emacs.devel/82685.
;;                               "-awd" "-ad")
;;                           file1 file2))
;;           ;; Process diff's output.
;;           (goto-char (point-min))
;;           (let ((last1 nil)
;;                 (last2 nil))
;;             (while (not (eobp))
;;               (if (not (looking-at "\\([0-9]+\\)\\(?:,\\([0-9]+\\)\\)?\\([acd]\\)\\([0-9]+\\)\\(?:,\\([0-9]+\\)\\)?$"))
;;                   (error "Unexpected patch hunk header: %s"
;;                          (buffer-substring (point) (line-end-position))))
;;               (let ((op (char-after (match-beginning 3)))
;;                     (m1 (match-string 1))
;;                     (m2 (match-string 2))
;;                     (m4 (match-string 4))
;;                     (m5 (match-string 5)))
;;                 (when (memq op '(?d ?c))
;;                   (setq last1
;;                         (smerge-refine-highlight-change buf beg1 m1 m2 props-del)))
;;                 (when (memq op '(?a ?c))
;;                   (setq last2
;;                         (smerge-refine-highlight-change buf beg2 m4 m5 props-add))))
;;               (forward-line 1)          ;Skip hunk header.
;;               (and (re-search-forward "^[0-9]" nil 'move) ;Skip hunk body.
;;                    (goto-char (match-beginning 0))))
;;             ;; (assert (or (null last1) (< (overlay-start last1) end1)))
;;             ;; (assert (or (null last2) (< (overlay-start last2) end2)))
;;             (if smerge-refine-weight-hack
;;                 (progn
;;                   ;; (assert (or (null last1) (<= (overlay-end last1) end1)))
;;                   ;; (assert (or (null last2) (<= (overlay-end last2) end2)))
;;                   )
;;               ;; smerge-refine-forward-function when calling in chopup may
;;               ;; have stopped because it bumped into EOB whereas in
;;               ;; smerge-refine-weight-hack it may go a bit further.
;;               (if (and last1 (> (overlay-end last1) end1))
;;                   (move-overlay last1 (overlay-start last1) end1))
;;               (if (and last2 (> (overlay-end last2) end2))
;;                   (move-overlay last2 (overlay-start last2) end2))
;;               )))
;;       (goto-char pos)
;;       (delete-file file1)
;;       (delete-file file2))))
 
;; (defun diff-refine-hunk ()
;;   "Highlight changes of hunk at point at a finer granularity."
;;   (interactive)
;;   (require 'smerge-mode)
;;   (save-excursion
;;     (diff-beginning-of-hunk 'try-harder)
;;     (let* ((start (point))
;;            (style (diff-hunk-style))    ;Skips the hunk header as well.
;;            (beg (point))
;;            (props-add '((diff-mode . fine) (face diff-refine-change-add)))
;;            (props-del '((diff-mode . fine) (face diff-refine-change-del)))
;;            ;; Be careful to go back to `start' so diff-end-of-hunk gets
;;            ;; to read the hunk header's line info.
;;            (end (progn (goto-char start) (diff-end-of-hunk) (point))))
 
;;       (remove-overlays beg end 'diff-mode 'fine)
 
;;       (goto-char beg)
;;       (case style
;;         (unified
;;          (while (re-search-forward "^\\(?:-.*\n\\)+\\(\\)\\(?:\\+.*\n\\)+"
;;                                    end t)
;;            (jsj-smerge-refine-subst (match-beginning 0) (match-end 1)
;;                                     (match-end 1) (match-end 0)
;;                                     props-add props-del 'diff-refine-preproc)))
;;         (context
;;          (let* ((middle (save-excursion (re-search-forward "^---")))
;;                 (other middle))
;;            (while (re-search-forward "^\\(?:!.*\n\\)+" middle t)
;;              (jsj-smerge-refine-subst (match-beginning 0) (match-end 0)
;;                                       (save-excursion
;;                                         (goto-char other)
;;                                         (re-search-forward "^\\(?:!.*\n\\)+" end)
;;                                         (setq other (match-end 0))
;;                                         (match-beginning 0))
;;                                       other
;;                                       props-add props-del 'diff-refine-preproc))))
;;         (t ;; Normal diffs.
;;          (let ((beg1 (1+ (point))))
;;            (when (re-search-forward "^---.*\n" end t)
;;              ;; It's a combined add&remove, so there's something to do.
;;              (jsj-smerge-refine-subst beg1 (match-beginning 0)
;;                                       (match-end 0) end
;;                                       props-add props-del 'diff-refine-preproc))))))))
))
