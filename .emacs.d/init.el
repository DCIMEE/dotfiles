
;; -*- lexical-binding: t -*-
(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'init-default)

(require 'init-packages)

(require 'init-ui)

(require 'init-org)

(require 'init-evil)

;; Powershell for eshell in windows
(when (eq system-type 'windows-nt)
  (require 'powershell))


;; seperate customization file
;; auto add variables would be added to below files
(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)
