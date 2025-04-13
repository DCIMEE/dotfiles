
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

;; (package-install 'use-package)
;; Setup `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package-ensure)
(setq use-package-always-ensure t)
;; ================================

;; (package-install 'gruvbox-theme)
(use-package gruvbox-theme)

(use-package ido-completing-read+)
(ido-ubiquitous-mode 1)

;; Package 'company
(use-package company)
(global-company-mode 1)
(setq company-minimum-prefix-length 1)
(setq company-idle-delay 0)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
;; (define-key company-mode-map (kbd "C-p") 'company-select-previous / nil)
;; (define-key company-active-map (kbd "<TAB>") nil) ;; company-complete-common
;; (define-key company-active-map (kbd "<return>") nil) ;; company-complete-selection
(define-key company-active-map (kbd "C-y") #'company-complete-selection)
(define-key company-active-map (kbd "<return>") 'electric-indent-just-newline)

;; <RET> actions in eshell
;; (add-hook 'eshell-mode-hook (lambda () (company-mode -1)))
;; (remove-hook 'eshell-mode-hook (lambda () (company-mode -1)))
(add-hook 'eshell-mode-hook (lambda ()
                              (define-key company-active-map (kbd "<return>") 'eshell-send-input)))


;; which-key
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.15))


;; end
(provide 'init-packages)
