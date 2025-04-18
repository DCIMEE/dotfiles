
;; disable welcome page
(setq inhibit-startup-message t)

(load-theme 'modus-operandi-tinted t)
(progn
  ;;ModeLine Color
  (set-face-background 'mode-line-active        "#d9d9d9")
  (set-face-foreground 'mode-line-active        "#000000")
  (set-face-background 'mode-line-inactive      "#e6e6e6")
  (set-face-foreground 'mode-line-inactive      "#585858")
  ;; Comment Face
  (set-face-foreground 'font-lock-comment-face "#7c6f64"))

(defun get-default-font ()
  (cond
   ((eq system-type 'windows-nt) "JetBrainsMono NFM-11")
   ((eq system-type 'gnu/linux) "JetBrainsMono Nerd Font Mono-15")))

(add-to-list 'default-frame-alist `(font . ,(get-default-font)))

;; (set-face-attribute 'default nil :font (font-spec :family "JetBrainsMono NFM"  :size 18 :weight 'normal))
;; (set-face-attribute 'variable-pitch nil :font (font-spec :family "Times New Roman" :size 24  :weight 'normal))

;; set seperate font for english and cjk
(when (eq system-type 'windows-nt)
  (set-face-attribute 'default nil :font (font-spec :family "JetBrainsMono NFM" :size 18))
  (set-fontset-font t 'unicode (font-spec :family "Segoe UI Emoji"))
  (set-fontset-font t '(#x2ff0 . #x9ffc) (font-spec :family "LXGW Wenkai" :size 22 :weight 'regular)))


;; turn off UI elements
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq use-dialog-box nil)

;; date & time
(setq display-time-format "[%a %d, %I:%M]")
(display-time-mode 1)
(setq display-time-default-load-average nil)
(setq display-time-day-and-date t)

;; 'face 'modeline-display-time

;; line numbers
(column-number-mode)
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)


;; disable line numbers for some modes
(dolist (mode '(;;org-mode-hook
                term-mode-hook
                shell-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))


;; end
(provide 'init-ui)
