
(require 'org-tempo)

;; disable pair parenthesis
(setq electric-pair-inhibit-predicate
      `(lambda (c)
         (if (char-equal c ?\<) t (,electric-pair-inhibit-predicate c))))

(add-hook 'org-mode-hook
          (lambda ()
            (setq-local electric-pair-inhibit-predicate
                        `(lambda (c)
                           (if (char-equal c ?\<) t (,electric-pair-inhibit-predicate c))))))


;; todo keywords
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "STARTED(s)" "|" "DONE(d!/!)")
              (sequence "WAITING(w@/!)" "SOMEDAY(S)" "|" "CANCELLED(c@/!)" "MEETING(m)" "PHONE(p)"))))


;; org agenda
;; C-c C-s schedule
;; C-c C-d deadline
(global-set-key (kbd "C-c a") 'org-agenda)
(setq org-agenda-files '("~/gtd.org"))
(setq org-agenda-span 'day)

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


(provide 'init-org)
