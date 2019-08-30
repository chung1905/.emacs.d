;;; general.el --- Emacs
;;; Commentary:
;;; Code:

(fset 'yes-or-no-p 'y-or-n-p)
(toggle-frame-maximized)
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(global-hl-line-mode +1)
(setq inhibit-startup-screen t)
(setq frame-title-format
      '((:eval (if (buffer-file-name)
       (abbreviate-file-name (buffer-file-name))
       "%b"))))
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(add-hook 'before-save-hook 'whitespace-cleanup)

(when (version<= "26.0.50" emacs-version)
  (global-display-line-numbers-mode))

;;; general.el ends here
