;; Define load custom .el file function
;; Source: https://stackoverflow.com/a/2079146/6881855
(defconst user-init-dir "~/.emacs.d/els.d/")
(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))

(fset 'yes-or-no-p 'y-or-n-p)
(toggle-frame-maximized)
(menu-bar-mode 0)

;; Require Emacs' package functionality
(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
     	 ("gnu" . "https://elpa.gnu.org/packages/")
         ("org" . "http://orgmode.org/elpa/")))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(use-package php-mode
  :ensure t)

;;(use-package counsel
;;  :ensure t
;;  :config
;;  (ivy-mode 1))

(use-package undo-tree
  :ensure t
  :config
  (global-set-key (kbd "C-z") 'undo-tree-undo)
  (global-set-key (kbd "C-S-Z") 'undo-tree-redo))

(use-package projectile
  :ensure t
  :config
  (projectile-mode +1)
  :bind-keymap
  ("C-c p" . projectile-command-map))

(use-package yasnippet
  :ensure t
  :diminish yas-minor-mode
  :config
  (yas-global-mode 1))

(use-package ac-php
  :ensure t)

(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode t))

(add-hook 'php-mode-hook
          '(lambda ()
             ;; Enable auto-complete-mode
             (auto-complete-mode t)

             ;; (require 'ac-php)
             (setq ac-sources '(ac-source-php))

             ;; Enable ElDoc support (optional)
             (ac-php-core-eldoc-setup)

             ;; Jump to definition (optional)
             (define-key php-mode-map (kbd "M-]")
               'ac-php-find-symbol-at-point)

             ;; Return back (optional)
             (define-key php-mode-map (kbd "M-[")
               'ac-php-location-stack-back)))

(load-user-file "global-key.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
