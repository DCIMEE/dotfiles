
;; bind <f2> to open-init-file function
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f2>") 'open-init-file)

;; disable backup files generation
(setq make-backup-files nil)

;; mouse control
(setq mouse-wheel-scroll-amount '(3 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

;; ido mode
(ido-mode 1)
(ido-everywhere 1)

;; use space for indent instead of tab
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
;; <TAB> instead of <C-q Tab>
(setq indent-line-function 'insert-tab)
(setq tab-always-indent 'complete)
;; auto pair parenthesis
(electric-pair-mode -1)
(delete-selection-mode 1)

(setq-default cursor-type 'box)
(show-paren-mode t)

;; recentf-open-files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

;; save hisotry of entries entered in minibuffer prompts
(setq history-length 25)
(savehist-mode 1)

;; save cursor location of opened files
(save-place-mode 1)

;; revert buffers when the underlying file has changed
(global-auto-revert-mode 1)
;; revert Dired and other buffers
(setq global-auto-revert-non-file-buffers t)

;; preserve screen position
(custom-set-variables
 '(scroll-conservatively 1000)
 '(scroll-margin 3)
 )

(setq ring-bell-function 'ignore)
;; y & n for yes & no
(fset 'yes-or-no-p 'y-or-n-p)

;; duplicate current line
(defun rc/duplicate-line ()
  "Duplicate current line"
  (interactive)
  (let ((column (- (point) (point-at-bol)))
        (line (let ((s (thing-at-point 'line t)))
                (if s (string-remove-suffix "\n" s) ""))))
    (move-end-of-line 1)
    (newline)
    (insert line)
    (move-beginning-of-line 1)
    (forward-char column)))

(global-set-key (kbd "C-,") 'rc/duplicate-line)


;; end
(provide 'init-default)
