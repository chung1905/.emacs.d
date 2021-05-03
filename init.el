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
        ("gnu" . "https://elpa.gnu.org/packages/")))
        ;; ("org" . "http://orgmode.org/elpa/")))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(load-user-file "general.el")
(load-user-file "global-key.el")
(load-user-file "common-packages.el")
(load-user-file "docker-mode.el")
(load-user-file "python-mode.el")
;; (load-user-file "java-mode.el")
(load-user-file "php-mode.el")
(load-user-file "rust-mode.el")
(load-user-file "web-mode.el")
;; (load-user-file "angularjs-mode.el")
;; (load-user-file "twig-mode.el")
(load-user-file "yaml-mode.el")
(load-user-file "json-mode.el")
(load-user-file "cmake.el")

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
