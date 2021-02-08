;;; general.el --- Emacs
;;; Commentary:
;;; Code:

(fset 'yes-or-no-p 'y-or-n-p)
(toggle-frame-maximized)
(menu-bar-mode -1)
(global-hl-line-mode +1)
(column-number-mode +1)
(global-auto-revert-mode t)
(desktop-save-mode 1)

(setq ring-bell-function 'ignore)
(setq save-interprogram-paste-before-kill t)
(setq inhibit-startup-screen t)
(setq dired-listing-switches "-alh")
(setq-default create-lockfiles nil)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

(if (display-graphic-p)
    (progn
      (toggle-scroll-bar -1)
      (tool-bar-mode -1)))

(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))

(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(when (version<= "26.0.50" emacs-version)
  (global-display-line-numbers-mode))

;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

;;; general.el ends here
