
;; seperate customization file
;; auto add variables would be added to below files
(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)

;; disable welcome page
(setq inhibit-startup-message t)
(setq visible-bell t)
; (load-theme 'tango-dark t)
(load-theme 'gruvbox-dark-medium t)
;; (add-to-list 'default-frame-alist '(font . "Consolas" ))
(add-to-list 'default-frame-alist '(font . "JetBrainsMono Nerd Font Mono" ))


;; turn off some UI elements
;; (menu-bar-mode -1)
(tool-bar-mode -1)
;;(scroll-bar-mode -1)
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(setq use-dialog-box nil)

;; ido mode
(ido-mode 1)
(ido-everywhere 1)

;; line numbers
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)
;; coloriezd current line (Emacs v29?) 
(set-face-attribute 'line-number-current-line nil 
                    :foreground "#FF9E3B"
                    :weight 'bold)

;; use space for indent instead of tab
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
;; <TAB> instead of <C-q Tab>
(setq indent-line-function 'insert-tab)


;; Misc.
;; recentf-open-files
(recentf-mode 1)
;; save hisotry of entries entered in minibuffer prompts
;; M-n & M-p to navigate when using minibuffer <M-x>
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
