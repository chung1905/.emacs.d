;;; init.el --- Init Emacs
;;; Commentary:
;;; Code:
;; Define load custom .el file function
;; Source: https://stackoverflow.com/a/2079146/6881855
(defconst user-init-dir "~/.emacs.d/els.d/")
(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))

;; Require Emacs' package functionality
(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
	("gnu" . "https://elpa.gnu.org/packages/")
	("org" . "http://orgmode.org/elpa/")))
(package-initialize)

(load-user-file "general.el")
(load-user-file "global-key.el")

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(use-package diminish
  :ensure t)

(use-package counsel
  :ensure t
  :diminish ivy
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (setq search-default-mode #'char-fold-to-regex)
  :bind (("C-s" . swiper)
	 ("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file)))

(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :config
  (progn
    (require 'smartparens-config)
    (smartparens-global-mode 1)
    (show-paren-mode t)))

(use-package expand-region
  :ensure t
  :bind ("M-m" . er/expand-region))

(use-package crux
  :ensure t
  :bind
  ("C-x C-x" . crux-smart-kill-line)
  ("S-<return>" . crux-smart-open-line-above)
  ("C-S-<return>". crux-smart-open-line)
  ("C-c n" . crux-cleanup-buffer-or-region)
  ("C-c f" . crux-recentf-find-file)
  ("C-a" . crux-move-beginning-of-line))

(use-package projectile
  :ensure t
  :config
  (projectile-mode +1)
  :bind-keymap
  ("C-c p" . projectile-command-map))

(use-package counsel-projectile
  :ensure t
  :config
  (counsel-projectile-mode)
)

(use-package yasnippet
  :ensure t
  :diminish yas-minor-mode
  :config
  (yas-global-mode 1))

(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode t))

(use-package php-mode
  :ensure t)

(use-package ac-php
  :ensure t)

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
;;; init.el ends here
