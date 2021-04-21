;;; php-mode.el --- PHP config file
;;; Commentary:
;;; Code:

(use-package lsp-mode
  :ensure t
  :hook ((php-mode . lsp)
         (phps-mode . lsp))
  :commands lsp)

(use-package lsp-ui :ensure t :commands lsp-ui-mode)

(use-package lsp-ivy :ensure t :commands lsp-ivy-workspace-symbol)

(use-package lsp-treemacs :ensure t :commands lsp-treemacs-errors-list)

(use-package lsp-php :after lsp)

(when (executable-find "phpactor") (setq lsp-phpactor-path "phpactor"))

;;; php-mode.el ends here
