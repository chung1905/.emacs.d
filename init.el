;;; init.el --- Emacs init file
;;; Commentary:
;;; Code:
;; Define load custom .el file function
;; Source: https://stackoverflow.com/a/2079146/6881855
(defconst user-init-dir "~/.emacs.d/els.d/")
(defun load-user-file (file)
  "Load a FILE in current user's configuration directory."
  (interactive "f")
  (load-file (expand-file-name file user-init-dir)))

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

(load-user-file "general.el")
(load-user-file "global-key.el")
(load-user-file "docker-mode.el")
(load-user-file "java-mode.el")
(load-user-file "php-mode.el")
(load-user-file "web-mode.el")
(load-user-file "angularjs-mode.el")

(use-package diminish
  :ensure t
  :diminish eldoc-mode)

(use-package counsel
  :ensure t
  :diminish ivy-mode
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  :bind (("C-f" . swiper)
	 ("M-x" . counsel-M-x)
	 ("C-c C-r" . ivy-resume)
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
  :bind ("C-w" . er/expand-region))

(use-package crux
  :ensure t
  :bind
  ("C-x C-x" . crux-smart-kill-line)
  ("S-<return>" . crux-smart-open-line-above)
  ("C-S-<return>". crux-smart-open-line)
  ("C-c n" . crux-cleanup-buffer-or-region)
  ("C-c f" . crux-recentf-find-file)
  ("C-a" . crux-move-beginning-of-line)
  ("<home>" . crux-move-beginning-of-line))

(use-package projectile
  :ensure t
  ;; :custom
  ;; (projectile-git-command "git ls-files -zco" "Search files which are ignored by git.")
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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (dockerfile-mode use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;;; init.el ends here
