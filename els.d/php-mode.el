;;; php-mode.el --- PHP config file
;;; Commentary:
;;; Code:
(use-package php-mode
  :ensure t)

(use-package lsp-mode
  :ensure t
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (php-mode . lsp))
  :commands lsp)

(use-package lsp-ui :ensure t :commands lsp-ui-mode)

(use-package lsp-ivy :ensure t :commands lsp-ivy-workspace-symbol)

(use-package lsp-treemacs :ensure t :commands lsp-treemacs-errors-list)

(use-package lsp-php
  :after lsp
  :config
  (setq lsp-serenata-server-path "~/bin/serenata.phar"))

;;; php-mode.el ends here
