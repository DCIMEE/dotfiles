
;; -*- lexical-binding: t -*-

(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'init-default)

(require 'init-packages)

(require 'init-ui)

(require 'init-org)


(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)

