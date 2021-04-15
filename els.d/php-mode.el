;;; php-mode.el --- PHP config file
;;; Commentary:
;;; Code:
(use-package phps-mode
  :ensure t)

(use-package lsp-mode
  :ensure t
  :hook (
         (php-mode . lsp)
         (phps-mode . lsp))
  :commands lsp)

(use-package lsp-ui :ensure t :commands lsp-ui-mode)

(use-package lsp-ivy :ensure t :commands lsp-ivy-workspace-symbol)

(use-package lsp-treemacs :ensure t :commands lsp-treemacs-errors-list)

(use-package lsp-php :after lsp)

(defun lsp-php-get-composer-dir ()
  "Get composer home directory if possible."
  (if (executable-find "composer")
      (replace-regexp-in-string "\n$" "" (shell-command-to-string "composer config --global home"))
    "~/.composer"))

(setq lsp-php-composer-dir (lsp-php-get-composer-dir))

(setq lsp-phpactor-path (f-join lsp-php-composer-dir "vendor/bin/phpactor"))

;;; php-mode.el ends here
