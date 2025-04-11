
;; disable welcome page
(setq inhibit-startup-message t)
;; (setq visible-bell t)
;; (load-theme 'tango-dark t)

;; (package-install 'gruvbox-theme)
(load-theme 'gruvbox-dark-hard t)
;; (add-to-list 'default-frame-alist '(font . "Consolas" ))

(add-to-list 'default-frame-alist '(font . "JetBrainsMono Nerd Font Mono" ))

;; set seperate font for english and cjk
(when (eq system-type 'windows-nt)
  (set-face-attribute 'default nil :font (font-spec :family "JetBrainsMono NFM" :size 18))
  (set-fontset-font t 'unicode (font-spec :family "Segoe UI Emoji"))
  (set-fontset-font t '(#x2ff0 . #x9ffc) (font-spec :family "LXGW Wenkai" :size 22 :weight 'regular)))

;; (when (eq system-type 'gnu/linux)
;;   (set-face-attribute 'default nil :font (font-spec :family "JetBrainsMono Nerd Font Mono" :size 18))
;;   (set-fontset-font t 'unicode (font-spec :family "Noto Color Emoji" :size 14))
;; 	(set-fontset-font t '(#x2ff0 . #x9ffc) (font-spec :family "LXGW Wenkai" :size 22 :weight 'regular)))


;; turn off some UI elements
(menu-bar-mode -1)
(tool-bar-mode -1)
;; (scroll-bar-mode -1)
(setq use-dialog-box nil)

;; line numbers
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)
;; coloriezd current line (Emacs v29?) 
(set-face-attribute 'line-number-current-line nil 
                    :foreground "#FF9E3B"
                    :weight 'bold)


;; end of file
(provide 'init-ui)
