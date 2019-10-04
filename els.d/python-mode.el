;;; python-mode.el --- Python
;;; Commentary:
;;; Code:
(use-package anaconda-mode
  :ensure t
  :hook ((python-mode . anaconda-mode)
         (python-mode . anaconda-eldoc-mode)))

(use-package company-anaconda
  :ensure t
  :init
  (progn (eval-after-load "company"
           '(add-to-list 'company-backends 'company-anaconda))
         ))

;;; python-mode.el ends here
