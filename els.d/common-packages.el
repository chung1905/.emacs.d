;;; common-packages.el --- Install common packages
;;; Commentary:
;;; Code:

(use-package treemacs
  :ensure t
  :defer t
  :config
  (treemacs))

(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t)

(use-package treemacs-icons-dired
  :after (treemacs dired)
  :ensure t
  :config (treemacs-icons-dired-mode))

(use-package treemacs-magit
  :after (treemacs magit)
  :ensure t)

(use-package lsp-mode
  :ensure t
  :config
  (lsp-treemacs-sync-mode 1))

(use-package dap-mode
  :ensure t)

(use-package diminish
  :ensure t
  :diminish eldoc-mode abbrev-mode auto-revert-mode)

(use-package magit
  :ensure t)

(use-package dumb-jump
  :ensure t)

(use-package multiple-cursors
  :ensure t)

(use-package diff-hl
  :ensure t
  :config
  (global-diff-hl-mode)
  (diff-hl-flydiff-mode +1)
  (unless (display-graphic-p)
      (diff-hl-margin-mode)))

(use-package whitespace
  :ensure t
  :diminish global-whitespace-mode
  :custom
  (whitespace-style '(face trailing tabs lines-tail tab-mark))
  (whitespace-line-column 120)
  :config
  (global-whitespace-mode))

(use-package company
  :ensure t
  :diminish company-mode
  :config
  (global-company-mode +1))

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

;; To use swiper with options (eg. case sensitive)
(use-package ivy-hydra
  :ensure t)

(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :config
  (progn
    (require 'smartparens-config)
    (smartparens-global-mode 1)
    (show-paren-mode t)))

(use-package monokai-theme
  :ensure t
  :config
  (load-theme 'monokai t))

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
  ("<home>" . crux-move-beginning-of-line)
  ("C-M-j" . crux-move-beginning-of-line))

(use-package projectile
  :ensure t
  ;; :custom
  ;; (projectile-git-command "git ls-files -zco" "Search files which are ignored by git.")
  :config
  (projectile-mode +1)
  :diminish projectile-mode
  :bind-keymap
  ("C-p" . projectile-command-map)
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

(use-package yasnippet-snippets
  :ensure t)

(use-package flycheck
  :ensure t
  :diminish flycheck-mode
  :config
  (global-flycheck-mode t))

;;; common-packages.el ends here
