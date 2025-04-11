
(use-package evil
  :ensure t
  :init
  (setq evil-want-keybinding nil)
  (evil-mode)
  (setq evil-default-state 'emacs)

  ;; enable Emacs keys in Insert State/Mode
  (setcdr evil-insert-state-map nil)
  (define-key evil-insert-state-map [escape] 'evil-normal-state)

  ;; switch between buffers
  (define-key evil-normal-state-map (kbd "[ b") 'previous-buffer)
  (define-key evil-normal-state-map (kbd "] b") 'next-buffer)
  (define-key evil-motion-state-map (kbd "[ b") 'previous-buffer)
  (define-key evil-motion-state-map (kbd "] b") 'next-buffer)
  
  ;; dired
  (evil-define-key 'normal dired-mode-map
  (kbd "<RET>") 'dired-find-alternate-file
  (kbd "C-k") 'dired-up-directory
  "`" 'dired-open-term
  "q" 'quit-window
  "o" 'dired-find-file-other-window
  ")" 'dired-omit-mode)

  ;; RET - follow links in org-mode
  (with-eval-after-load 'evil-maps
    (define-key evil-motion-state-map (kbd "RET") nil))
  )

(use-package undo-tree
  :diminish
  :init
  (global-undo-tree-mode 1)
  (setq undo-tree-auto-save-history nil)
  (evil-set-undo-system 'undo-tree))


;; Keybindings
(define-key evil-normal-state-map "u" nil)
(define-key evil-visual-state-map "u" nil)
(define-key evil-normal-state-map "i" nil)
(define-key evil-normal-state-map "I" nil)
(define-key evil-visual-state-map "i" nil)
(define-key evil-visual-state-map "I" nil)
(define-key evil-motion-state-map "n" 'evil-backward-char)
(define-key evil-motion-state-map "N" 'evil-beginning-of-line)
(define-key evil-motion-state-map "i" 'evil-forward-char)
(define-key evil-motion-state-map "I" 'evil-end-of-line)
(define-key evil-motion-state-map "e" 'evil-next-line)
(define-key evil-motion-state-map "u" 'evil-previous-line)
(define-key evil-motion-state-map "l" 'evil-undo)
(define-key evil-motion-state-map "k" 'evil-insert)

(define-key evil-motion-state-map "U" (lambda () (interactive) (evil-previous-line 5)))
(define-key evil-motion-state-map "E" (lambda () (interactive) (evil-next-line 5)))


(provide 'init-evil)
