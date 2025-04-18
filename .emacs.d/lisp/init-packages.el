
;; -*- lexical-binding: t -*-

;; Initialize package sources
(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("nongnu" . "https://elpa.nongnu.org/nongnu/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")))
(package-initialize)

;; optimization
(when (not package-archive-contents)
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package-ensure)
(setq use-package-always-ensure t)


;; ================================


;; (use-package gruvbox-theme
;;  :init (load-theme 'gruvbox-dark-hard t))


(use-package ido-completing-read+
  :config (ido-ubiquitous-mode 1))


(use-package corfu
  :custom
  (corfu-auto t)
  (corfu-cycle t)
  (corfu-quit-at-boundary 'separator)
  (corfu-quit-no-match 'separator)
  (corfu-preview-current nil)
  (corfu-on-exact-match nil)
  (corfu-auto-prefix 2)
  (corfu-auto-delay 0)
  :bind (:map corfu-map
              ("C-n"      . corfu-next)
              ("C-p"      . corfu-previous)
              ("C-y"      . corfu-send)
              ("M-SPC"    . corfu-insert-separator)
              ("<escape>" . corfu-quit)
              ("<return>" . electric-indent-just-newline))
  :config
  (add-hook 'eshell-mode-hook (lambda () (define-key corfu-map (kbd "<return>") 'eshell-send-input)))
  (add-hook 'shell-mode-hook (lambda () (define-key corfu-map (kbd "<return>") 'eshell-send-input)))
  :init (global-corfu-mode))


(use-package which-key
  :defer 0
  :diminish which-key-mode
  :config
  (which-key-mode)
  (setq which-key-idle-delay 0.15))


(use-package dired
  :commands (dired dired-jump)
  :init
  (setq delete-by-moving-to-trash t)
  (put 'dired-find-alternate-file 'disabled nil) ; disables warning
  :ensure nil
  :commands (dired dired-jump)
  :bind (("C-x C-j" . dired-jump))
  :custom ((dired-listing-switches "-agho --group-directories-first"))
  :config
  ;; Make dired open in the same window when using RET or ^
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file) ; was dired-advertised-find-file
  (define-key dired-mode-map (kbd "^") (lambda () (interactive) (find-alternate-file "..")))  ; was dired-up-directory
  (define-key dired-mode-map (kbd "[") (lambda () (interactive) (find-alternate-file ".."))))  ; was dired-up-directory


;; end
(provide 'init-packages)
