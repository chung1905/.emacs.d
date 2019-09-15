;;; php-mode.el --- PHP config file
;;; Commentary:
;;; Code:
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

(use-package geben
  :ensure t)
;;; php-mode.el ends here
