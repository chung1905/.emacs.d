;;; php-mode.el --- PHP config file
;;; Commentary:
;;; Code:
(use-package php-mode
  :ensure t)

(use-package lsp-mode
  :ensure t
  :hook (
         (php-mode . lsp))
  :commands lsp)

(use-package lsp-ui :ensure t :commands lsp-ui-mode)

(use-package lsp-ivy :ensure t :commands lsp-ivy-workspace-symbol)

(use-package lsp-treemacs :ensure t :commands lsp-treemacs-errors-list)

(use-package lsp-php :after lsp)

(setq lsp-phpactor-path
      (concat
       (replace-regexp-in-string "\n$" "" (shell-command-to-string "composer config --global home"))
       "/vendor/bin/phpactor"))

;;; php-mode.el ends here
