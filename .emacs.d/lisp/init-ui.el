
;; disable welcome page
(setq inhibit-startup-message t)
;; (load-theme 'tango-dark t)
;; (package-install 'gruvbox-theme)
(load-theme 'gruvbox-dark-hard t)
(add-to-list 'default-frame-alist '(font . "JetBrainsMono Nerd Font Mono-15"))

;; (defun get-default-font ()
;;   (cond
;;    ((eq system-type 'windows-nt) "Consolas")
;;    ((eq system-type 'gnu/linux) "JetBrainsMono Nerd Font Mone-18")))


;; set seperate font for english and cjk
(when (eq system-type 'windows-nt)
(set-face-attribute 'default nil :font (font-spec :family "JetBrainsMono NFM" :size 18))
(set-fontset-font t 'unicode (font-spec :family "Segoe UI Emoji"))
(set-fontset-font t '(#x2ff0 . #x9ffc) (font-spec :family "LXGW Wenkai" :size 22 :weight 'regular)))

;; Set the fixed pitch face
(set-face-attribute 'fixed-pitch nil
                    :font "JetBrainsMono Nerd Font Mono"
                    :weight 'normal
                    :height 120)

;; Set the variable pitch face
(set-face-attribute 'variable-pitch nil
                    :font "DejaVu Serif"
                    :height 110
                    :weight 'normal)


;; turn off UI elements
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq use-dialog-box nil)

;; line numbers
(column-number-mode)
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)
;; coloriezd current line (Emacs v29?) 
(set-face-attribute 'line-number-current-line nil 
                    :foreground "#FF9E3B"
                    :weight 'bold)

;; disable line numbers for some modes
(dolist (mode '(;;org-mode-hook
                term-mode-hook
                shell-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))


;; end
(provide 'init-ui)
