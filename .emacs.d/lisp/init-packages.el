
;; -*- lexical-binding: t -*-

;; Packages sources
;; (require 'package)
;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;; (add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))

(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("nongnu" . "https://elpa.nongnu.org/nongnu/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")))
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
;; (package-install 'company)
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

;; end of file
(provide 'init-packages)
