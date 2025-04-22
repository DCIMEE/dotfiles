
(require 'org-tempo)

;; Set faces for heading levels
(dolist (face '((org-level-1 . 1.2)
                (org-level-2 . 1.1)
                (org-level-3 . 1.05)
                (org-level-4 . 1.0)
                (org-level-5 . 1.1)
                (org-level-6 . 1.1)
                (org-level-7 . 1.1)
                (org-level-8 . 1.1)))
  (set-face-attribute (car face) nil :font "JetBrainsMono NFM" :weight 'regular :height (cdr face)))	;; `JetBrainsMono Nerd Font Mono`


;; Ensure that anything that should be fixed-pitch in Org files appears that way
(set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
(set-face-attribute 'org-code nil   :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-table nil   :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
(set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
(set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch)

(defun org-mode-setup ()
  (org-indent-mode)
  (variable-pitch-mode 1)
  (visual-line-mode 1))

(use-package org
  :commands (org-capture org-agenda)
  :hook (org-mode . org-mode-setup)
  :init
  (setq org-hide-emphasis-markers t)
  (setq org-catch-invisible-edits 'show-and-error)
  ;; org agenda
  ;; C-c C-s schedule
  ;; C-c C-d deadline
  (global-set-key (kbd "C-c a") 'org-agenda)
  (setq org-agenda-files '("~/gtd.org"))
  (setq org-agenda-span 'day)

  (setq org-agenda-start-with-log-mode t)
  (setq org-log-done 'time)
  (setq org-log-into-drawer t)

  (setq org-agenda-custom-commands
        '(("c" "Top Priority (A)"
           ((tags-todo "+PRIORITY=\"A\"")))
          ;; ...other commands here
          ))


  ;; org capture
  (setq org-capture-templates
        '(("t" "Todo" entry (file+headline "~/gtd.org" "Workspace")
           "* TODO [#B] %?\n  %i\n %U"
           :empty-lines 1)))
  (global-set-key (kbd "C-c r") 'org-capture)

  
  ;; Replace list hyphen with dot
  (font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

  ;; (setq org-todo-keywords
  ;;    '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!)")
  ;;      (sequence "BACKLOG(b)" "PLAN(p)" "READY(r)" "ACTIVE(a)" "REVIEW(v)" "WAIT(w@/!)" "HOLD(h)" "|" "COMPLETED(c)" "CANC(k@)")))
  )


(provide 'init-org)
