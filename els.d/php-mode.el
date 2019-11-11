;;; php-mode.el --- PHP config file
;;; Commentary:
;;; Code:
(use-package php-mode
  :ensure t)

(use-package ac-php
  :ensure t
  :custom (ac-php-tags-path (file-truename (concat user-emacs-directory "ac-php"))))

(use-package company-php
  :ensure t)

(add-hook 'php-mode-hook
          '(lambda ()
             ;; Enable company-mode
             (company-mode t)
             (require 'company-php)

             ;; Enable ElDoc support (optional)
             (ac-php-core-eldoc-setup)

             (set (make-local-variable 'company-backends)
                  '((company-ac-php-backend company-dabbrev-code)
                    company-capf company-files))

             ;; Jump to definition (optional)
             (define-key php-mode-map (kbd "M-]")
               'ac-php-find-symbol-at-point)

             ;; Return back (optional)
             (define-key php-mode-map (kbd "M-[")
               'ac-php-location-stack-back)))

(use-package geben
  :ensure t)
;;; php-mode.el ends here
